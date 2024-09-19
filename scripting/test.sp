
#include <clients_methodmap>
#include <vscript_proxy>
#include <nmrih_player>
#include <sdktools_tempents>
#include <sdkhooks>
#include <sdktools>
#include <sdktools_hooks>



#pragma newdecls required
#pragma semicolon 1

// public APLRes AskPluginLoad2(Handle myself, bool late, char[] error, int err_max)
// {
//     PrintToServer("======= AskPluginLoad2 =======");
//     return  APLRes_Success;
// }


public void OnPluginStart()
{
    PrintToServer("======= OnPluginStart =======");
    RegConsoleCmd("tp1", CMD_AddCarriedWeight);
    RegConsoleCmd("tp2", CMD_Ammo_Drop);
    RegConsoleCmd("tp3", CMD_ApplyBandage);
    RegConsoleCmd("tp4", CMD_ApplyFirstAidKit);
    RegConsoleCmd("tp5", CMD_ApplyVaccine);
    RegConsoleCmd("tp6", CMD_BleedOut);
    RegConsoleCmd("tp7", CMD_CancelSuicide);
    RegConsoleCmd("tp8", CMD_CancelThrowDrop);
    RegConsoleCmd("tp9", CMD_ClearHandModelOverride);
    RegConsoleCmd("tp10", CMD_ContemplateSuicide);
    RegConsoleCmd("tp11", CMD_DeathCount);
    RegConsoleCmd("tp12", CMD_DecrementRespawnTokens);
    RegConsoleCmd("tp13", CMD_DestroyAllAmmo);
    RegConsoleCmd("tp14", CMD_DestroyAllWeapons);
    RegConsoleCmd("tp15", CMD_DestroyEverything);
    RegConsoleCmd("tp16", CMD_DoCommitSuicide);
    RegConsoleCmd("tp17", CMD_DropEverything);
    RegConsoleCmd("tp18", CMD_EnableSprint);
    RegConsoleCmd("tp19", CMD_GetAmmoCarryWeight);
    // RegConsoleCmd("tp21", CMD_GetCarriedItems);
    RegConsoleCmd("tp21", CMD_GetCarriedWeight);
    RegConsoleCmd("tp22", CMD_GetJumpStaminaCost);
    RegConsoleCmd("tp23", CMD_GetLastObserverMode);
    RegConsoleCmd("tp24", CMD_GetNextRespawnTime);
    RegConsoleCmd("tp25", CMD_GetMaxCarriedWeight);
    RegConsoleCmd("tp26", CMD_GetNextSpawnTryTime);
    RegConsoleCmd("tp27", CMD_GetSpeedModifier);
    RegConsoleCmd("tp28", CMD_GetSpeedOverride);
    RegConsoleCmd("tp29", CMD_GetStamina);
    RegConsoleCmd("tp30", CMD_GetThrowScale);
    // // RegConsoleCmd("tp31", CMD_GetThrowVector);
    RegConsoleCmd("tp32", CMD_HasFlashlight);
    RegConsoleCmd("tp33", CMD_HasLeftoverWeight);
    RegConsoleCmd("tp34", CMD_HasWalkieTalkie);
    RegConsoleCmd("tp35", CMD_IncreaseBloodiness);
    RegConsoleCmd("tp36", CMD_IncrementRespawnTokens);
    RegConsoleCmd("tp37", CMD_IsBleedingOut);
    RegConsoleCmd("tp38", CMD_IsContemplatingSuicide);
    RegConsoleCmd("tp39", CMD_IsDucking);
    RegConsoleCmd("tp40", CMD_IsExtracted);
    RegConsoleCmd("tp41", CMD_IsGrabbed);
    RegConsoleCmd("tp42", CMD_IsHost);
    RegConsoleCmd("tp43", CMD_IsInLevelTransition);
    RegConsoleCmd("tp44", CMD_IsJumping);
    RegConsoleCmd("tp45", CMD_IsPartialBlindnessActive);
    RegConsoleCmd("tp46", CMD_IsSprinting);
    RegConsoleCmd("tp47", CMD_IsTalkingLocal);
    RegConsoleCmd("tp48", CMD_IsTalkingWalkie);
    RegConsoleCmd("tp49", CMD_IsUsingProgressTrigger);
    RegConsoleCmd("tp50", CMD_IsVaccinated);
    RegConsoleCmd("tp51", CMD_IsVoiceCommandTimerExpired);
    RegConsoleCmd("tp52", CMD_ReadyToRespawn);
    RegConsoleCmd("tp53", CMD_RemoveCarriedWeight);
    RegConsoleCmd("tp54", CMD_RemoveInflictions);
    RegConsoleCmd("tp55", CMD_ResetRespawnTokens);
    RegConsoleCmd("tp56", CMD_ResetVoiceCommandTimer);
    RegConsoleCmd("tp57", CMD_RespawnTokenCount);
    RegConsoleCmd("tp58", CMD_SetExtracted);
    RegConsoleCmd("tp59", CMD_SetHandModelOverride);
    RegConsoleCmd("tp60", CMD_SetIdleTimeout);
    RegConsoleCmd("tp61", CMD_SetIgnoreFallDamage);
    RegConsoleCmd("tp62", CMD_SetNextRespawnTime);
    RegConsoleCmd("tp63", CMD_SetNextSpawnTryTime);
    RegConsoleCmd("tp64", CMD_SetRespawnTokens);
    RegConsoleCmd("tp65", CMD_SetSpawnWeapon);
    RegConsoleCmd("tp66", CMD_SetSpeedModifier);
    RegConsoleCmd("tp67", CMD_SetSpeedOverride);
    RegConsoleCmd("tp68", CMD_SetStamina);
    RegConsoleCmd("tp69", CMD_SetUsingProgressTrigger);
    RegConsoleCmd("tp70", CMD_ShouldIgnoreFallDamage);
    RegConsoleCmd("tp71", CMD_StopBleedingOut);
    RegConsoleCmd("tp72", CMD_ThrowAllAmmo);
    RegConsoleCmd("tp73", CMD_ThrowAllCustomItems);
    RegConsoleCmd("tp74", CMD_ThrowAllWeapons);
    RegConsoleCmd("tp75", CMD_VoiceCommand);
    RegConsoleCmd("tp76", CMD_IsMoving);
    RegConsoleCmd("tp77", CMD_GetAliveDuration);
    RegConsoleCmd("tp78", CMD_FlashlightIsOn);
    RegConsoleCmd("tp79", CMD_FlashlightTurnOn);
    RegConsoleCmd("tp80", CMD_FlashlightTurnOff);
    RegConsoleCmd("tp81", CMD_CureInfection);
    RegConsoleCmd("tp82", CMD_BecomeInfected);
    RegConsoleCmd("tp83", CMD_TakePills);
    RegConsoleCmd("tp84", CMD_IsValidObserverTarget);
    RegConsoleCmd("tp85", CMD_CanSprint);
    RegConsoleCmd("tp86", CMD_IsBarricading);
    RegConsoleCmd("tp87", CMD_IsInfected);
    RegConsoleCmd("tp88", CMD_m_ArmorValue);
    RegConsoleCmd("tp89", CMD_m_flNextAttack);
    RegConsoleCmd("tp90", CMD_m_nBody);
    RegConsoleCmd("tp91", CMD_m_nSkin);
    RegConsoleCmd("tp92", CMD_m_nModelIndex);
    RegConsoleCmd("tp93", CMD_m_iMaxHealth);
    RegConsoleCmd("tp94", CMD_m_LastHitGroup);
    RegConsoleCmd("tp95", CMD_m_iFrags);
    RegConsoleCmd("tp96", CMD_m_flGravity);
    RegConsoleCmd("tp97", CMD_Velocity);
    RegConsoleCmd("tp98", CMD_AbsOrigin);
    RegConsoleCmd("tp99", CMD_AbsAngles);
    RegConsoleCmd("tp100", CMD_Maxs);
    RegConsoleCmd("tp101", CMD_Mins);
    RegConsoleCmd("tp102", CMD_Speed);
    RegConsoleCmd("tpb", CMD_benchmark);
}

