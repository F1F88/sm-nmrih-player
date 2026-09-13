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
#define PLUGIN_VERSION     "1.16.2"

public Plugin myinfo =
{
    name        = PLUGIN_NAME,
    author      = "F1F88",
    description = PLUGIN_DESCRIPTION,
    version     = PLUGIN_VERSION,
    url         = "https://github.com/F1F88/sm-nmrih-player"
};


#define LIB_PLAYER_LOGGER_NAME              "lib-player"
#define LIB_PLAYER_LOGGER_FILE              "logs/lib/player.log"
#define LIB_PLAYER_LOGGER_MAX_FILE_SIZE     1024 * 1024 * 8         // MB
#define LIB_PLAYER_LOGGER_MAX_FILES         2

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
Logger          log;


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
        SetFailState("Couldn't find nmrih_player.games gamedata");

    if ((OS = view_as<OperatingSystem>(gamedata.GetOffset("OS"))) == OS_Unknown)
        SetFailState("Failed to read gamedata offset of \"OS\"");

    LoadFunctionsCalls(gamedata);
    LoadDetourFunctions(gamedata);
    delete gamedata;

    /* ------- Load ConVar ------- */
    ValidConVars();
    CreateConVar("sm_lib_nmrih_player_version", PLUGIN_VERSION, PLUGIN_DESCRIPTION, FCVAR_SPONLY | FCVAR_DONTRECORD);

    /* ------- Register Libray ------- */
    RegPluginLibrary("nmrih_player");

    /* ------- Log Debug ------- */
    char path[PLATFORM_MAX_PATH];
    BuildPath(Path_SM, path, sizeof(path), LIB_PLAYER_LOGGER_FILE);
    log = RotatingFileSink.CreateLogger(LIB_PLAYER_LOGGER_NAME, path, LIB_PLAYER_LOGGER_MAX_FILE_SIZE, LIB_PLAYER_LOGGER_MAX_FILES);
    log.AddSinkEx(new ServerConsoleSink()); // for debug

    // DebugNetPropsOffset();
    log.Info("Plugin \"" ... PLUGIN_NAME ... "\" (" ... PLUGIN_VERSION ... ") loaded successfully!");
}

public void OnAllPluginsLoaded()
{
    if (!LibraryExists("nmrih_gamerules"))
    {
        log.Warn("The library \"nmrih_gamerules\" does not exist, NMR_Player.ForceSpawn is unavailable.");
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
        if (FindConVar(convars[i]) == null)
        {
            SetFailState("Failed to load convar %s", convars[i]);
        }
    }
}
