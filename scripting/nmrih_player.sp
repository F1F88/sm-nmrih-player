#pragma newdecls required
#pragma semicolon 1

#include <sourcemod>
#include <dhooks>
#include <sdkhooks>

#include <vscript_proxy>

#include <log4sp>
#undef  REQUIRE_PLUGIN
#include <log4sp/registry>
#include <nmrih_gamerules>
#define REQUIRE_PLUGIN

#include <nmrih_player>

#define PLUGIN_NAME        "Library NMRiH Player"
#define PLUGIN_DESCRIPTION "Library NMRiH Player"
#define PLUGIN_VERSION     "1.16.4"
#define LOGGER_NAME        "lib-player"

public Plugin myinfo =
{
    name        = PLUGIN_NAME,
    author      = "F1F88",
    description = PLUGIN_DESCRIPTION,
    version     = PLUGIN_VERSION,
    url         = "https://github.com/F1F88/sm-nmrih-player"
};


enum OperatingSystem
{
    OS_Unknown  = -1,
    OS_Win32    = 0,
    OS_Win64    = 1,
    OS_Linux32  = 10,
    OS_Linux64  = 11,
    OS_Mac32    = 20,
    OS_Mac64    = 21
}


OperatingSystem g_eOS = OS_Unknown;
Logger          g_hLogger = null;


#include "nmrih_player/detour.sp"
#include "nmrih_player/functions.sp"


public APLRes AskPluginLoad2(Handle myself, bool late, char[] error, int err_max)
{
    /* ------- Load Detour ------- */
    CreateDetourGlobalForwards();

    /* ------- Load Calls ------- */
    LoadFunctionsNatives();

    return APLRes_Success;
}

public void OnPluginStart()
{
    /* ------- Log Debug ------- */
    g_hLogger = CreateLogger();

    /* ------- Load GameData ------- */
    GameData gamedata = new GameData("nmrih_player.games");
    if (!gamedata)
        g_hLogger.FatalF("Couldn't find nmrih_player.games gamedata");

    g_eOS = view_as<OperatingSystem>(gamedata.GetOffset("OS"));
    if (g_eOS == OS_Unknown)
        g_hLogger.FatalF("Failed to read gamedata offset of \"OS\"");
    else
        g_hLogger.DebugF("Read gamedata \"OS\" offset %d.", g_eOS);

    LoadFunctionsCalls(gamedata);
    LoadDetourFunctions(gamedata);
    delete gamedata;

    /* ------- Load ConVar ------- */
    ValidConVars();
    CreateConVar("sm_lib_nmrih_player_version", PLUGIN_VERSION, PLUGIN_DESCRIPTION, FCVAR_SPONLY | FCVAR_DONTRECORD);

    /* ------- Register Libray ------- */
    RegPluginLibrary("nmrih_player");

    g_hLogger.Info("[SM] " ... PLUGIN_NAME ... " (" ... PLUGIN_VERSION ... ") initialize complete!");
}

public void OnAllPluginsLoaded()
{
    if (!LibraryExists("nmrih_gamerules"))
    {
        g_hLogger.Warn("The library \"nmrih_gamerules\" does not exist, NMR_Player.ForceSpawn is unavailable.");
    }

    if (!LoggerRegistry.IsAvailable())
    {
        g_hLogger.Warn("The plugin log4sp_manager is unavailable.");
    }
    else
    {
        LoggerRegistry.Instance().RegisterOrReplaceLogger(g_hLogger);
    }
}

public void OnPluginEnd()
{
    if (LoggerRegistry.IsAvailable())
        LoggerRegistry.Instance().Drop(LOGGER_NAME);

    delete g_hLogger;
}


static Logger CreateLogger()
{
    char name[] = LOGGER_NAME;
    char file[] = "logs/lib/player.log";
    const int maxFileSize = 1024 * 1024 * 8; // MB
    const int maxFiles    = 2;

    char filename[PLATFORM_MAX_PATH];
    BuildPath(Path_SM, filename, sizeof(filename), file);
    RotatingFileSink rotatingFileSink = new RotatingFileSink(filename, maxFileSize, maxFiles);
    ServerConsoleSink serverConsoleSink = new ServerConsoleSink();

    Logger logger = new Logger(name);

#if defined DEBUG || defined _DEBUG
    // 调试模式不考虑性能
    // 记录所有日志，并立即刷写
    logger.SetLevel(LogLevel_Trace);
    logger.SetFlushLevel(LogLevel_Trace);
#else
    // 非调试模式需要保证性能，同时避免日志刷屏控制台
    // 记录 Info 级别以上日志，并按需刷写
    // 控制台仅输出 Warn 级别以上的日志
    serverConsoleSink.SetLevel(LogLevel_Warn);
#endif

    logger.AddSinkAndClose(rotatingFileSink);
    logger.AddSinkAndClose(serverConsoleSink);

    // OnPluginStart 阶段, Error/Fatal 日志可以让插件加载失败
    // 后续 Native、Detour 阶段, Error/Fatal 日志可以在参数校验失败时结束回调
    // 注意: nmrih_player.inc 里纯 sp 实现（不走 native）的 api 需要 log4sp_manager
    //      才能用 logger.Fatal 否则直接使用 ThrowError
    logger.SetThrowLevel(LogLevel_Error);
    return logger;
}

/* 不必要，但能更早的发现问题 */
static void ValidConVars()
{
    char convars[][] = {
        "inv_maxcarry",
        "inv_ammoweight",
        "sv_stam_jumpcost",
        "sv_bleedout_jump_stam_mult"
    };

    for (int i = 0; i < sizeof(convars); ++i)
    {
        if (!FindConVar(convars[i]))
        {
            g_hLogger.FatalF("Failed to load convar %s", convars[i]);
        }
    }
}
