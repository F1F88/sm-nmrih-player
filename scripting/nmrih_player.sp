#include <sourcemod>

// detour.sp
#include <dhooks>
#include <sdkhooks>

// funcions.sp
#include <vscript_proxy>

// netprops.sp

// All
// #define LOG4SP_NO_EXT
#include <log4sp>
#include <nmrih_player>

#pragma newdecls required
#pragma semicolon 1

#define PLUGIN_NAME        "CNMRIH_Player_Utils"
#define PLUGIN_DESCRIPTION "CNMRIH_Player Utils"
#define PLUGIN_VERSION     "1.11.1"

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
    char path[PLATFORM_MAX_PATH];
    BuildPath(Path_SM, path, sizeof(path), "logs/lib/player.log");
    Sink sinks[2];
    sinks[0] = new ServerConsoleSink();
    sinks[0].SetLevel(LogLevel_Info);

    sinks[1] = new RotatingFileSink(path, 1024 * 1024 * 4, 10, .rotateOnOpen=true);
    sinks[1].SetLevel(LogLevel_Trace);

    log = new Logger("lib-player", sinks, 2);
    log.SetLevel(LogLevel_Trace);

    delete sinks[0];
    delete sinks[1];

    // DebugNetPropsOffset();
    log.InfoEx("********** Plugin %s Initialize Complete! **********", PLUGIN_NAME);
}
