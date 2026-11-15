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
    g_hLogger.Trace("Starting to load detour functions ...");

    DetourPlayer(gamedata, "CNMRiH_Player::CureInfection",          CureInfection,          CureInfectionPost);
    DetourPlayer(gamedata, "CNMRiH_Player::BecomeInfected",         BecomeInfected,         BecomeInfectedPost);
    DetourPlayer(gamedata, "CNMRiH_Player::TakePills",              TakePills,              TakePillsPost);
    DetourPlayer(gamedata, "CNMRiH_Player::OnGrabbedBegin",         OnGrabbedBegin,         OnGrabbedBeginPost);
    DetourPlayer(gamedata, "CNMRiH_Player::ApplyBandage",           ApplyBandage,           ApplyBandagePost);

    if (g_eOS == OS_Linux32 || g_eOS == OS_Linux64 || g_eOS == OS_Win64)
    {
        DetourPlayer(gamedata, "CNMRiH_Player::ApplyFirstAidKit",   ApplyFirstAidKit,       ApplyFirstAidKitPost);
    }
    else
    {
        g_hLogger.Info("The CNMRiH_Player::ApplyFirstAidKit detour does not work on Win32.");
    }

    DetourPlayer(gamedata, "CNMRiH_Player::ApplyVaccine",           ApplyVaccine,           ApplyVaccinePost);

    if (g_eOS == OS_Linux32 || g_eOS == OS_Linux64)
    {
        DetourPlayer(gamedata, "CNMRiH_Player::BleedOut",           BleedOut,               BleedOutPost);
        DetourPlayer(gamedata, "CNMRiH_Player::StopBleedingOut",    StopBleedingOut,        StopBleedingOutPost);
    }
    else
    {
        g_hLogger.Info("The CNMRiH_Player::BleedOut detour does not work on Win32 & Win64.");
        g_hLogger.Info("The CNMRiH_Player::BleedOut StopBleedingOut does not work on Win32 & Win64.");
    }

    // DetourPlayer(gamedata, "CNMRiH_Player::", , Post))
}

static void DetourPlayer(Handle gamedata, const char[] name, DHookCallback PreCB, DHookCallback PostCB)
{
    DynamicDetour detour = DynamicDetour.FromConf(gamedata, name);
    if (!detour)
        g_hLogger.FatalF("Failed to setup detour for Functions \"%s\"", name);

    if (!detour.Enable(Hook_Pre, PreCB))
        g_hLogger.FatalF("Failed to enable detour \"%s\"", name);

    if (!detour.Enable(Hook_Post, PostCB))
        g_hLogger.FatalF("Failed to enable detour \"%s\" Post", name);

    g_hLogger.DebugF("Setup detour for function \"%s\".", name);
}


// 玩家结束感染
// Note1: 死亡不会触发
// Note2: 复活会连续触发两次
// Note3: 使用 疫苗 后只会触发一次
static MRESReturn CureInfection(int pThis)
{
    g_hLogger.TraceF("CNMRiH_Player::CureInfection this %d", pThis);
    int player = pThis;

    Action result;
    Call_StartForward(hGlobalForwards[FWD_CureInfection]);
    Call_PushCell(player);
    Call_Finish(result);

    g_hLogger.TraceF("CNMRiH_Player::CureInfection result %d.", result);
    if (result != Plugin_Continue)
        return MRES_Supercede;
    return MRES_Ignored;
}

static MRESReturn CureInfectionPost(int pThis)
{
    g_hLogger.TraceF("CNMRiH_Player::CureInfection Post this %d", pThis);
    int player = pThis;

    Call_StartForward(hGlobalForwards[FWD_CureInfectionPost]);
    Call_PushCell(player);
    Call_Finish();
    return MRES_Ignored;
}