public void OnClientPutInServer(int client)
{
    SetHudTextParams(1.0, 1.0, 0.1, 16, 255, 16, 255);
}

Action CMD_AddCarriedWeight(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    int num = GetCmdArgInt(1);
    PrintToServer("======= CMD_AddCarriedWeight Start | params=%d |=======", num);
    player.AddCarriedWeight(num);
    return Plugin_Handled;
}

Action CMD_Ammo_Drop(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("Ammo_Drop amoo='%s' result=%d", "12gauge", player.Ammo_Drop("12gauge"));
    return Plugin_Handled;
}

Action CMD_ApplyBandage(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= ApplyBandage Start =======");
    player.ApplyBandage();
    return Plugin_Handled;
}

Action CMD_ApplyFirstAidKit(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= ApplyFirstAidKit Start =======");
    player.ApplyFirstAidKit();
    return Plugin_Handled;
}

Action CMD_ApplyVaccine(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= ApplyVaccine Start =======");
    player.ApplyVaccine();
    return Plugin_Handled;
}

Action CMD_BleedOut(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= BleedOut Start =======");
    player.BleedOut();
    return Plugin_Handled;
}

Action CMD_CancelSuicide(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    static bool flag = true;
    flag = !flag;
    PrintToServer("======= CancelSuicide Start | params=%d |=======", params);
    player.CancelSuicide(view_as<bool>(params));
    return Plugin_Handled;
}

