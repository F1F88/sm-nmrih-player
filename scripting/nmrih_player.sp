#include <sourcemod>
#include <dhooks>
#include <sdkhooks>

#include <vscript_proxy>

#define LOG4SP_NO_EXT
#include <log4sp>
#include <nmrih_player>
#include <nmrih_gamerules>

#pragma newdecls required
#pragma semicolon 1

#define PLUGIN_NAME        "CNMRIH_Player_Utils"
#define PLUGIN_DESCRIPTION "CNMRIH_Player Utils"
#define PLUGIN_VERSION     "1.13.0"

public Plugin myinfo =
{
    name        = PLUGIN_NAME,
    author      = "F1F88",
    description = PLUGIN_DESCRIPTION,
    version     = PLUGIN_VERSION,
    url         = "https://github.com/F1F88/"
};



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
    CreateConVar("sm_nmrih_player_version", PLUGIN_VERSION, PLUGIN_DESCRIPTION, FCVAR_SPONLY | FCVAR_DONTRECORD);

    /* ------- Register Libray ------- */
    RegPluginLibrary("nmrih_player");

    /* ------- Log Debug ------- */
    char path[PLATFORM_MAX_PATH];
    BuildPath(Path_SM, path, sizeof(path), "logs/lib/player.log");
    Sink sinks[2];
    sinks[0] = new ServerConsoleSink();
    sinks[0].SetLevel(LogLevel_Info);

    sinks[1] = new RotatingFileSink(path, 1024 * 1024 * 4, 10);
    sinks[1].SetLevel(LogLevel_Trace);

    log = new Logger("lib-player", sinks, 2);
    log.SetLevel(LogLevel_Trace);

    delete sinks[0];
    delete sinks[1];

    // DebugNetPropsOffset();
    log.InfoEx("********** Plugin %s Initialize Complete! **********", PLUGIN_NAME);
}

public void OnAllPluginsLoaded()
{
    if (!LibraryExists("nmrih_gamerules"))
    {
        log.Warn("The plugin 'nmrih_gamerules' does not exist, NMR_Player.ForceSpawn is unavailable.");
    }
}


void LoadConVars()
{
    if (!LoadIntConVar("inv_maxcarry", OnCvarInvMaxcarryChange, cvar_InvMaxcarry))
        SetFailState("Failed to load convar inv_maxcarry");

    if (!LoadIntConVar("inv_ammoweight", OnCvarInvAmmoweightChange, cvar_InvAmmoweight))
        SetFailState("Failed to load convar inv_maxcarry");

    if (!LoadFloatConVar("sv_bleedout_jump_stam_mult", OnCvarSvBleedoutJumpStamMult, cvar_SvBleedoutJumpStamMult))
        SetFailState("Failed to load convar sv_bleedout_jump_stam_mult");
}

void OnCvarInvMaxcarryChange(ConVar convar, const char[] oldValue, const char[] newValue)
{
    cvar_InvMaxcarry = convar.IntValue;
}

void OnCvarInvAmmoweightChange(ConVar convar, const char[] oldValue, const char[] newValue)
{
    cvar_InvAmmoweight = convar.IntValue;
}

void OnCvarSvBleedoutJumpStamMult(ConVar convar, const char[] oldValue, const char[] newValue)
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