// 玩家开始感染
// Note1: 即使已注射疫苗仍会触发此绕行
static MRESReturn BecomeInfected(int pThis)
{
    g_hLogger.TraceF("CNMRiH_Player::BecomeInfected this %d", pThis);
    int player = pThis;

    Action result;
    Call_StartForward(hGlobalForwards[FWD_BecomeInfected]);
    Call_PushCell(player);
    Call_Finish(result);

    g_hLogger.TraceF("CNMRiH_Player::BecomeInfected result %d.", result);
    if (result != Plugin_Continue)
        return MRES_Supercede;
    return MRES_Ignored;
}

static MRESReturn BecomeInfectedPost(int pThis)
{
    g_hLogger.TraceF("CNMRiH_Player::BecomeInfected Post this %d", pThis);
    int player = pThis;

    Call_StartForward(hGlobalForwards[FWD_BecomeInfectedPost]);
    Call_PushCell(player);
    Call_Finish();
    return MRES_Ignored;
}

// 用 UserMessage - Cure 替代
static MRESReturn TakePills(int pThis)
{
    g_hLogger.TraceF("CNMRiH_Player::TakePills this %d", pThis);
    int player = pThis;

    Action result;
    Call_StartForward(hGlobalForwards[FWD_TakePills]);
    Call_PushCell(player);
    Call_Finish(result);

    g_hLogger.TraceF("CNMRiH_Player::TakePills result %d.", result);
    if (result != Plugin_Continue)
        return MRES_Supercede;
    return MRES_Ignored;
}

static MRESReturn TakePillsPost(int pThis)
{
    g_hLogger.TraceF("CNMRiH_Player::TakePills Post this %d", pThis);
    int player = pThis;

    Call_StartForward(hGlobalForwards[FWD_TakePillsPost]);
    Call_PushCell(player);
    Call_Finish();
    return MRES_Ignored;
}

static MRESReturn OnGrabbedBegin(int pThis, DHookParam hParams)
{
    g_hLogger.TraceF("CNMRiH_Player::OnGrabbedBegin this %d, params %d", pThis, hParams);
    int player = pThis;
    int causer = hParams.Get(1);
    g_hLogger.TraceF("CNMRiH_Player::OnGrabbedBegin param1 %d", causer);

    Action result;
    Call_StartForward(hGlobalForwards[FWD_OnGrabbedBegin]);
    Call_PushCell(player);
    Call_PushCell(causer);
    Call_Finish(result);

    g_hLogger.TraceF("CNMRiH_Player::OnGrabbedBegin result %d.", result);
    if (result != Plugin_Continue)
        return MRES_Supercede;
    return MRES_Ignored;
}

static MRESReturn OnGrabbedBeginPost(int pThis, DHookParam hParams)
{
    g_hLogger.TraceF("CNMRiH_Player::OnGrabbedBegin Post this %d, params %d", pThis, hParams);
    int player = pThis;
    int causer = hParams.Get(1);
    g_hLogger.TraceF("CNMRiH_Player::OnGrabbedBegin Post param1 %d", causer);

    Call_StartForward(hGlobalForwards[FWD_OnGrabbedBeginPost]);
    Call_PushCell(player);
    Call_PushCell(causer);
    Call_Finish();
    return MRES_Ignored;
}

static MRESReturn ApplyBandage(int pThis)
{
    g_hLogger.TraceF("CNMRiH_Player::ApplyBandage this %d", pThis);
    int player = pThis;

    Action result;
    Call_StartForward(hGlobalForwards[FWD_ApplyBandage]);
    Call_PushCell(player);
    Call_Finish(result);

    g_hLogger.TraceF("CNMRiH_Player::ApplyBandage result %d.", result);
    if (result != Plugin_Continue)
        return MRES_Supercede;
    return MRES_Ignored;
}

static MRESReturn ApplyBandagePost(int pThis)
{
    g_hLogger.TraceF("CNMRiH_Player::ApplyBandage Post this %d", pThis);
    int player = pThis;

    Call_StartForward(hGlobalForwards[FWD_ApplyBandagePost]);
    Call_PushCell(player);
    Call_Finish();
    return MRES_Ignored;
}