Action CMD_CancelThrowDrop(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= CancelThrowDrop Start =======");
    player.CancelThrowDrop();
    return Plugin_Handled;
}

Action CMD_ClearHandModelOverride(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= ClearHandModelOverride Start =======");
    player.ClearHandModelOverride();
    return Plugin_Handled;
}

Action CMD_ContemplateSuicide(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= ContemplateSuicide Start =======");
    player.ContemplateSuicide();
    return Plugin_Handled;
}

Action CMD_DeathCount(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("DeathCount = %d", player.DeathCount());
    return Plugin_Handled;
}

Action CMD_DecrementRespawnTokens(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= DecrementRespawnTokens Start =======");
    player.DecrementRespawnTokens();
    return Plugin_Handled;
}

Action CMD_DestroyAllAmmo(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= DestroyAllAmmo Start =======");
    player.DestroyAllAmmo();
    return Plugin_Handled;
}

Action CMD_DestroyAllWeapons(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= DestroyAllWeapons Start =======");
    player.DestroyAllWeapons();
    return Plugin_Handled;
}

Action CMD_DestroyEverything(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= DestroyEverything Start =======");
    player.DestroyEverything();
    return Plugin_Handled;
}

Action CMD_DoCommitSuicide(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= DoCommitSuicide Start =======");
    player.DoCommitSuicide();
    return Plugin_Handled;
}

Action CMD_DropEverything(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= DropEverything Start =======");
    player.DropEverything();
    return Plugin_Handled;
}

Action CMD_EnableSprint(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= EnableSprint Start | params=%d |=======", params);
    player.EnableSprint(view_as<bool>(params));
    return Plugin_Handled;
}

Action CMD_GetAmmoCarryWeight(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("GetAmmoCarryWeight = %d", player.GetAmmoCarryWeight());
    return Plugin_Handled;
}

// Action CMD_GetCarriedItems(int client, int params)
// {
//     if (!CheckClient(client))       return Plugin_Handled;
//     NMR_Player player = NMR_Player(client);

//     PrintToServer("======= GetCarriedItems Start =======", params);
//     player.EnableSprint(params);
//     return Plugin_Handled;
// }

Action CMD_GetCarriedWeight(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("GetCarriedWeight = %d", player.GetCarriedWeight());
    return Plugin_Handled;
}

Action CMD_GetJumpStaminaCost(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("GetJumpStaminaCost = %f", player.GetJumpStaminaCost());
    return Plugin_Handled;
}

Action CMD_GetLastObserverMode(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("GetLastObserverMode = %d", player.GetLastObserverMode());
    return Plugin_Handled;
}

Action CMD_GetNextRespawnTime(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("GetNextRespawnTime = %f", player.GetNextRespawnTime());
    return Plugin_Handled;
}

Action CMD_GetMaxCarriedWeight(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("GetMaxCarriedWeight = %f", player.GetMaxCarriedWeight());
    return Plugin_Handled;
}

Action CMD_GetNextSpawnTryTime(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("GetNextSpawnTryTime = %f", player.GetNextSpawnTryTime());
    return Plugin_Handled;
}

Action CMD_GetSpeedModifier(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("GetSpeedModifier = %f", player.GetSpeedModifier());
    return Plugin_Handled;
}

Action CMD_GetSpeedOverride(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("GetSpeedOverride = %f", player.GetSpeedOverride());
    return Plugin_Handled;
}

Action CMD_GetStamina(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("GetStamina = %f", player.GetStamina());
    return Plugin_Handled;
}

Action CMD_GetThrowScale(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("GetThrowScale = %f", player.GetThrowScale());
    return Plugin_Handled;
}

Action CMD_HasFlashlight(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("HasFlashlight = %d", player.HasFlashlight());
    return Plugin_Handled;
}

Action CMD_HasLeftoverWeight(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("HasLeftoverWeight(500) = %d", player.HasLeftoverWeight(500));
    return Plugin_Handled;
}

Action CMD_HasWalkieTalkie(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("HasWalkieTalkie = %d", player.HasWalkieTalkie());
    return Plugin_Handled;
}

Action CMD_IncreaseBloodiness(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= IncreaseBloodiness Start =======");
    player.IncreaseBloodiness();
    return Plugin_Handled;
}

Action CMD_IncrementRespawnTokens(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= IncrementRespawnTokens Start =======");
    player.IncrementRespawnTokens();
    return Plugin_Handled;
}

