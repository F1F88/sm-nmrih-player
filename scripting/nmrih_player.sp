#include <sourcemod>

// detour.sp
#include <dhooks>
#include <sdkhooks>

// funcions.sp
#include <vscript_proxy>

// netprops.sp

// All
#define LOG4SP_NO_EXT
#include <log4sp>
#include <nmrih_player>

#pragma newdecls required
#pragma semicolon 1

#define PLUGIN_NAME        "CNMRIH_Player_Utils"
#define PLUGIN_DESCRIPTION "CNMRIH_Player Utils"
#define PLUGIN_VERSION     "1.10.0"

public Plugin myinfo =
{
    name        = PLUGIN_NAME,
    author      = "F1F88",
    description = PLUGIN_DESCRIPTION,
    version     = PLUGIN_VERSION,
    url         = "https://github.com/F1F88/"
};



// int OS;
Logger  log;

#include "nmrih_player/detour.sp"
#include "nmrih_player/netprops.sp"
#include "nmrih_player/functions.sp"


public APLRes AskPluginLoad2(Handle myself, bool late, char[] error, int err_max)
{
    /* ------- Load NetProps ------- */
    LoadNetPropsOffset();
    CreateNetPropsNatives();

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
        SetFailState("Couldn't find nmrih_player.games gamedata");

    // if ((OS = gamedata.GetOffset("OS")) == -1)
    //     SetFailState("Failed to read gamedata offset of \"OS\"");

    LoadFunctionsCalls(gamedata);
    LoadDetourFunctions(gamedata);
    delete gamedata;

    /* ------- Load ConVar ------- */
    CreateConVar("sm_nmrih_player_version", PLUGIN_VERSION, PLUGIN_DESCRIPTION, FCVAR_SPONLY | FCVAR_DONTRECORD);

    /* ------- Register Libray ------- */
    RegPluginLibrary("nmrih_player");

    /* ------- Log Debug ------- */
    Sink sinks[2];
    sinks[0] = new ServerConsoleSinkMT();
    sinks[0].SetLevel(LogLevel_Info);

    sinks[1] = new RotatingFileSinkMT("logs/lib/player.log", 1024 * 1024 * 4, 10, .rotateOnOpen=true);
    sinks[1].SetLevel(LogLevel_Trace);

    log = new Logger("lib-player", sinks, 2, .async=true);
    log.SetLevel(LogLevel_Trace);

    delete sinks[0];
    delete sinks[1];

    // DebugNetPropsOffset();
    PrintToServer("********** Plugin %s Initialize Complete! **********", PLUGIN_NAME);
}



stock void ThrowCallNativeError(int error, Handle plugin, const char[] reasonFmt, any...)
{
    char reason[256];
    VFormat(reason, sizeof(reason), reasonFmt, 4);

    char nativeFunc[PLATFORM_MAX_PATH];
    char mathodName[PLATFORM_MAX_PATH];

    char pluginFunc[PLATFORM_MAX_PATH];
    char pluginName[PLATFORM_MAX_PATH];
    int pluginLine;

    GetPluginName(plugin, pluginName, sizeof(pluginName));

    FrameIterator frames = new FrameIterator();
    frames.Next();
    frames.Next();
    frames.GetFunctionName(nativeFunc, sizeof(nativeFunc));

    frames.Next();
    frames.Next();
    frames.GetFunctionName(mathodName, sizeof(mathodName));

    frames.Next();
    // GetPluginName(plugin, pluginName, sizeof(pluginName));
    frames.GetFunctionName(pluginFunc, sizeof(pluginFunc));
    pluginLine = frames.LineNumber;
    delete frames;

    int sep = FindCharInString(pluginName, '\\', true);
    if (sep == -1)
        sep = FindCharInString(pluginName, '/', true);
    Format(pluginName, sizeof(pluginName), "%s", pluginName[sep + 1]);

    log.ThrowErrorAmxTpl(LogLevel_Error, "'%s::%s::%d' failed to call native '%s::%s'. Code: %d. Reason: %s", pluginName, pluginFunc, pluginLine, mathodName, nativeFunc, error, reason);

    // ThrowNativeError(error, "'%s::%s::%d' failed to call native '%s::%s'. Reason: %s", pluginName, pluginFunc, pluginLine, mathodName, nativeFunc, reason);
}

stock void GetPluginName(Handle plugin, char[] result, int maxlength)
{
    GetPluginInfo(plugin, PlInfo_Name, result, maxlength);

    if (result[0] == '\0')
    {
        char buffer[PLATFORM_MAX_PATH];
        GetPluginFilename(plugin, buffer, sizeof(buffer));

        int sep = FindCharInString(buffer, '\\', true);
        if (sep == -1)
            sep = FindCharInString(buffer, '/', true);

        strcopy(result, maxlength, buffer[sep + 1]);
    }
}
