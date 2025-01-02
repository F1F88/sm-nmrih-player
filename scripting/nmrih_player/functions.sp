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
    CreateNative("NMR_Player.AddCarriedWeight", Native_AddCarriedWeight);
    CreateNative("NMR_Player.Ammo_Drop", Native_Ammo_Drop);
    CreateNative("NMR_Player.ApplyBandage", Native_ApplyBandage);
    CreateNative("NMR_Player.ApplyFirstAidKit", Native_ApplyFirstAidKit);
    CreateNative("NMR_Player.ApplyVaccine", Native_ApplyVaccine);
    CreateNative("NMR_Player.BleedOut", Native_BleedOut);
    CreateNative("NMR_Player.CancelSuicide", Native_CancelSuicide);
    CreateNative("NMR_Player.CancelThrowDrop", Native_CancelThrowDrop);
    CreateNative("NMR_Player.ClearHandModelOverride", Native_ClearHandModelOverride);
    CreateNative("NMR_Player.ContemplateSuicide", Native_ContemplateSuicide);
    CreateNative("NMR_Player.DeathCount", Native_DeathCount);
    CreateNative("NMR_Player.DecrementRespawnTokens", Native_DecrementRespawnTokens);
    CreateNative("NMR_Player.DestroyAllAmmo", Native_DestroyAllAmmo);
    CreateNative("NMR_Player.DestroyAllWeapons", Native_DestroyAllWeapons);
    CreateNative("NMR_Player.DestroyEverything", Native_DestroyEverything);
    CreateNative("NMR_Player.DoCommitSuicide", Native_DoCommitSuicide);
    CreateNative("NMR_Player.DropEverything", Native_DropEverything);
    CreateNative("NMR_Player.EnableSprint", Native_EnableSprint);
    CreateNative("NMR_Player.GetAmmoCarryCount", Native_GetAmmoCarryCount);
    CreateNative("NMR_Player.GetAmmoCarryWeight", Native_GetAmmoCarryWeight);
    CreateNative("NMR_Player.GetActiveWeaponClip1", Native_GetActiveWeaponClip1);
    CreateNative("NMR_Player.GetActiveWeaponClip2", Native_GetActiveWeaponClip2);
    // CreateNative("NMR_Player.GetCarriedItems", Native_GetCarriedItems);
    CreateNative("NMR_Player.GetCarriedWeight", Native_GetCarriedWeight);
    CreateNative("NMR_Player.GetJumpStaminaCost", Native_GetJumpStaminaCost);
    CreateNative("NMR_Player.GetLastObserverMode", Native_GetLastObserverMode);
    CreateNative("NMR_Player.GetNextRespawnTime", Native_GetNextRespawnTime);
    CreateNative("NMR_Player.GetMaxCarriedWeight", Native_GetMaxCarriedWeight);
    CreateNative("NMR_Player.GetNextSpawnTryTime", Native_GetNextSpawnTryTime);
    CreateNative("NMR_Player.GetSpeedModifier", Native_GetSpeedModifier);
    CreateNative("NMR_Player.GetSpeedOverride", Native_GetSpeedOverride);
    CreateNative("NMR_Player.GetStamina", Native_GetStamina);
    CreateNative("NMR_Player.GetThrowScale", Native_GetThrowScale);
    // TODO CreateNative("NMR_Player.GetThrowVector", Native_GetThrowVector);
    CreateNative("NMR_Player.HasFlashlight", Native_HasFlashlight);
    CreateNative("NMR_Player.HasLeftoverWeight", Native_HasLeftoverWeight);
    CreateNative("NMR_Player.HasWalkieTalkie", Native_HasWalkieTalkie);
    CreateNative("NMR_Player.IncreaseBloodiness", Native_IncreaseBloodiness);
    CreateNative("NMR_Player.IncrementRespawnTokens", Native_IncrementRespawnTokens);
    CreateNative("NMR_Player.IsBleedingOut", Native_IsBleedingOut);
    CreateNative("NMR_Player.IsContemplatingSuicide", Native_IsContemplatingSuicide);
    CreateNative("NMR_Player.IsDucking", Native_IsDucking);
    CreateNative("NMR_Player.IsExtracted", Native_IsExtracted);
    CreateNative("NMR_Player.IsGrabbed", Native_IsGrabbed);
    CreateNative("NMR_Player.IsHost", Native_IsHost);
    CreateNative("NMR_Player.IsInLevelTransition", Native_IsInLevelTransition);
    CreateNative("NMR_Player.IsJumping", Native_IsJumping);
    CreateNative("NMR_Player.IsPartialBlindnessActive", Native_IsPartialBlindnessActive);
    CreateNative("NMR_Player.IsSprinting", Native_IsSprinting);
    CreateNative("NMR_Player.IsTalkingLocal", Native_IsTalkingLocal);
    CreateNative("NMR_Player.IsTalkingWalkie", Native_IsTalkingWalkie);
    CreateNative("NMR_Player.IsUsingProgressTrigger", Native_IsUsingProgressTrigger);
    CreateNative("NMR_Player.IsVaccinated", Native_IsVaccinated);
    CreateNative("NMR_Player.IsVoiceCommandTimerExpired", Native_IsVoiceCommandTimerExpired);
    CreateNative("NMR_Player.ReadyToRespawn", Native_ReadyToRespawn);
    CreateNative("NMR_Player.RemoveCarriedWeight", Native_RemoveCarriedWeight);
    CreateNative("NMR_Player.RemoveInflictions", Native_RemoveInflictions);
    CreateNative("NMR_Player.ResetRespawnTokens", Native_ResetRespawnTokens);
    CreateNative("NMR_Player.ResetVoiceCommandTimer", Native_ResetVoiceCommandTimer);
    CreateNative("NMR_Player.RespawnTokenCount", Native_RespawnTokenCount);
    CreateNative("NMR_Player.SetExtracted", Native_SetExtracted);
    CreateNative("NMR_Player.SetHandModelOverride", Native_SetHandModelOverride);
    CreateNative("NMR_Player.SetIdleTimeout", Native_SetIdleTimeout);
    CreateNative("NMR_Player.SetIgnoreFallDamage", Native_SetIgnoreFallDamage);
    CreateNative("NMR_Player.SetNextRespawnTime", Native_SetNextRespawnTime);
    CreateNative("NMR_Player.SetNextSpawnTryTime", Native_SetNextSpawnTryTime);
    CreateNative("NMR_Player.SetRespawnTokens", Native_SetRespawnTokens);
    CreateNative("NMR_Player.SetSpawnWeapon", Native_SetSpawnWeapon);
    CreateNative("NMR_Player.SetSpeedModifier", Native_SetSpeedModifier);
    CreateNative("NMR_Player.SetSpeedOverride", Native_SetSpeedOverride);
    CreateNative("NMR_Player.SetStamina", Native_SetStamina);
    CreateNative("NMR_Player.SetUsingProgressTrigger", Native_SetUsingProgressTrigger);
    CreateNative("NMR_Player.ShouldIgnoreFallDamage", Native_ShouldIgnoreFallDamage);
    CreateNative("NMR_Player.StopBleedingOut", Native_StopBleedingOut);
    CreateNative("NMR_Player.ThrowAllAmmo", Native_ThrowAllAmmo);
    CreateNative("NMR_Player.ThrowAllCustomItems", Native_ThrowAllCustomItems);
    CreateNative("NMR_Player.ThrowAllWeapons", Native_ThrowAllWeapons);
    CreateNative("NMR_Player.VoiceCommand", Native_VoiceCommand);

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
    CreateNative("NMR_Player.IsInfected", Native_IsInfected);
    CreateNative("NMR_Player.GetSpeed", Native_GetSpeed);
    CreateNative("NMR_Player.GetEntityDistance", Native_GetEntityDistance);
    CreateNative("NMR_Player.ForceSpawnNearby", Native_ForceSpawnNearby);
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
static void Native_AddCarriedWeight(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    int weigth = GetNativeCell(2);
    char code[64];
    FormatEx(code, sizeof(code), "self.AddCarriedWeight(%d)", weigth);
    SetVariantString(code);
    PrintToServer(code);
    AcceptEntityInput(player, "RunScriptCode");
}