Action CMD_IsBleedingOut(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("IsBleedingOut = %d", player.IsBleedingOut());
    return Plugin_Handled;
}

Action CMD_IsContemplatingSuicide(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("IsContemplatingSuicide = %d", player.IsContemplatingSuicide());
    return Plugin_Handled;
}

Action CMD_IsDucking(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("IsDucking = %d", player.IsDucking());
    return Plugin_Handled;
}

Action CMD_IsExtracted(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("IsExtracted = %d", player.IsExtracted());
    return Plugin_Handled;
}

Action CMD_IsGrabbed(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("IsGrabbed = %d", player.IsGrabbed());
    return Plugin_Handled;
}

Action CMD_IsHost(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("IsHost = %d", player.IsHost());
    return Plugin_Handled;
}

Action CMD_IsInLevelTransition(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("IsInLevelTransition = %d", player.IsInLevelTransition());
    return Plugin_Handled;
}

Action CMD_IsJumping(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("IsJumping = %d", player.IsJumping());
    return Plugin_Handled;
}

Action CMD_IsPartialBlindnessActive(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("IsPartialBlindnessActive = %d", player.IsPartialBlindnessActive());
    return Plugin_Handled;
}

Action CMD_IsSprinting(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("IsSprinting = %d", player.IsSprinting());
    return Plugin_Handled;
}

Action CMD_IsTalkingLocal(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("IsTalkingLocal = %d", player.IsTalkingLocal());
    return Plugin_Handled;
}

Action CMD_IsTalkingWalkie(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("IsTalkingWalkie = %d", player.IsTalkingWalkie());
    return Plugin_Handled;
}

Action CMD_IsUsingProgressTrigger(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("IsUsingProgressTrigger = %d", player.IsUsingProgressTrigger());
    return Plugin_Handled;
}

Action CMD_IsVaccinated(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("IsVaccinated = %d", player.IsVaccinated());
    return Plugin_Handled;
}

Action CMD_IsVoiceCommandTimerExpired(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("IsVoiceCommandTimerExpired = %d", player.IsVoiceCommandTimerExpired());
    return Plugin_Handled;
}

Action CMD_ReadyToRespawn(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("ReadyToRespawn = %d", player.ReadyToRespawn());
    return Plugin_Handled;
}

Action CMD_RemoveCarriedWeight(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    int weight = GetCmdArgInt(1);
    PrintToServer("======= RemoveCarriedWeight Start ======= | weight = %d |", weight);
    player.RemoveCarriedWeight(weight);
    return Plugin_Handled;
}

Action CMD_RemoveInflictions(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= RemoveInflictions Start =======");
    player.RemoveInflictions();
    return Plugin_Handled;
}

Action CMD_ResetRespawnTokens(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= ResetRespawnTokens Start =======");
    player.ResetRespawnTokens();
    return Plugin_Handled;
}

Action CMD_ResetVoiceCommandTimer(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= ResetVoiceCommandTimer Start =======");
    player.ResetVoiceCommandTimer();
    return Plugin_Handled;
}

Action CMD_RespawnTokenCount(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("ResetRespawnTokens = %d", player.ResetRespawnTokens());
    return Plugin_Handled;
}

Action CMD_SetExtracted(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= SetExtracted Start ======= | params = %d |", params);
    player.SetExtracted(view_as<bool>(params));
    return Plugin_Handled;
}

Action CMD_SetHandModelOverride(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    char model[PLATFORM_MAX_PATH];
    GetCmdArg(1, model, sizeof(model));

    PrintToServer("======= SetHandModelOverride Start ======= | model=%s |", model);
    player.SetHandModelOverride(model);
    return Plugin_Handled;
}

Action CMD_SetIdleTimeout(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    float time = GetCmdArgFloat(1);
    PrintToServer("======= SetIdleTimeout Start ======= | time=%f |", time);
    player.SetIdleTimeout(time);
    return Plugin_Handled;
}

Action CMD_SetIgnoreFallDamage(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= SetIgnoreFallDamage Start ======= | params=%d |", params);
    player.SetIgnoreFallDamage(view_as<bool>(params));
    return Plugin_Handled;
}

Action CMD_SetNextRespawnTime(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    float time = GetCmdArgFloat(1);
    PrintToServer("======= SetNextRespawnTime Start ======= | time=%f |", time);
    player.SetNextRespawnTime(time);
    return Plugin_Handled;
}

Action CMD_SetNextSpawnTryTime(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    float time = GetCmdArgFloat(1);
    PrintToServer("======= SetNextSpawnTryTime Start ======= | time=%f |", time);
    player.SetNextSpawnTryTime(time);
    return Plugin_Handled;
}

