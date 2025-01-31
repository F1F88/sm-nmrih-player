#include <sourcemod>
#include <dhooks>
#include <sdkhooks>

#include <vscript_proxy>

// #define LOG4SP_NO_EXT
#include <log4sp>
#include <nmrih_player>
#include <nmrih_gamerules>

#pragma newdecls required
#pragma semicolon 1

#define PLUGIN_NAME        "Library NMRiH Player"
#define PLUGIN_DESCRIPTION "Library NMRiH Player"
#define PLUGIN_VERSION     "1.15.2"

public Plugin myinfo =
{
    name        = PLUGIN_NAME,
    author      = "F1F88",
    description = PLUGIN_DESCRIPTION,
    version     = PLUGIN_VERSION,
    url         = "https://github.com/F1F88/"
};


#define LIB_PLAYER_LOGGER_NAME              "lib-player"
#define LIB_PLAYER_LOGGER_FILE              "logs/lib/player.log"
#define LIB_PLAYER_LOGGER_MAX_FILE_SIZE     1024 * 1024 * 8         // MB
#define LIB_PLAYER_LOGGER_MAX_FILES         2


// int OS;
int     cvar_InvMaxcarry;
int     cvar_InvAmmoweight;

float   cvar_SvBleedoutJumpStamMult;

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
    LoadConVars();
    CreateConVar("sm_lib_nmrih_player_version", PLUGIN_VERSION, PLUGIN_DESCRIPTION, FCVAR_SPONLY | FCVAR_DONTRECORD);

    /* ------- Register Libray ------- */
    RegPluginLibrary("nmrih_player");

    /* ------- Log Debug ------- */
    char path[PLATFORM_MAX_PATH];
    BuildPath(Path_SM, path, sizeof(path), LIB_PLAYER_LOGGER_FILE);
    log = RotatingFileSink.CreateLogger(LIB_PLAYER_LOGGER_NAME, path, LIB_PLAYER_LOGGER_MAX_FILE_SIZE, LIB_PLAYER_LOGGER_MAX_FILES);
    log.AddSinkEx(new ServerConsoleSink()); // for debug

    // DebugNetPropsOffset();
    log.Info("Library plugin \"" ... PLUGIN_NAME ... " (v" ... PLUGIN_VERSION ... ")\" initialize complete!");
}

public void OnAllPluginsLoaded()
{
    if (!LibraryExists("nmrih_gamerules"))
    {
        log.Warn("The library \"nmrih_gamerules\" does not exist, NMR_Player.ForceSpawn is unavailable.");
    }
}


static void LoadConVars()
{
    if (!LoadIntConVar("inv_maxcarry", OnCvarInvMaxcarryChange, cvar_InvMaxcarry))
        SetFailState("Failed to load convar inv_maxcarry");

    if (!LoadIntConVar("inv_ammoweight", OnCvarInvAmmoweightChange, cvar_InvAmmoweight))
        SetFailState("Failed to load convar inv_maxcarry");

    if (!LoadFloatConVar("sv_bleedout_jump_stam_mult", OnCvarSvBleedoutJumpStamMult, cvar_SvBleedoutJumpStamMult))
        SetFailState("Failed to load convar sv_bleedout_jump_stam_mult");
}

static void OnCvarInvMaxcarryChange(ConVar convar, const char[] oldValue, const char[] newValue)
{
    cvar_InvMaxcarry = convar.IntValue;
}

static void OnCvarInvAmmoweightChange(ConVar convar, const char[] oldValue, const char[] newValue)
{
    cvar_InvAmmoweight = convar.IntValue;
}

static void OnCvarSvBleedoutJumpStamMult(ConVar convar, const char[] oldValue, const char[] newValue)
{
    cvar_SvBleedoutJumpStamMult = convar.FloatValue;
}


stock bool LoadIntConVar(const char[] name, ConVarChanged callback, int &value)
{
    ConVar convar = FindConVar(name);
    if (convar == null)
        return false;

    convar.AddChangeHook(callback);
    value = convar.IntValue;
    return true;
}

stock bool LoadFloatConVar(const char[] name, ConVarChanged callback, float &value)
{
    ConVar convar = FindConVar(name);
    if (convar == null)
        return false;

    convar.AddChangeHook(callback);
    value = convar.FloatValue;
    return true;
}
