#pragma newdecls required
#pragma semicolon 1

#include <sourcemod>
#include <dhooks>
#include <sdkhooks>

#include <vscript_proxy>

#include <log4sp>
#include <nmrih_player>

#undef REQUIRE_PLUGIN
#include <nmrih_gamerules>

#define PLUGIN_NAME        "Library NMRiH Player"
#define PLUGIN_DESCRIPTION "Library NMRiH Player"
#define PLUGIN_VERSION     "1.16.3"

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


OperatingSystem OS;


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
    /* ------- Load GameData ------- */
    GameData gamedata = new GameData("nmrih_player.games");
    if (!gamedata)
        Log(LogLevel_Fatal, "Couldn't find nmrih_player.games gamedata");

    if ((OS = view_as<OperatingSystem>(gamedata.GetOffset("OS"))) == OS_Unknown)
        Log(LogLevel_Fatal, "Failed to read gamedata offset of \"OS\"");
    else
        Log(LogLevel_Debug, "Read gamedata \"OS\" offset %d.", OS);

    LoadFunctionsCalls(gamedata);
    LoadDetourFunctions(gamedata);
    delete gamedata;

    /* ------- Load ConVar ------- */
    ValidConVars();
    CreateConVar("sm_lib_nmrih_player_version", PLUGIN_VERSION, PLUGIN_DESCRIPTION, FCVAR_SPONLY | FCVAR_DONTRECORD);

    /* ------- Register Libray ------- */
    RegPluginLibrary("nmrih_player");

    Log(LogLevel_Info, "[SM] " ... PLUGIN_NAME ... " (" ... PLUGIN_VERSION ... ") initialize complete!");
}

public void OnAllPluginsLoaded()
{
    if (!LibraryExists("nmrih_gamerules"))
    {
        Log(LogLevel_Warn, "The library \"nmrih_gamerules\" does not exist, NMR_Player.ForceSpawn is unavailable.");
    }
}


/* Stocks */
stock void Log(LogLevel lvl, const char[] fmt, any ...)
{
    static Logger logger = null;

    if (!logger)
    {
        char name[] = "lib-player";
        char file[] = "logs/lib/player.log";
        const int maxFileSize = 1024 * 1024 * 8; // MB
        const int maxFiles    = 2;

        char filename[PLATFORM_MAX_PATH];
        BuildPath(Path_SM, filename, sizeof(filename), file);
        RotatingFileSink rotatingFileSink = new RotatingFileSink(filename, maxFileSize, maxFiles);
        ServerConsoleSink serverConsoleSink = new ServerConsoleSink();

        logger = new Logger(name);
        logger.AddSink(rotatingFileSink);
        logger.AddSink(serverConsoleSink);

#if defined DEBUG || defined __DEBUG
        logger.SetLevel(LogLevel_Trace);
        logger.FlushOn(LogLevel_Trace);
#else
        serverConsoleSink.SetLevel(LogLevel_Warn);
#endif
        rotatingFileSink.Close();
        serverConsoleSink.Close();
    }

    if (!logger.ShouldLog(lvl))
        return;

    char buffer[1024];
#if defined __sourcepawn2
    FormatEx(buffer, sizeof(buffer), fmt, ...);
#else
    VFormat(buffer, sizeof(buffer), fmt, 3);
#endif

    if (lvl <= LogLevel_Warn)
    {
        logger.Log(lvl, buffer);
    }
    else if (lvl == LogLevel_Error)
    {
        logger.LogStackTrace(lvl, buffer);
        ThrowError("%s", buffer);
    }
    else if (lvl >= LogLevel_Fatal)
    {
        logger.LogStackTrace(lvl, buffer);
        SetFailState("%s", buffer);
    }
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
            Log(LogLevel_Fatal, "Failed to load convar %s", convars[i]);
        }
    }
}
