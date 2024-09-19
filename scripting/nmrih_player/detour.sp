#include <dhooks>
#include <sdkhooks>

/**
 * 1. scripting/nmrih_player.inc enum Player_HookType
 * 2. scripting/nmrih_player.inc typeset Player_HookCallBack
 * 3. scripting/nmrih_player/hooks.sp enum
 * 4. scripting/nmrih_player/hooks.sp LoadHooksGlobalForward
 * 5. scripting/nmrih_player/hooks.sp LoadHooksDetour
 * 6. scripting/nmrih_player/hooks.sp Native_PlayerHook
 * 7. scripting/nmrih_player/hooks.sp Native_PlayerUnHook
 * 8. scripting/nmrih_player/hooks.sp DHookCallback
 */

#pragma newdecls required
#pragma semicolon 1

enum
{
    // FWD_OnFlashlightTurnOn,
    // FWD_OnFlashlightTurnOff,
    FWD_CureInfection,
    FWD_CureInfectionPost,
    FWD_BecomeInfected,
    FWD_BecomeInfectedPost,
    FWD_TakePills,
    FWD_TakePillsPost,
    FWD_OnGrabbedBegin,
    FWD_OnGrabbedBeginPost,
    FWD_ApplyBandage,
    FWD_ApplyBandagePost,
    FWD_ApplyFirstAidKit,
    FWD_ApplyFirstAidKitPost,
    FWD_ApplyVaccine,
    FWD_ApplyVaccinePost,
    FWD_BleedOut,
    FWD_BleedOutPost,
    FWD_StopBleedingOut,
    FWD_StopBleedingOutPost,

    FWD_Total
}

static GlobalForward hGlobalForwards[FWD_Total];


void CreateDetourGlobalForwards()
{
    hGlobalForwards[FWD_CureInfection]         = new GlobalForward("OnPlayerCureInfection",         ET_Hook,    Param_Cell);
    hGlobalForwards[FWD_CureInfectionPost]     = new GlobalForward("OnPlayerCureInfectionPost",     ET_Ignore,  Param_Cell);
    hGlobalForwards[FWD_BecomeInfected]        = new GlobalForward("OnPlayerBecomeInfected",        ET_Hook,    Param_Cell);
    hGlobalForwards[FWD_BecomeInfectedPost]    = new GlobalForward("OnPlayerBecomeInfectedPost",    ET_Ignore,  Param_Cell);
    hGlobalForwards[FWD_TakePills]             = new GlobalForward("OnPlayerTakePills",             ET_Hook,    Param_Cell);
    hGlobalForwards[FWD_TakePillsPost]         = new GlobalForward("OnPlayerTakePillsPost",         ET_Ignore,  Param_Cell);
    hGlobalForwards[FWD_OnGrabbedBegin]        = new GlobalForward("OnPlayerOnGrabbedBegin",        ET_Hook,    Param_Cell, Param_Cell);
    hGlobalForwards[FWD_OnGrabbedBeginPost]    = new GlobalForward("OnPlayerOnGrabbedBeginPost",    ET_Ignore,  Param_Cell, Param_Cell);
    hGlobalForwards[FWD_ApplyBandage]          = new GlobalForward("OnPlayerApplyBandage",          ET_Hook,    Param_Cell);
    hGlobalForwards[FWD_ApplyBandagePost]      = new GlobalForward("OnPlayerApplyBandagePost",      ET_Ignore,  Param_Cell);
    hGlobalForwards[FWD_ApplyFirstAidKit]      = new GlobalForward("OnPlayerApplyFirstAidKit",      ET_Hook,    Param_Cell);
    hGlobalForwards[FWD_ApplyFirstAidKitPost]  = new GlobalForward("OnPlayerApplyFirstAidKitPost",  ET_Ignore,  Param_Cell);
    hGlobalForwards[FWD_ApplyVaccine]          = new GlobalForward("OnPlayerApplyVaccine",          ET_Hook,    Param_Cell);
    hGlobalForwards[FWD_ApplyVaccinePost]      = new GlobalForward("OnPlayerApplyVaccinePost",      ET_Ignore,  Param_Cell);
    hGlobalForwards[FWD_BleedOut]              = new GlobalForward("OnPlayerBleedOut",              ET_Hook,    Param_Cell);
    hGlobalForwards[FWD_BleedOutPost]          = new GlobalForward("OnPlayerBleedOutPost",          ET_Ignore,  Param_Cell);
    hGlobalForwards[FWD_StopBleedingOut]       = new GlobalForward("OnPlayerStopBleedingOut",       ET_Hook,    Param_Cell);
    hGlobalForwards[FWD_StopBleedingOutPost]   = new GlobalForward("OnPlayerStopBleedingOutPost",   ET_Ignore,  Param_Cell);
}

