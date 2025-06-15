#pragma newdecls required
#pragma semicolon 1

enum
{
    HDL_IsMoving,

    HDL_GetAliveDuration,

    HDL_FlashlightIsOn,
    HDL_FlashlightTurnOn,
    HDL_FlashlightTurnOff,
    HDL_State_Transition,

    HDL_CureInfection,
    HDL_BecomeInfected,
    HDL_TakePills,
    HDL_TakePillsInner,
    HDL_TakePillsEffects,

    HDL_IsValidObserverTarget,

    HDL_CanSprint,

    HDL_HasFlashlight,
    HDL_HasWalkieTalkie,
    HDL_EnableSprint,
    HDL_GetLastObserverMode,

    HDL_ApplyBandage,
    HDL_ApplyFirstAidKit,
    HDL_ApplyVaccine,
    HDL_BleedOut,
    HDL_StopBleedingOut,

    HDL_Total
}


static int    iSpawningPlayer = -1;
static Handle hCallers[HDL_Total];


public Action OnGameRulesGetPlayerSpawnSpot(int &client, int &returnValue)
{
    // https://github.com/dysphie/nmrih-guaranteedspawn/blob/2b06ceb48fb0146f72c947600b4661e802b07031/scripting/nmrih-guaranteedspawn.sp#L237
    if (iSpawningPlayer != -1)
    {
        returnValue = iSpawningPlayer;
        iSpawningPlayer = -1;
        return Plugin_Handled;
    }

    return Plugin_Continue;
}


void LoadFunctionsNatives()
{
    CreateNative("NMR_Player.ApplyBandage", Native_ApplyBandage);
    CreateNative("NMR_Player.ApplyFirstAidKit", Native_ApplyFirstAidKit);
    CreateNative("NMR_Player.ApplyVaccine", Native_ApplyVaccine);
    CreateNative("NMR_Player.BleedOut", Native_BleedOut);
    CreateNative("NMR_Player.EnableSprint", Native_EnableSprint);
    CreateNative("NMR_Player.GetAmmoCarryWeight", Native_GetAmmoCarryWeight);
    // CreateNative("NMR_Player.GetCarriedItems", Native_GetCarriedItems);
    CreateNative("NMR_Player.GetJumpStaminaCost", Native_GetJumpStaminaCost);
    CreateNative("NMR_Player.GetLastObserverMode", Native_GetLastObserverMode);
    CreateNative("NMR_Player.GetMaxCarriedWeight", Native_GetMaxCarriedWeight);
    // TODO CreateNative("NMR_Player.GetThrowVector", Native_GetThrowVector);
    CreateNative("NMR_Player.HasFlashlight", Native_HasFlashlight);
    CreateNative("NMR_Player.StopBleedingOut", Native_StopBleedingOut);

    CreateNative("NMR_Player.IsMoving", Native_IsMoving);
    CreateNative("NMR_Player.GetAliveDuration", Native_GetAliveDuration);
    CreateNative("NMR_Player.FlashlightIsOn", Native_FlashlightIsOn);
    CreateNative("NMR_Player.FlashlightTurnOn", Native_FlashlightTurnOn);
    CreateNative("NMR_Player.FlashlightTurnOff", Native_FlashlightTurnOff);
    CreateNative("NMR_Player.State_Transition", Native_State_Transition);
    CreateNative("NMR_Player.CureInfection", Native_CureInfection);
    CreateNative("NMR_Player.BecomeInfected", Native_BecomeInfected);
    CreateNative("NMR_Player.TakePills", Native_TakePills);
    CreateNative("NMR_Player.TakePillsInner", Native_TakePillsInner);
    CreateNative("NMR_Player.TakePillsEffects", Native_TakePillsEffects);
    CreateNative("NMR_Player.IsValidObserverTarget", Native_IsValidObserverTarget);
    CreateNative("NMR_Player.CanSprint", Native_CanSprint);
    CreateNative("NMR_Player.ForceSpawn", Native_ForceSpawn);
}