Action CMD_SetRespawnTokens(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    int tokens = GetCmdArgInt(1);
    bool notify = view_as<bool>(GetCmdArgInt(2));
    PrintToServer("======= SetRespawnTokens Start ======= | tokens=%d notify=%d |", tokens, notify);
    player.SetRespawnTokens(tokens, notify);
    return Plugin_Handled;
}

Action CMD_SetSpawnWeapon(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    char classname[PLATFORM_MAX_PATH];
    GetCmdArg(1, classname, sizeof(classname));
    int ammoPercent = view_as<bool>(GetCmdArgInt(2));
    PrintToServer("======= SetSpawnWeapon Start ======= | classname=%s ammoPercent=%d |", classname, ammoPercent);
    player.SetSpawnWeapon(classname, ammoPercent);
    return Plugin_Handled;
}

Action CMD_SetSpeedModifier(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    float value = GetCmdArgFloat(1);
    PrintToServer("======= SetSpeedModifier Start ======= | value=%f |", value);
    player.SetSpeedModifier(value);
    return Plugin_Handled;
}

Action CMD_SetSpeedOverride(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    float speed = GetCmdArgFloat(1);
    PrintToServer("======= SetSpeedOverride Start ======= | speed=%f |", speed);
    player.SetSpeedOverride(speed);
    return Plugin_Handled;
}

Action CMD_SetStamina(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    float stamina = GetCmdArgFloat(1);
    PrintToServer("======= SetStamina Start ======= | stamina=%f |", stamina);
    player.SetStamina(stamina);
    return Plugin_Handled;
}

Action CMD_SetUsingProgressTrigger(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    bool value = view_as<bool>(GetCmdArgFloat(1));
    PrintToServer("======= SetUsingProgressTrigger Start ======= | value=%f |", value);
    player.SetUsingProgressTrigger(value);
    return Plugin_Handled;
}

Action CMD_ShouldIgnoreFallDamage(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= ShouldIgnoreFallDamage = %d ", player.ShouldIgnoreFallDamage());
    return Plugin_Handled;
}

Action CMD_StopBleedingOut(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= StopBleedingOut Start =======");
    player.StopBleedingOut();
    return Plugin_Handled;
}

Action CMD_ThrowAllAmmo(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= ThrowAllAmmo Start ======= ");
    player.ThrowAllAmmo();
    return Plugin_Handled;
}

Action CMD_ThrowAllCustomItems(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= ThrowAllCustomItems Start ======= ");
    player.ThrowAllCustomItems();
    return Plugin_Handled;
}

Action CMD_ThrowAllWeapons(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= ThrowAllWeapons Start ======= ");
    player.ThrowAllWeapons();
    return Plugin_Handled;
}

Action CMD_VoiceCommand(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    int voice = GetCmdArgInt(1);
    bool cooldown = view_as<bool>(GetCmdArgInt(2));
    PrintToServer("======= VoiceCommand Start ======= | voice=%d, cooldown=%d", voice, cooldown);
    player.VoiceCommand(voice, cooldown);
    return Plugin_Handled;
}

Action CMD_IsMoving(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= IsMoving = %d ", player.IsMoving());
    return Plugin_Handled;
}

Action CMD_GetAliveDuration(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= GetAliveDuration = %f ", player.GetAliveDuration());
    return Plugin_Handled;
}

Action CMD_FlashlightIsOn(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= FlashlightIsOn = %d ", player.FlashlightIsOn());
    return Plugin_Handled;
}

Action CMD_FlashlightTurnOn(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= FlashlightTurnOn Start ======= ");
    player.FlashlightTurnOn();
    return Plugin_Handled;
}

Action CMD_FlashlightTurnOff(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= FlashlightTurnOff Start ======= ");
    player.FlashlightTurnOff();
    return Plugin_Handled;
}

Action CMD_CureInfection(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= CureInfection Start ======= ");
    player.CureInfection();
    return Plugin_Handled;
}

Action CMD_BecomeInfected(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= BecomeInfected Start ======= ");
    player.BecomeInfected();
    return Plugin_Handled;
}

Action CMD_TakePills(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= TakePills Start ======= ");
    player.TakePills();
    return Plugin_Handled;
}

Action CMD_IsValidObserverTarget(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    int entity = GetCmdArgInt(1);
    PrintToServer("======= IsValidObserverTarget(%d) = %d ", entity, player.IsValidObserverTarget(entity));
    return Plugin_Handled;
}

Action CMD_CanSprint(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= CanSprint = %d ", player.CanSprint());
    return Plugin_Handled;
}

Action CMD_IsBarricading(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= IsBarricading = %d ", player.IsBarricading());
    return Plugin_Handled;
}