void LoadDetourFunctions(GameData gamedata)
{
    DetourPlayer(gamedata, "CNMRiH_Player::CureInfection",          CureInfection,          CureInfectionPost);
    DetourPlayer(gamedata, "CNMRiH_Player::BecomeInfected",         BecomeInfected,         BecomeInfectedPost);
    DetourPlayer(gamedata, "CNMRiH_Player::TakePills",              TakePills,              TakePillsPost);
    DetourPlayer(gamedata, "CNMRiH_Player::OnGrabbedBegin",         OnGrabbedBegin,         OnGrabbedBeginPost);
    DetourPlayer(gamedata, "CNMRiH_Player::ApplyBandage",           ApplyBandage,           ApplyBandagePost);
    DetourPlayer(gamedata, "CNMRiH_Player::ApplyFirstAidKit",       ApplyFirstAidKit,       ApplyFirstAidKitPost);
    DetourPlayer(gamedata, "CNMRiH_Player::ApplyVaccine",           ApplyVaccine,           ApplyVaccinePost);
    DetourPlayer(gamedata, "CNMRiH_Player::BleedOut",               BleedOut,               BleedOutPost);
    DetourPlayer(gamedata, "CNMRiH_Player::StopBleedingOut",        StopBleedingOut,        StopBleedingOutPost);

    // DetourPlayer(gamedata, "CNMRiH_Player::", , Post))
}

static void DetourPlayer(Handle gamedata, const char[] name, DHookCallback PreCB, DHookCallback PostCB)
{
    DynamicDetour detour = DynamicDetour.FromConf(gamedata, name);
    if (detour == null)
        SetFailState("Failed to setup detour for Functions \"%s\"", name);

    if (!detour.Enable(Hook_Pre, PreCB))
        SetFailState("Failed to enable detour \"%s\"", name);

    if (!detour.Enable(Hook_Post, PostCB))
        SetFailState("Failed to enable detour \"%s\" Post", name);
}


// 玩家结束感染
// Note1: 死亡不会触发
// Note2: 复活会连续触发两次
// Note3: 使用 疫苗 后只会触发一次
static MRESReturn CureInfection(int pThis)
{
    int player = pThis;
    log.TraceAmxTpl("player %d CureInfection", player);

    Action result;
    Call_StartForward(hGlobalForwards[FWD_CureInfection]);
    Call_PushCell(player);
    Call_Finish(result);
    if (result != Plugin_Continue)
        return MRES_Supercede;

    return MRES_Ignored;
}

static MRESReturn CureInfectionPost(int pThis)
{
    int player = pThis;
    log.TraceAmxTpl("player %d CureInfection Post", player);

    Call_StartForward(hGlobalForwards[FWD_CureInfectionPost]);
    Call_PushCell(player);
    Call_Finish();
    return MRES_Ignored;
}

// 玩家开始感染
// Note1: 即使已注射疫苗仍会触发此绕行
static MRESReturn BecomeInfected(int pThis)
{
    int player = pThis;
    log.TraceAmxTpl("player %d BecomeInfected", player);

    Action result;
    Call_StartForward(hGlobalForwards[FWD_BecomeInfected]);
    Call_PushCell(player);
    Call_Finish(result);
    if (result != Plugin_Continue)
        return MRES_Supercede;

    return MRES_Ignored;
}

static MRESReturn BecomeInfectedPost(int pThis)
{
    int player = pThis;
    log.TraceAmxTpl("player %d BecomeInfected Post", player);

    Call_StartForward(hGlobalForwards[FWD_BecomeInfectedPost]);
    Call_PushCell(player);
    Call_Finish();
    return MRES_Ignored;
}

// 用 UserMessage - Cure 替代
static MRESReturn TakePills(int pThis)
{
    int player = pThis;
    log.TraceAmxTpl("player %d TakePills", player);

    Action result;
    Call_StartForward(hGlobalForwards[FWD_TakePills]);
    Call_PushCell(player);
    Call_Finish(result);
    if (result != Plugin_Continue)
        return MRES_Supercede;

    return MRES_Ignored;
}

static MRESReturn TakePillsPost(int pThis)
{
    int player = pThis;
    log.TraceAmxTpl("player %d TakePills Post", player);

    Call_StartForward(hGlobalForwards[FWD_TakePillsPost]);
    Call_PushCell(player);
    Call_Finish();
    return MRES_Ignored;
}

static MRESReturn OnGrabbedBegin(int pThis, DHookParam hParams)
{
    int player = pThis;
    int causer = hParams.Get(1);
    log.TraceAmxTpl("player %d OnGrabbedBegin by causer %d", player, causer);

    Action result;
    Call_StartForward(hGlobalForwards[FWD_OnGrabbedBegin]);
    Call_PushCell(player);
    Call_PushCell(causer);
    Call_Finish(result);
    if (result != Plugin_Continue)
        return MRES_Supercede;

    return MRES_Ignored;
}