void LoadFunctionsCalls(GameData gamedata)
{
    StartPrepSDKCall(SDKCall_Player);
    PrepSDKCall_SetFromConf(gamedata, SDKConf_Virtual, "CBaseEntity::IsMoving");
    PrepSDKCall_SetReturnInfo(SDKType_Bool, SDKPass_Plain);
    if ((hCallers[HDL_IsMoving] = EndPrepSDKCall()) == null)
        SetFailState("Failed to load offset CBaseEntity::IsMoving");

    StartPrepSDKCall(SDKCall_Player);
    PrepSDKCall_SetFromConf(gamedata, SDKConf_Virtual, "CBaseCombatCharacter::GetAliveDuration");
    PrepSDKCall_SetReturnInfo(SDKType_Float, SDKPass_Plain);
    if ((hCallers[HDL_GetAliveDuration] = EndPrepSDKCall()) == null)
        SetFailState("Failed to load offset CBaseCombatCharacter::GetAliveDuration");

    StartPrepSDKCall(SDKCall_Player);
    PrepSDKCall_SetFromConf(gamedata, SDKConf_Virtual, "CSDKPlayer::FlashlightIsOn");
    PrepSDKCall_SetReturnInfo(SDKType_Bool, SDKPass_Plain);
    if ((hCallers[HDL_FlashlightIsOn] = EndPrepSDKCall()) == null)
        SetFailState("Failed to load offset CSDKPlayer::FlashlightIsOn");

    StartPrepSDKCall(SDKCall_Player);
    PrepSDKCall_SetFromConf(gamedata, SDKConf_Virtual, "CSDKPlayer::FlashlightTurnOn");
    if ((hCallers[HDL_FlashlightTurnOn] = EndPrepSDKCall()) == null)
        SetFailState("Failed to load offset CSDKPlayer::FlashlightTurnOn");

    StartPrepSDKCall(SDKCall_Player);
    PrepSDKCall_SetFromConf(gamedata, SDKConf_Virtual, "CSDKPlayer::FlashlightTurnOff");
    if ((hCallers[HDL_FlashlightTurnOff] = EndPrepSDKCall()) == null)
        SetFailState("Failed to load offset CSDKPlayer::FlashlightTurnOff");

    StartPrepSDKCall(SDKCall_Player);
    PrepSDKCall_SetFromConf(gamedata, SDKConf_Signature, "CSDKPlayer::State_Transition");
    PrepSDKCall_AddParameter(SDKType_PlainOldData, SDKPass_Plain);
    if ((hCallers[HDL_State_Transition] = EndPrepSDKCall()) == null)
        SetFailState("Failed to load signature CSDKPlayer::State_Transition");

    StartPrepSDKCall(SDKCall_Player);
    PrepSDKCall_SetFromConf(gamedata, SDKConf_Virtual, "CBasePlayer::IsValidObserverTarget");
    PrepSDKCall_SetReturnInfo(SDKType_Bool, SDKPass_Plain);
    PrepSDKCall_AddParameter(SDKType_CBaseEntity, SDKPass_Pointer);
    if ((hCallers[HDL_IsValidObserverTarget] = EndPrepSDKCall()) == null)
        SetFailState("Failed to load offset CBasePlayer::IsValidObserverTarget");

    StartPrepSDKCall(SDKCall_Player);
    PrepSDKCall_SetFromConf(gamedata, SDKConf_Virtual, "CNMRiH_Player::CanSprint");
    PrepSDKCall_SetReturnInfo(SDKType_Bool, SDKPass_Plain);
    if ((hCallers[HDL_CanSprint] = EndPrepSDKCall()) == null)
        SetFailState("Failed to load offset CNMRiH_Player::CanSprint");

    StartPrepSDKCall(SDKCall_Player);
    PrepSDKCall_SetFromConf(gamedata, SDKConf_Virtual, "CNMRiH_Player::HasFlashlight");
    PrepSDKCall_SetReturnInfo(SDKType_Bool, SDKPass_Plain);
    if ((hCallers[HDL_HasFlashlight] = EndPrepSDKCall()) == null)
        SetFailState("Failed to load offset CNMRiH_Player::HasFlashlight");

    StartPrepSDKCall(SDKCall_Player);
    PrepSDKCall_SetFromConf(gamedata, SDKConf_Virtual, "CNMRiH_Player::HasWalkieTalkie");
    PrepSDKCall_SetReturnInfo(SDKType_Bool, SDKPass_Plain);
    if ((hCallers[HDL_HasWalkieTalkie] = EndPrepSDKCall()) == null)
        SetFailState("Failed to load offset CNMRiH_Player::HasWalkieTalkie");

    StartPrepSDKCall(SDKCall_Player);
    PrepSDKCall_SetFromConf(gamedata, SDKConf_Virtual, "CNMRiH_Player::EnableSprint");
    PrepSDKCall_AddParameter(SDKType_Bool, SDKPass_Plain);
    if ((hCallers[HDL_EnableSprint] = EndPrepSDKCall()) == null)
        SetFailState("Failed to load offset CNMRiH_Player::EnableSprint");

    StartPrepSDKCall(SDKCall_Player);
    PrepSDKCall_SetFromConf(gamedata, SDKConf_Virtual, "CNMRiH_Player::GetLastObserverMode");
    PrepSDKCall_SetReturnInfo(SDKType_PlainOldData, SDKPass_Plain);
    if ((hCallers[HDL_GetLastObserverMode] = EndPrepSDKCall()) == null)
        SetFailState("Failed to load offset CNMRiH_Player::GetLastObserverMode");

    StartPrepSDKCall(SDKCall_Player);
    PrepSDKCall_SetFromConf(gamedata, SDKConf_Signature, "CNMRiH_Player::CureInfection");
    if ((hCallers[HDL_CureInfection] = EndPrepSDKCall()) == null)
        SetFailState("Failed to load offset CNMRiH_Player::CureInfection");

    StartPrepSDKCall(SDKCall_Player);
    PrepSDKCall_SetFromConf(gamedata, SDKConf_Signature, "CNMRiH_Player::BecomeInfected");
    if ((hCallers[HDL_BecomeInfected] = EndPrepSDKCall()) == null)
        SetFailState("Failed to load offset CNMRiH_Player::BecomeInfected");

    StartPrepSDKCall(SDKCall_Player);
    PrepSDKCall_SetFromConf(gamedata, SDKConf_Signature, "CNMRiH_Player::TakePills");
    if ((hCallers[HDL_TakePills] = EndPrepSDKCall()) == null)
        SetFailState("Failed to load offset CNMRiH_Player::TakePills");

    StartPrepSDKCall(SDKCall_Player);
    PrepSDKCall_SetFromConf(gamedata, SDKConf_Signature, "CInfectableCharacter::TakePills");
    if ((hCallers[HDL_TakePillsInner] = EndPrepSDKCall()) == null)
        SetFailState("Failed to load offset CInfectableCharacter::TakePills");

    StartPrepSDKCall(SDKCall_Player);
    PrepSDKCall_SetFromConf(gamedata, SDKConf_Signature, "CNMRiH_Player::TakePillsEffects");
    if ((hCallers[HDL_TakePillsEffects] = EndPrepSDKCall()) == null)
        SetFailState("Failed to load offset CNMRiH_Player::TakePillsEffects");

    StartPrepSDKCall(SDKCall_Static);
    PrepSDKCall_SetFromConf(gamedata, SDKConf_Signature, "CNMRiH_Player::ApplyBandage");
    PrepSDKCall_AddParameter(SDKType_CBasePlayer, SDKPass_Pointer);
    if ((hCallers[HDL_ApplyBandage] = EndPrepSDKCall()) == null)
        SetFailState("Failed to load signature CNMRiH_Player::ApplyBandage");

    StartPrepSDKCall(SDKCall_Static);
    PrepSDKCall_SetFromConf(gamedata, SDKConf_Signature, "CNMRiH_Player::ApplyFirstAidKit");
    PrepSDKCall_AddParameter(SDKType_CBasePlayer, SDKPass_Pointer);
    if ((hCallers[HDL_ApplyFirstAidKit] = EndPrepSDKCall()) == null)
        SetFailState("Failed to load signature CNMRiH_Player::ApplyFirstAidKit");

    StartPrepSDKCall(SDKCall_Static);
    PrepSDKCall_SetFromConf(gamedata, SDKConf_Signature, "CNMRiH_Player::ApplyVaccine");
    PrepSDKCall_AddParameter(SDKType_CBasePlayer, SDKPass_Pointer);
    if ((hCallers[HDL_ApplyVaccine] = EndPrepSDKCall()) == null)
        SetFailState("Failed to load signature CNMRiH_Player::ApplyVaccine");

    StartPrepSDKCall(SDKCall_Static);
    PrepSDKCall_SetFromConf(gamedata, SDKConf_Signature, "CNMRiH_Player::BleedOut");
    PrepSDKCall_AddParameter(SDKType_CBasePlayer, SDKPass_Pointer);
    if ((hCallers[HDL_BleedOut] = EndPrepSDKCall()) == null)
        SetFailState("Failed to load signature CNMRiH_Player::BleedOut");

    StartPrepSDKCall(SDKCall_Static);
    PrepSDKCall_SetFromConf(gamedata, SDKConf_Signature, "CNMRiH_Player::StopBleedingOut");
    PrepSDKCall_AddParameter(SDKType_CBasePlayer, SDKPass_Pointer);
    if ((hCallers[HDL_StopBleedingOut] = EndPrepSDKCall()) == null)
        SetFailState("Failed to load signature CNMRiH_Player::StopBleedingOut");
}