Action CMD_IsInfected(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    PrintToServer("======= IsInfected = %d ", player.IsInfected());
    return Plugin_Handled;
}

Action CMD_m_ArmorValue(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    if (params == 0)
    {
        PrintToServer("======= Get m_ArmorValue = %d", player.m_ArmorValue);
    }
    else 
    {
        int value = GetCmdArgInt(1);
        player.m_ArmorValue = value;
        PrintToServer("======= Set m_ArmorValue = %d", value);
    }
    return Plugin_Handled;
}

Action CMD_m_flNextAttack(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    if (params == 0)
    {
        PrintToServer("======= Get m_flNextAttack = %f", player.m_flNextAttack);
    }
    else 
    {
        float value = GetCmdArgFloat(1);
        player.m_flNextAttack = value;
        PrintToServer("======= Set m_flNextAttack = %f", value);
    }
    return Plugin_Handled;
}

Action CMD_m_nBody(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    if (params == 0)
    {
        PrintToServer("======= Get m_nBody = %d", player.m_nBody);
    }
    else 
    {
        int value = GetCmdArgInt(1);
        player.m_nBody = value;
        PrintToServer("======= Set m_nBody = %d", value);
    }
    return Plugin_Handled;
}

Action CMD_m_nSkin(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    if (params == 0)
    {
        PrintToServer("======= Get m_nSkin = %d", player.m_nSkin);
    }
    else 
    {
        int value = GetCmdArgInt(1);
        player.m_nSkin = value;
        PrintToServer("======= Set m_nSkin = %d", value);
    }
    return Plugin_Handled;
}

Action CMD_m_nModelIndex(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    if (params == 0)
    {
        PrintToServer("======= Get m_nModelIndex = %d", player.m_nModelIndex);
    }
    else 
    {
        int value = GetCmdArgInt(1);
        player.m_nModelIndex = value;
        PrintToServer("======= Set m_nModelIndex = %d", value);
    }
    return Plugin_Handled;
}

Action CMD_m_iMaxHealth(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    if (params == 0)
    {
        PrintToServer("======= Get m_iMaxHealth = %d", player.m_iMaxHealth);
    }
    else 
    {
        int value = GetCmdArgInt(1);
        player.m_iMaxHealth = value;
        PrintToServer("======= Set m_iMaxHealth = %d", value);
    }
    return Plugin_Handled;
}

Action CMD_m_LastHitGroup(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    if (params == 0)
    {
        PrintToServer("======= Get m_LastHitGroup = %d", player.m_LastHitGroup);
    }
    else 
    {
        int value = GetCmdArgInt(1);
        player.m_LastHitGroup = value;
        PrintToServer("======= Set m_LastHitGroup = %d", value);
    }
    return Plugin_Handled;
}

Action CMD_m_iFrags(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    if (params == 0)
    {
        PrintToServer("======= Get m_iFrags = %d", player.m_iFrags);
    }
    else 
    {
        int value = GetCmdArgInt(1);
        player.m_iFrags = value;
        PrintToServer("======= Set m_iFrags = %d", value);
    }
    return Plugin_Handled;
}

Action CMD_m_flGravity(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    if (params == 0)
    {
        PrintToServer("======= Get m_flGravity = %f", player.m_flGravity);
    }
    else 
    {
        float value = GetCmdArgFloat(1);
        player.m_flGravity = value;
        PrintToServer("======= Set m_flGravity = %f", value);
    }
    return Plugin_Handled;
}

Action CMD_Velocity(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    float vec[3];
    if (params == 0)
    {
        player.GetVelocity(vec);
        PrintToServer("======= Get Velocity = %f, %f, %f", vec[0], vec[1], vec[2]);
    }
    else 
    {
        vec[0] = vec[1] = vec[2] = GetCmdArgFloat(1);
        player.SetVelocity(vec);
        PrintToServer("======= Set Velocity = %f, %f, %f", vec[0], vec[1], vec[2]);
    }
    return Plugin_Handled;
}

Action CMD_AbsOrigin(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    float vec[3];
    if (params == 0)
    {
        player.GetAbsOrigin(vec);
        PrintToServer("======= Get AbsOrigin = %f, %f, %f", vec[0], vec[1], vec[2]);
    }
    else 
    {
        vec[0] = vec[1] = vec[2] = GetCmdArgFloat(1);
        player.SetAbsOrigin(vec);
        PrintToServer("======= Set AbsOrigin = %f, %f, %f", vec[0], vec[1], vec[2]);
    }
    return Plugin_Handled;
}