static MRESReturn OnGrabbedBeginPost(int pThis, DHookParam hParams)
{
    int player = pThis;
    int causer = hParams.Get(1);
    log.TraceAmxTpl("player %d OnGrabbedBegin Post by causer %d", player, causer);

    Call_StartForward(hGlobalForwards[FWD_OnGrabbedBeginPost]);
    Call_PushCell(player);
    Call_PushCell(causer);
    Call_Finish();
    return MRES_Ignored;
}

static MRESReturn ApplyBandage(DHookParam hParams)
{
    int player = hParams.Get(1);
    log.TraceAmxTpl("player %d ApplyBandage", player);

    Action result;
    Call_StartForward(hGlobalForwards[FWD_ApplyBandage]);
    Call_PushCell(player);
    Call_Finish(result);
    if (result != Plugin_Continue)
        return MRES_Supercede;

    return MRES_Ignored;
}

static MRESReturn ApplyBandagePost(DHookParam hParams)
{
    int player = hParams.Get(1);
    log.TraceAmxTpl("player %d ApplyBandage Post", player);

    Call_StartForward(hGlobalForwards[FWD_ApplyBandagePost]);
    Call_PushCell(player);
    Call_Finish();
    return MRES_Ignored;
}

static MRESReturn ApplyFirstAidKit(DHookParam hParams)
{
    int player = hParams.Get(1);
    log.TraceAmxTpl("player %d ApplyFirstAidKit", player);

    Action result;
    Call_StartForward(hGlobalForwards[FWD_ApplyFirstAidKit]);
    Call_PushCell(player);
    Call_Finish(result);
    if (result != Plugin_Continue)
        return MRES_Supercede;

    return MRES_Ignored;
}

static MRESReturn ApplyFirstAidKitPost(DHookParam hParams)
{
    int player = hParams.Get(1);
    log.TraceAmxTpl("player %d ApplyFirstAidKit Post", player);

    Call_StartForward(hGlobalForwards[FWD_ApplyFirstAidKitPost]);
    Call_PushCell(player);
    Call_Finish();
    return MRES_Ignored;
}

static MRESReturn ApplyVaccine(DHookParam hParams)
{
    int player = hParams.Get(1);
    log.TraceAmxTpl("player %d ApplyVaccine", player);

    Action result;
    Call_StartForward(hGlobalForwards[FWD_ApplyVaccine]);
    Call_PushCell(player);
    Call_Finish(result);
    if (result != Plugin_Continue)
        return MRES_Supercede;

    return MRES_Ignored;
}

static MRESReturn ApplyVaccinePost(DHookParam hParams)
{
    int player = hParams.Get(1);
    log.TraceAmxTpl("player %d ApplyVaccine Post", player);

    Call_StartForward(hGlobalForwards[FWD_ApplyVaccinePost]);
    Call_PushCell(player);
    Call_Finish();
    return MRES_Ignored;
}

static MRESReturn BleedOut(DHookParam hParams)
{
    int player = hParams.Get(1);
    log.TraceAmxTpl("player %d BleedOut", player);

    Action result;
    Call_StartForward(hGlobalForwards[FWD_BleedOut]);
    Call_PushCell(player);
    Call_Finish(result);
    if (result != Plugin_Continue)
        return MRES_Supercede;

    return MRES_Ignored;
}

static MRESReturn BleedOutPost(DHookParam hParams)
{
    int player = hParams.Get(1);
    log.TraceAmxTpl("player %d BleedOut Post", player);

    Call_StartForward(hGlobalForwards[FWD_BleedOutPost]);
    Call_PushCell(player);
    Call_Finish();
    return MRES_Ignored;
}

// 玩家结束流血
// Note1: 死亡不会触发
// Note2: 复活不会触发
// Note3: 使用 绷带、医疗包 后会连续触发两次
// Note4: 使用 医疗箱治疗后 只会触发一次
// Note5: 玩家 撤离后 只会触发一次
static MRESReturn StopBleedingOut(DHookParam hParams)
{
    int player = hParams.Get(1);
    log.TraceAmxTpl("player %d StopBleedingOut", player);

    Action result;
    Call_StartForward(hGlobalForwards[FWD_StopBleedingOut]);
    Call_PushCell(player);
    Call_Finish(result);
    if (result != Plugin_Continue)
        return MRES_Supercede;

    return MRES_Ignored;
}

static MRESReturn StopBleedingOutPost(DHookParam hParams)
{
    int player = hParams.Get(1);
    log.TraceAmxTpl("player %d StopBleedingOut Post", player);

    Call_StartForward(hGlobalForwards[FWD_StopBleedingOutPost]);
    Call_PushCell(player);
    Call_Finish();
    return MRES_Ignored;
}