/* ------- Function ------- */

static void Native_ApplyBandage(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    SDKCall(hCallers[HDL_ApplyBandage], player);
}

static void Native_ApplyFirstAidKit(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    SDKCall(hCallers[HDL_ApplyFirstAidKit], player);
}

static void Native_ApplyVaccine(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    SDKCall(hCallers[HDL_ApplyVaccine], player);
}

static void Native_BleedOut(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    SDKCall(hCallers[HDL_BleedOut], player);
}

static void Native_EnableSprint(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    bool value = GetNativeCell(2);
    SDKCall(hCallers[HDL_EnableSprint], player, value);
}

static int Native_GetAmmoCarryWeight(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    NMR_Player temp = NMR_Player(player);

    int weigth = temp.GetAmmoCarryCount(1) * cvar_InvAmmoweight;// 9MM
    weigth += temp.GetAmmoCarryCount(2) * cvar_InvAmmoweight;   // 45ACP
    weigth += temp.GetAmmoCarryCount(3) * cvar_InvAmmoweight;   // 357
    weigth += temp.GetAmmoCarryCount(4) * cvar_InvAmmoweight;   // 12Gauge
    weigth += temp.GetAmmoCarryCount(5) * cvar_InvAmmoweight;   // 22LR
    weigth += temp.GetAmmoCarryCount(6) * cvar_InvAmmoweight;   // 308
    weigth += temp.GetAmmoCarryCount(7) * cvar_InvAmmoweight;   // 556
    weigth += temp.GetAmmoCarryCount(8) * cvar_InvAmmoweight;   // 762
    // weigth += temp.GetAmmoCarryCount(9) * cvar_InvAmmoweight;   // Grenade
    // weigth += temp.GetAmmoCarryCount(10) * cvar_InvAmmoweight;  // Molotov
    // weigth += temp.GetAmmoCarryCount(11) * cvar_InvAmmoweight;  // TNT
    weigth += temp.GetAmmoCarryCount(12) * cvar_InvAmmoweight;  // Arrow
    weigth += temp.GetAmmoCarryCount(13) * cvar_InvAmmoweight;  // Fuel
    weigth += temp.GetAmmoCarryCount(14) * cvar_InvAmmoweight;  // Boards
    weigth += temp.GetAmmoCarryCount(15) * cvar_InvAmmoweight;  // Flares

    return weigth;
}