static any Native_Ammo_Drop(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    int maxlen;
    GetNativeStringLength(2, maxlen);   // 获取传入的字符串长度
    char[] name = new char[++maxlen];   // 需要增加一位用于存储 '\0'
    GetNativeString(2, name, maxlen);

    char code[64];
    FormatEx(code, sizeof(code), "Ammo_Drop(\"%s\")", name);
    return RunEntVScriptBool(player, code);
}

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

static void Native_CancelSuicide(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    bool cancelAnimation = GetNativeCell(2);
    char code[32];
    FormatEx(code, sizeof(code), "self.CancelSuicide(%s)", cancelAnimation ? "true" : "false");
    SetVariantString(code);
    AcceptEntityInput(player, "RunScriptCode");
}

static void Native_CancelThrowDrop(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    SetVariantString("self.CancelThrowDrop()");
    AcceptEntityInput(player, "RunScriptCode");
}

static void Native_ClearHandModelOverride(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    SetVariantString("self.ClearHandModelOverride()");
    AcceptEntityInput(player, "RunScriptCode");
}

static void Native_ContemplateSuicide(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    SetVariantString("self.ContemplateSuicide()");
    AcceptEntityInput(player, "RunScriptCode");
}

static any Native_DeathCount(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    // * Note: Use property
    return NMR_Player(player).m_iDeaths;
}