static MRESReturn ApplyFirstAidKit(int pThis)
{
    g_hLogger.TraceF("CNMRiH_Player::ApplyFirstAidKit this %d", pThis);
    int player = pThis;

    Action result;
    Call_StartForward(hGlobalForwards[FWD_ApplyFirstAidKit]);
    Call_PushCell(player);
    Call_Finish(result);

    g_hLogger.TraceF("CNMRiH_Player::ApplyFirstAidKit result %d.", result);
    if (result != Plugin_Continue)
        return MRES_Supercede;
    return MRES_Ignored;
}

static MRESReturn ApplyFirstAidKitPost(int pThis)
{
    g_hLogger.TraceF("CNMRiH_Player::ApplyFirstAidKit Post this %d", pThis);
    int player = pThis;

    Call_StartForward(hGlobalForwards[FWD_ApplyFirstAidKitPost]);
    Call_PushCell(player);
    Call_Finish();
    return MRES_Ignored;
}

static MRESReturn ApplyVaccine(int pThis)
{
    g_hLogger.TraceF("CNMRiH_Player::ApplyVaccine this %d", pThis);
    int player = pThis;

    Action result;
    Call_StartForward(hGlobalForwards[FWD_ApplyVaccine]);
    Call_PushCell(player);
    Call_Finish(result);

    g_hLogger.TraceF("CNMRiH_Player::ApplyVaccine result %d.", result);
    if (result != Plugin_Continue)
        return MRES_Supercede;
    return MRES_Ignored;
}

static MRESReturn ApplyVaccinePost(int pThis)
{
    g_hLogger.TraceF("CNMRiH_Player::ApplyVaccine Post this %d", pThis);
    int player = pThis;

    Call_StartForward(hGlobalForwards[FWD_ApplyVaccinePost]);
    Call_PushCell(player);
    Call_Finish();
    return MRES_Ignored;
}

static MRESReturn BleedOut(DHookParam hParams)
{
    g_hLogger.TraceF("CNMRiH_Player::BleedOut params %d", hParams);
    int player = hParams.Get(1);
    g_hLogger.TraceF("CNMRiH_Player::BleedOut param1 %d", player);

    Action result;
    Call_StartForward(hGlobalForwards[FWD_BleedOut]);
    Call_PushCell(player);
    Call_Finish(result);

    g_hLogger.TraceF("CNMRiH_Player::BleedOut result %d.", result);
    if (result != Plugin_Continue)
        return MRES_Supercede;
    return MRES_Ignored;
}

static MRESReturn BleedOutPost(DHookParam hParams)
{
    g_hLogger.TraceF("CNMRiH_Player::BleedOut Post params %d", hParams);
    int player = hParams.Get(1);
    g_hLogger.TraceF("CNMRiH_Player::BleedOut Post param1 %d", player);

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
static MRESReturn StopBleedingOut(int pThis)
{
    g_hLogger.TraceF("CNMRiH_Player::StopBleedingOut this %d", pThis);
    int player = pThis;

    Action result;
    Call_StartForward(hGlobalForwards[FWD_StopBleedingOut]);
    Call_PushCell(player);
    Call_Finish(result);

    g_hLogger.TraceF("CNMRiH_Player::StopBleedingOut result %d.", result);
    if (result != Plugin_Continue)
        return MRES_Supercede;
    return MRES_Ignored;
}

static MRESReturn StopBleedingOutPost(int pThis)
{
    g_hLogger.TraceF("CNMRiH_Player::StopBleedingOut Post this %d", pThis);
    int player = pThis;

    Call_StartForward(hGlobalForwards[FWD_StopBleedingOutPost]);
    Call_PushCell(player);
    Call_Finish();
    return MRES_Ignored;
}