// static void Native_GetCarriedItems(Handle plugin, int numParams)
// {
//     int player = GetNativeCell(1);
//     if (!IsValidClient(player))
//         log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

//     Handle handle = GetNativeCell(2);

//     char code[64];
//     FormatEx(code, sizeof(code), "GetCarriedItems(%d)", handle);
//     RunEntVScriptInt(player, code);
// }

static any Native_GetJumpStaminaCost(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return cvar_SvBleedoutJumpStamMult;
}

static int Native_GetLastObserverMode(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return SDKCall(hCallers[HDL_GetLastObserverMode], player);
}

static int Native_GetMaxCarriedWeight(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return cvar_InvMaxcarry;
}

// TODO
// static any Native_GetThrowVector(Handle plugin, int numParams)
// {
//     int player = GetNativeCell(1);
//     if (!IsValidClient(player))
//         log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);
// }

static any Native_HasFlashlight(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return SDKCall(hCallers[HDL_HasFlashlight], player);
}

static void Native_StopBleedingOut(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    SDKCall(hCallers[HDL_StopBleedingOut], player);
}

static any Native_IsMoving(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return SDKCall(hCallers[HDL_IsMoving], player);
}

static any Native_GetAliveDuration(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return SDKCall(hCallers[HDL_GetAliveDuration], player);
}