static void Native_DecrementRespawnTokens(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    SetVariantString("self.DecrementRespawnTokens()");
    AcceptEntityInput(player, "RunScriptCode");
}

static void Native_DestroyAllAmmo(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    SetVariantString("self.DestroyAllAmmo()");
    AcceptEntityInput(player, "RunScriptCode");
}

static void Native_DestroyAllWeapons(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    SetVariantString("self.DestroyAllWeapons()");
    AcceptEntityInput(player, "RunScriptCode");
}

static void Native_DestroyEverything(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    SetVariantString("self.DestroyEverything()");
    AcceptEntityInput(player, "RunScriptCode");
}

static void Native_DoCommitSuicide(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    SetVariantString("self.DoCommitSuicide()");
    AcceptEntityInput(player, "RunScriptCode");
}

static void Native_DropEverything(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    SetVariantString("self.DropEverything()");
    AcceptEntityInput(player, "RunScriptCode");
}

static void Native_EnableSprint(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    bool value = GetNativeCell(2);
    SDKCall(hCallers[HDL_EnableSprint], player, value);
}

static int Native_GetAmmoCarryCount(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    int element = GetNativeCell(2);
    if (element <= 0 || element >= 32)
        log.ThrowErrorEx(LogLevel_Error, "invalid element %d (1-32)", element);

    return GetEntProp(player, Prop_Send, "m_iAmmo", 4, element);
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

static int Native_GetActiveWeaponClip1(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    int weapon = NMR_Player(player).m_hActiveWeapon;
    if (!IsValidEntity(weapon))
        return -1;

    int offset = FindSendPropInfo("CNMRiH_WeaponBase", "m_iClip1");
    if (offset < 1)
        log.ThrowError(LogLevel_Error, "Can't find offset 'CNMRiH_WeaponBase::m_iClip1'!");

    return GetEntData(weapon, offset);
}

static int Native_GetActiveWeaponClip2(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    NMR_Player temp = NMR_Player(player);

    int weapon = temp.m_hActiveWeapon;
    if (!IsValidEntity(weapon))
        return 0;

    int type = GetEntProp(weapon, Prop_Send, "m_iPrimaryAmmoType");
    if (type == -1)
        return 0;

    return temp.GetAmmoCarryCount(type);
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

static int Native_GetCarriedWeight(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    NMR_Player temp = NMR_Player(player);
    return temp._carriedWeight + temp.GetAmmoCarryWeight();
}

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

static any Native_GetNextRespawnTime(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return NMR_Player(player)._nextRespawnTime;
}

static int Native_GetMaxCarriedWeight(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return cvar_InvMaxcarry;
}

static any Native_GetNextSpawnTryTime(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return RunEntVScriptFloat(player, "GetNextSpawnTryTime()");
}

static any Native_GetSpeedModifier(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return NMR_Player(player).m_flSpeedModifier;
}

static any Native_GetSpeedOverride(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return NMR_Player(player).m_flSpeedOverride;
}

static any Native_GetStamina(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return NMR_Player(player).m_flStamina;
}

static any Native_GetThrowScale(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    float value = (GetGameTime() - NMR_Player(player).m_flThrowDropTimer) * 2 / 3;

    if (value <= 0.25)
        return 0.25;

    if (value >= 1.0)
        return 1.0;

    return value;
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

static any Native_HasLeftoverWeight(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    NMR_Player temp = NMR_Player(player);

    int value = GetNativeCell(2);
    return value <= temp._carriedWeight + temp.GetAmmoCarryWeight();
}

static any Native_HasWalkieTalkie(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return SDKCall(hCallers[HDL_HasWalkieTalkie], player);
}

static void Native_IncreaseBloodiness(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    SetVariantString("self.IncreaseBloodiness()");
    AcceptEntityInput(player, "RunScriptCode");
}

static void Native_IncrementRespawnTokens(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    SetVariantString("self.IncrementRespawnTokens()");
    AcceptEntityInput(player, "RunScriptCode");
}

static any Native_IsBleedingOut(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return NMR_Player(player)._bleedingOut;
}

static any Native_IsContemplatingSuicide(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return NMR_Player(player)._contemplatingSuicide;
}

static any Native_IsDucking(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return NMR_Player(player).m_fFlags & NMR_FL_DUCKING;
}

static any Native_IsExtracted(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return NMR_Player(player).m_bIsExtracted;
}

static any Native_IsGrabbed(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return RunEntVScriptBool(player, "IsGrabbed()");
    // return NMR_Player(player).m_bGrabbed && this + 5000 != -1;
}

static any Native_IsHost(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return RunEntVScriptBool(player, "IsHost()");
}

static any Native_IsInLevelTransition(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return NMR_Player(player).m_bLevelTransition;
}

static any Native_IsJumping(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return RunEntVScriptBool(player, "IsJumping()");
}

static any Native_IsPartialBlindnessActive(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return NMR_Player(player).m_flPartialBlindnessEffectEnd > GetGameTime();
}

static any Native_IsSprinting(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return NMR_Player(player).m_bIsSprinting;
}

static any Native_IsTalkingLocal(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return RunEntVScriptBool(player, "IsTalkingLocal()");
}

static any Native_IsTalkingWalkie(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return NMR_Player(player).m_bTalkingWalkie;
}

static any Native_IsUsingProgressTrigger(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return NMR_Player(player).m_bUsingProgressTrigger;
}

static any Native_IsVaccinated(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return NMR_Player(player)._vaccinated;
}

static any Native_IsVoiceCommandTimerExpired(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return RunEntVScriptBool(player, "IsVoiceCommandTimerExpired()");
}

static any Native_ReadyToRespawn(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return RunEntVScriptBool(player, "ReadyToRespawn()");
}

static void Native_RemoveCarriedWeight(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    int weight = GetNativeCell(2);

    char code[64];
    FormatEx(code, sizeof(code), "self.RemoveCarriedWeight(%d)", weight);
    SetVariantString(code);
    AcceptEntityInput(player, "RunScriptCode");
}

static void Native_RemoveInflictions(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    SetVariantString("self.RemoveInflictions()");
    AcceptEntityInput(player, "RunScriptCode");
}

static void Native_ResetRespawnTokens(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    SetVariantString("self.ResetRespawnTokens()");
    AcceptEntityInput(player, "RunScriptCode");
}

static void Native_ResetVoiceCommandTimer(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    SetVariantString("self.ResetVoiceCommandTimer()");
    AcceptEntityInput(player, "RunScriptCode");
}

static any Native_RespawnTokenCount(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return RunEntVScriptInt(player, "RespawnTokenCount()");
}

static void Native_SetExtracted(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    bool value = GetNativeCell(2);

    char code[32];
    FormatEx(code, sizeof(code), "self.SetExtracted(%s)", value ? "true" : "false");
    SetVariantString(code);
    AcceptEntityInput(player, "RunScriptCode");
}

static void Native_SetHandModelOverride(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    int maxlen;
    GetNativeStringLength(2, maxlen);   // 获取传入的字符串长度
    char[] model = new char[++maxlen];  // 需要增加一位用于存储 '\0'
    GetNativeString(2, model, maxlen);

    char code[PLATFORM_MAX_PATH];
    FormatEx(code, sizeof(code), "self.SetHandModelOverride(\"%s\")", model);
    SetVariantString(code);
    AcceptEntityInput(player, "RunScriptCode");
}

static void Native_SetIdleTimeout(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    float time = GetNativeCell(2);

    char code[64];
    FormatEx(code, sizeof(code), "self.SetIdleTimeout(%f)", time);
    SetVariantString(code);
    AcceptEntityInput(player, "RunScriptCode");
}

static void Native_SetIgnoreFallDamage(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    bool value = GetNativeCell(2);

    char code[32];
    FormatEx(code, sizeof(code), "self.SetIgnoreFallDamage(%s)", value ? "true" : "false");
    SetVariantString(code);
    AcceptEntityInput(player, "RunScriptCode");
}

static void Native_SetNextRespawnTime(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    float time = GetNativeCell(2);

    char code[64];
    FormatEx(code, sizeof(code), "self.SetNextRespawnTime(%f)", time);
    SetVariantString(code);
    AcceptEntityInput(player, "RunScriptCode");
}

static void Native_SetNextSpawnTryTime(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    float time = GetNativeCell(2);

    char code[64];
    FormatEx(code, sizeof(code), "self.SetNextSpawnTryTime(%f)", time);
    SetVariantString(code);
    AcceptEntityInput(player, "RunScriptCode");
}

static void Native_SetRespawnTokens(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    int tokens = GetNativeCell(2);
    bool notify = GetNativeCell(3);

    char code[PLATFORM_MAX_PATH];
    FormatEx(code, sizeof(code), "self.SetRespawnTokens(%d,%s)", tokens, notify ? "true" : "false");
    SetVariantString(code);
    AcceptEntityInput(player, "RunScriptCode");
}

static void Native_SetSpawnWeapon(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    int maxlen;
    GetNativeStringLength(2, maxlen);       // 获取传入的字符串长度
    char[] classname = new char[++maxlen];  // 需要增加一位用于存储 '\0'
    GetNativeString(2, classname, maxlen);

    int ammoPercent = GetNativeCell(3);

    char code[128];
    FormatEx(code, sizeof(code), "self.SetSpawnWeapon(\"%s\",%d)", classname, ammoPercent);
    SetVariantString(code);
    AcceptEntityInput(player, "RunScriptCode");
}

static void Native_SetSpeedModifier(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    float value = GetNativeCell(2);

    char code[64];
    FormatEx(code, sizeof(code), "self.SetSpeedModifier(%f)", value);
    SetVariantString(code);
    AcceptEntityInput(player, "RunScriptCode");
}

static void Native_SetSpeedOverride(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    float speed = GetNativeCell(2);

    char code[64];
    FormatEx(code, sizeof(code), "self.SetSpeedOverride(%f)", speed);
    SetVariantString(code);
    AcceptEntityInput(player, "RunScriptCode");
}

static void Native_SetStamina(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    float stamina = GetNativeCell(2);

    char code[64];
    FormatEx(code, sizeof(code), "self.SetStamina(%f)", stamina);
    SetVariantString(code);
    AcceptEntityInput(player, "RunScriptCode");
}

static void Native_SetUsingProgressTrigger(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    bool value = GetNativeCell(2);

    char code[64];
    FormatEx(code, sizeof(code), "self.SetUsingProgressTrigger(%s)", value ? "true" : "false");
    SetVariantString(code);
    AcceptEntityInput(player, "RunScriptCode");
}

static any Native_ShouldIgnoreFallDamage(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return RunEntVScriptBool(player, "ShouldIgnoreFallDamage()");
}

static void Native_StopBleedingOut(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    SDKCall(hCallers[HDL_StopBleedingOut], player);
}

static void Native_ThrowAllAmmo(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    SetVariantString("self.ThrowAllAmmo()");
    AcceptEntityInput(player, "RunScriptCode");
}

static void Native_ThrowAllCustomItems(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    SetVariantString("self.ThrowAllCustomItems()");
    AcceptEntityInput(player, "RunScriptCode");
}

static void Native_ThrowAllWeapons(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    SetVariantString("self.ThrowAllWeapons()");
    AcceptEntityInput(player, "RunScriptCode");
}

static void Native_VoiceCommand(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    int voice = GetNativeCell(2);
    bool cooldown = GetNativeCell(3);

    char code[64];
    FormatEx(code, sizeof(code), "self.VoiceCommand(%d,%s)", voice, cooldown ? "true" : "false");
    SetVariantString(code);
    AcceptEntityInput(player, "RunScriptCode");
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

static any Native_IsInfected(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    return NMR_Player(player).m_flInfectionTime != -1.0;
}

static any Native_GetSpeed(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    float velocity[3];
    NMR_Player(player).GetVelocity(velocity);

    bool ignoreVertical = GetNativeCell(2);
    if (ignoreVertical)
        velocity[2] = 0.0;

    return GetVectorLength(velocity);
}

static any Native_GetEntityDistance(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        log.ThrowErrorEx(LogLevel_Error, "invalid player %d", player);

    int entity = GetNativeCell(2);
    if (!IsValidEntity(entity))
        log.ThrowErrorEx(LogLevel_Error, "invalid entity %d", player);

    float playerPosition[3];
    NMR_Player(player).GetAbsOrigin(playerPosition);

    float entityPosition[3];
    GetEntPropVector(entity, Prop_Data, "m_vecAbsOrigin", entityPosition);

    return GetVectorDistance(playerPosition, entityPosition);
}

static void Native_ForceSpawnNearby(Handle plugin, int numParams)
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