Action CMD_AbsAngles(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    float vec[3];
    if (params == 0)
    {
        player.GetAbsAngles(vec);
        PrintToServer("======= Get AbsAngles = %f, %f, %f", vec[0], vec[1], vec[2]);
    }
    else 
    {
        vec[0] = vec[1] = vec[2] = GetCmdArgFloat(1);
        player.SetAbsAngles(vec);
        PrintToServer("======= Set AbsAngles = %f, %f, %f", vec[0], vec[1], vec[2]);
    }
    return Plugin_Handled;
}

Action CMD_Maxs(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    float vec[3];
    if (params == 0)
    {
        player.GetMaxs(vec);
        PrintToServer("======= Get Maxs = %f, %f, %f", vec[0], vec[1], vec[2]);
    }
    else 
    {
        vec[0] = vec[1] = vec[2] = GetCmdArgFloat(1);
        player.SetMaxs(vec);
        PrintToServer("======= Set Maxs = %f, %f, %f", vec[0], vec[1], vec[2]);
    }
    return Plugin_Handled;
}

Action CMD_Mins(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;
    NMR_Player player = NMR_Player(client);

    float vec[3];
    if (params == 0)
    {
        player.GetMins(vec);
        PrintToServer("======= Get Mins = %f, %f, %f", vec[0], vec[1], vec[2]);
    }
    else 
    {
        vec[0] = vec[1] = vec[2] = GetCmdArgFloat(1);
        player.SetMins(vec);
        PrintToServer("======= Set Mins = %f, %f, %f", vec[0], vec[1], vec[2]);
    }
    return Plugin_Handled;
}

Action CMD_Speed(int client, int params)
{
    if (!CheckClient(client))       return Plugin_Handled;

    PrintToServer("======= Get Speed = %f", NMR_Player(client).GetSpeed());
    return Plugin_Handled;
}











// public Action NMR_OnPlayerCureInfection(int client)
// {
//     PrintToServer("Test %s client %N", "NMR_OnPlayerCureInfection", client);
//     return Plugin_Continue;
// }

// public void NMR_OnPlayerCureInfectionPost(int client)
// {
//     PrintToServer("Test %s client %N", "NMR_OnPlayerCureInfectionPost", client);
// }

// public Action NMR_OnPlayerBecomeInfected(int client)
// {
//     PrintToServer("Test %s client %N", "NMR_OnPlayerBecomeInfected", client);
//     return Plugin_Continue;
// }

// public void NMR_OnPlayerBecomeInfectedPost(int client)
// {
//     PrintToServer("Test %s client %N", "NMR_OnPlayerBecomeInfectedPost", client);
// }

// public Action NMR_OnPlayerTakePills(int client)
// {
//     PrintToServer("Test %s client %N", "NMR_OnPlayerTakePills", client);
//     return Plugin_Continue;
// }

// public void NMR_OnPlayerTakePillsPost(int client)
// {
//     PrintToServer("Test %s client %N", "NMR_OnPlayerTakePillsPost", client);
// }

// public Action NMR_OnPlayerOnGrabbedBegin(int client)
// {
//     PrintToServer("Test %s client %N", "NMR_OnPlayerOnGrabbedBegin", client);
//     return Plugin_Continue;
// }

// public void NMR_OnPlayerOnGrabbedBeginPost(int client)
// {
//     PrintToServer("Test %s client %N", "NMR_OnPlayerOnGrabbedBeginPost", client);
// }

// public Action NMR_OnPlayerApplyBandage(int client)
// {
//     PrintToServer("Test %s client %N", "NMR_OnPlayerApplyBandage", client);
//     return Plugin_Continue;
// }

// public void NMR_OnPlayerApplyBandagePost(int client)
// {
//     PrintToServer("Test %s client %N", "NMR_OnPlayerApplyBandagePost", client);
// }

// public Action NMR_OnPlayerApplyFirstAidKit(int client)
// {
//     PrintToServer("Test %s client %N", "NMR_OnPlayerApplyFirstAidKit", client);
//     return Plugin_Continue;
// }

// public void NMR_OnPlayerApplyFirstAidKitPost(int client)
// {
//     PrintToServer("Test %s client %N", "NMR_OnPlayerApplyFirstAidKitPost", client);
// }


// public Action NMR_OnPlayerApplyVaccine(int client)
// {
//     PrintToServer("Test %s client %N", "NMR_OnPlayerApplyVaccine", client);
//     return Plugin_Continue;
// }

// public void NMR_OnPlayerApplyVaccinePost(int client)
// {
//     PrintToServer("Test %s client %N", "NMR_OnPlayerApplyVaccinePost", client);
// }

// public Action NMR_OnPlayerBleedOut(int client)
// {
//     PrintToServer("Test %s client %N", "NMR_OnPlayerBleedOut", client);
//     return Plugin_Continue;
// }