static any Native_FlashlightIsOn(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return SDKCall(hCallers[HDL_FlashlightIsOn], player);
}

static void Native_FlashlightTurnOn(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    SDKCall(hCallers[HDL_FlashlightTurnOn], player);
}

static void Native_FlashlightTurnOff(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    SDKCall(hCallers[HDL_FlashlightTurnOff], player);
}

static void Native_State_Transition(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    int state = GetNativeCell(2);

    SDKCall(hCallers[HDL_State_Transition], player, state);
}

static void Native_CureInfection(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    SDKCall(hCallers[HDL_CureInfection], player);
}

static void Native_BecomeInfected(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    SDKCall(hCallers[HDL_BecomeInfected], player);
}

static void Native_TakePills(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    SDKCall(hCallers[HDL_TakePills], player);
}

static void Native_TakePillsInner(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    SDKCall(hCallers[HDL_TakePillsInner], player);
}

static void Native_TakePillsEffects(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    SDKCall(hCallers[HDL_TakePillsEffects], player);
}

static any Native_IsValidObserverTarget(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    int entity = GetNativeCell(2);
    if (!IsValidEntity(entity))
        log.ThrowErrorEx(LogLevel_Error, "invalid entity %d", player);

    return SDKCall(hCallers[HDL_IsValidObserverTarget], player, entity);
}

static any Native_CanSprint(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return SDKCall(hCallers[HDL_CanSprint], player);
}

static void Native_ForceSpawn(Handle plugin, int numParams)
{
    NMR_Player player = GetNativeCell(1);
    if (!player.IsValid)
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    if (player.IsAlive && player.m_iPlayerState == 0) // TODO STATE_ACTIVE
        return;

    if (!LibraryExists("nmrih_gamerules"))
        log.ThrowError(LogLevel_Error, "The plugin 'nmrih_gamerules' does not exist, NMR_Player.ForceSpawn is unavailable.");

    int target = GetNativeCell(2);

    float pos[3], ang[3], vel[3];
    if (IsValidClient(target))
    {
        NMR_Player targetPlayer = NMR_Player(target);
        targetPlayer.GetAbsOrigin(pos);
        targetPlayer.GetAbsAngles(ang);
        targetPlayer.GetAbsVelocity(vel);

        if (targetPlayer.IsDucking())
        {
            player.m_fFlags | NMR_FL_DUCKING;
            player.m_bDucked = true;
            player.m_bDucking = true;
            player.m_vecViewOffset_0 = 0.0;
            player.m_vecViewOffset_1 = 0.0;
            player.m_vecViewOffset_2 = 34.0; // TODO DEFAULT_DUCK_VIEW_OFFSET
        }
    }
    else if (IsValidEntity(target))
    {
        GetEntPropVector(target, Prop_Data, "m_vecAbsOrigin", pos);
        GetEntPropVector(target, Prop_Data, "m_angAbsRotation", ang);
        vel[0] = 0.0;
        vel[1] = 0.0;
        vel[2] = 0.0;
    }
    else
        log.ThrowErrorEx(LogLevel_Error, "invalid target %d", target);

    iSpawningPlayer = player.Index;
    player.State_Transition(0); // TODO STATE_ACTIVE

    TeleportEntity(player.Index, pos, ang, vel);
}