// public void NMR_OnPlayerBleedOutPost(int client)
// {
//     PrintToServer("Test %s client %N", "NMR_OnPlayerBleedOutPost", client);
// }

// public Action NMR_OnPlayerStopBleedingOut(int client)
// {
//     PrintToServer("Test %s client %N", "NMR_OnPlayerStopBleedingOut", client);
//     return Plugin_Continue;
// }

// public void NMR_OnPlayerStopBleedingOutPost(int client)
// {
//     PrintToServer("Test %s client %N", "NMR_OnPlayerStopBleedingOutPost", client);
// }



public Action OnPlayerRunCmd(int client, int &buttons, int &impulse, float vel[3], float angles[3], int &weapon, int &subtype, int &cmdnum, int &tickcount, int &seed, int mouse[2])
{
    // PrintToServer("%N | %b-%d | %d | ", client, buttons, buttons, impulse);
    // PrintToChatAll("%N | %d | %d | ", client, buttons, impulse);
    SetHudTextParams(0.0, 1.0, 0.1, 16, 255, 16, 255, 0, 0.0, 0.0, 0.0);
    ShowHudText(client, -1, "%N | %10d | %d | ", client, buttons, NMR_Player(client).m_iHealth);
    return Plugin_Continue;
}









/**
 * EntityInput = 26.119720 - 17.442358 = 8.677362
 * VScript = 38.928943 - 26.119804 = 12.809139
 * SDKCall = 40.162185 - 38.929157 = 1.233028
 */
Action CMD_benchmark(int client, int params)
{
    // PrintToServer("======= CMD_BleedOut Start =======");
    if (!CheckClient(client))   return Plugin_Handled;

    NMR_Player player = NMR_Player(client);
    if (!player.IsValid)
    {
        PrintToServer("Command client is invaid %d", client);
        return Plugin_Handled;
    }


    GameData gamedata = new GameData("nmrih_player.games");
    StartPrepSDKCall(SDKCall_Entity);
    PrepSDKCall_SetFromConf(gamedata, SDKConf_Signature, "CNMRiH_Player::BleedOut");
    Handle sig_BleedOut = EndPrepSDKCall();
    if (sig_BleedOut == INVALID_HANDLE)
    {
        PrintToServer("Get BleedOut Sig Failed");
        return Plugin_Handled;
    }

    StartPrepSDKCall(SDKCall_Entity);
    PrepSDKCall_SetFromConf(gamedata, SDKConf_Signature, "CNMRiH_Player::StopBleedingOut");
    Handle sig_StopBleedingOut = EndPrepSDKCall();
    if (sig_StopBleedingOut == INVALID_HANDLE)
    {
        PrintToServer("Get StopBleedingOut Sig Failed");
        return Plugin_Handled;
    }
        // SDKCall(sig_BleedOut, client);
        // SDKCall(sig_StopBleedingOut, client);
        // return Plugin_Handled;

    float startTime, endTime;
    int len=50_0000;

    startTime = GetEngineTime();
    for(int i=0; i<=len; ++i)
    {
        SetVariantString("self.BleedOut()");
        AcceptEntityInput(client, "RunScriptCode");
        SetVariantString("self.StopBleedingOut()");
        AcceptEntityInput(client, "RunScriptCode");
    }
    endTime = GetEngineTime();
    PrintToServer("EntityInput = %f - %f = %f", endTime, startTime, endTime - startTime);

    startTime = GetEngineTime();
    for(int i=0; i<=len; ++i)
    {
        RunEntVScript(client, "BleedOut()");
        RunEntVScript(client, "StopBleedingOut()");
    }
    endTime = GetEngineTime();
    PrintToServer("VScript = %f - %f = %f", endTime, startTime, endTime - startTime);

    startTime = GetEngineTime();
    for(int i=0; i<=len; ++i)
    {
        SDKCall(sig_BleedOut, client);
        SDKCall(sig_StopBleedingOut, client);
    }
    endTime = GetEngineTime();
    PrintToServer("SDKCall = %f - %f = %f", endTime, startTime, endTime - startTime);

    PrintToServer("======= CMD_BleedOut End =======");
    return Plugin_Handled;
}



bool CheckClient(int client)
{

    if (client > 0 && client <= MaxClients && IsClientInGame(client))
    {
        // PrintToServer("[%s] Start. | client = %L.", func, client);
        return true;
    }

    FrameIterator frames = new FrameIterator();
    frames.Next();
    frames.Next();
    char func[PLATFORM_MAX_PATH];
    frames.GetFunctionName(func, sizeof(func));

    PrintToServer("[%s] client %d is invalid.", func, client);
    return false;
}
