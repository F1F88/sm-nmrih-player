
/**
 * Add new offset check List
 * 1. scripting/nmrih_player.inc NMR_Player methodmap property
 * 2. scripting/nmrih_player/netprops.sp enum
 * 3. scripting/nmrih_player/netprops.sp LoadNetPropsOffset
 * 4. scripting/nmrih_player/netprops.sp LoadNetPropsNative
 * 5. scripting/nmrih_player/netprops.sp NativeCall
 */

#pragma newdecls required
#pragma semicolon 1

enum // Networkable Send Property Offset
{
    OFS_m_fEffects,                     // 204
    OFS_m_CollisionGroup,               // 500
    OFS_moveparent,                     // 340
    OFS_m_iParentAttachment,            // 337
    OFS_movetype,                       // 338
    OFS_movecollide,                    // 339
    OFS_m_bIsGlowable,                  // 996
    OFS_m_bGlowing,                     // 997
    OFS_m_clrGlowColor,                 // 1000
    OFS_m_flGlowDistance,               // 1004
    OFS_m_bGlowBlip,                    // 998
    OFS_m_hActiveWeapon,                // 2144
    OFS_m_flInfectionDeathTime,         // 2216
    OFS_m_flInfectionTime,              // 2212
    OFS_m_iHealth,                      // 248
    OFS_m_lifeState,                    // 252
    OFS_m_flMaxspeed,                   // 3576
    OFS_m_fFlags,                       // 284
    OFS_m_iObserverMode,                // 2940
    OFS_m_hObserverTarget,              // 2964
    OFS_m_iFOV,                         // 2944
    OFS_m_iFOVStart,                    // 2952
    OFS_m_flFOVTime,                    // 2956
    OFS_m_iDefaultFOV,                  // 2948
    OFS_m_iHideHUD,                     // 60
    OFS_m_flFOVRate,                    // 64
    OFS_m_bDucked,                      // 80
    OFS_m_bDucking,                     // 81
    OFS_m_bInDuckJump,                  // 82
    OFS_m_flDucktime,                   // 84
    OFS_m_flDuckJumpTime,               // 88
    OFS_m_flJumpTime,                   // 92
    OFS_m_flFallVelocity,               // 100
    OFS_m_bPoisoned,                    // 138
    OFS_m_flStepSize,                   // 140
    OFS_m_vecViewOffset_0,              // 824
    OFS_m_vecViewOffset_1,              // 828
    OFS_m_vecViewOffset_2,              // 832
    OFS_m_flFriction,                   // 636
    OFS_m_hLastWeapon,                  // 3668
    OFS_m_hGroundEntity,                // 532
    OFS_m_vecVelocity_0,                // 672
    OFS_m_vecVelocity_1,                // 676
    OFS_m_vecVelocity_2,                // 680
    OFS_m_flDeathTime,                  // 2932
    OFS_m_nWaterLevel,                  // 527
    OFS_m_flLaggedMovementValue,        // 3764
    OFS_m_flStamina,                    // 8
    OFS_m_bIsSprinting,                 // 4
    OFS_m_bTalkingWalkie,               // 4932
    OFS_m_bSprintEnabled,               // 4936
    OFS_m_bStickyIronsight,             // 4933
    OFS_m_bDiedWhileInfected,           // 4937
    OFS_m_bGrabbed,                     // 4938
    OFS__bleedingOut,                   // 4939
    OFS_m_flThrowDropTimer,             // 4912
    OFS__carriedWeight,                 // 4916
    OFS_m_iTokens,                      // 4928
    OFS_m_iDeaths,                      // 4924
    OFS__usingToolSecondary,            // 4941
    OFS__contemplatingSuicide,          // 4940
    OFS__playerModelIndex,              // 5012
    OFS__nextRespawnTime,               // 4948
    OFS__vaccinated,                    // 4935
    OFS_m_bGrabbedByCrawler,            // 4943
    OFS_m_flPartialBlindnessEffectEnd,  // 4956
    OFS_m_bIsExtracted,                 // 4934
    OFS_m_bUsingProgressTrigger,        // 4942
    OFS_m_bLevelTransition,             // 4944
    OFS_m_flSpeedModifier,              // 5028
    OFS_m_flSpeedOverride,              // 5032
    OFS_m_flTriggerSpeedModifier,       // 5036
    OFS_m_ArmorValue,                   // 3460
    OFS_m_flNextAttack,                 // 1728
    OFS_m_nBody,                        // 944
    OFS_m_nSkin,                        // 940
    OFS_m_nModelIndex,                  // 122

    OFS_Total
}   // Networkable Send Property Offset


static int iNetPropsOffset[OFS_Total];


void LoadNetPropsOffset()
{
    FindNetProps("CNMRiH_Player", "m_fEffects",                     OFS_m_fEffects);
    FindNetProps("CNMRiH_Player", "m_CollisionGroup",               OFS_m_CollisionGroup);
    FindNetProps("CNMRiH_Player", "moveparent",                     OFS_moveparent);
    FindNetProps("CNMRiH_Player", "m_iParentAttachment",            OFS_m_iParentAttachment);
    FindNetProps("CNMRiH_Player", "movetype",                       OFS_movetype);
    FindNetProps("CNMRiH_Player", "movecollide",                    OFS_movecollide);
    FindNetProps("CNMRiH_Player", "m_bIsGlowable",                  OFS_m_bIsGlowable);
    FindNetProps("CNMRiH_Player", "m_bGlowing",                     OFS_m_bGlowing);
    FindNetProps("CNMRiH_Player", "m_clrGlowColor",                 OFS_m_clrGlowColor);
    FindNetProps("CNMRiH_Player", "m_flGlowDistance",               OFS_m_flGlowDistance);
    FindNetProps("CNMRiH_Player", "m_bGlowBlip",                    OFS_m_bGlowBlip);
    FindNetProps("CNMRiH_Player", "m_hActiveWeapon",                OFS_m_hActiveWeapon);
    FindNetProps("CNMRiH_Player", "m_flInfectionDeathTime",         OFS_m_flInfectionDeathTime);
    FindNetProps("CNMRiH_Player", "m_flInfectionTime",              OFS_m_flInfectionTime);
    FindNetProps("CNMRiH_Player", "m_iHealth",                      OFS_m_iHealth);
    FindNetProps("CNMRiH_Player", "m_lifeState",                    OFS_m_lifeState);
    FindNetProps("CNMRiH_Player", "m_flMaxspeed",                   OFS_m_flMaxspeed);
    FindNetProps("CNMRiH_Player", "m_fFlags",                       OFS_m_fFlags);
    FindNetProps("CNMRiH_Player", "m_iObserverMode",                OFS_m_iObserverMode);
    FindNetProps("CNMRiH_Player", "m_hObserverTarget",              OFS_m_hObserverTarget);
    FindNetProps("CNMRiH_Player", "m_iFOV",                         OFS_m_iFOV);
    FindNetProps("CNMRiH_Player", "m_iFOVStart",                    OFS_m_iFOVStart);
    FindNetProps("CNMRiH_Player", "m_flFOVTime",                    OFS_m_flFOVTime);
    FindNetProps("CNMRiH_Player", "m_iDefaultFOV",                  OFS_m_iDefaultFOV);
    FindNetProps("CNMRiH_Player", "m_iHideHUD",                     OFS_m_iHideHUD);
    FindNetProps("CNMRiH_Player", "m_flFOVRate",                    OFS_m_flFOVRate);
    FindNetProps("CNMRiH_Player", "m_bDucked",                      OFS_m_bDucked);
    FindNetProps("CNMRiH_Player", "m_bDucking",                     OFS_m_bDucking);
    FindNetProps("CNMRiH_Player", "m_bInDuckJump",                  OFS_m_bInDuckJump);
    FindNetProps("CNMRiH_Player", "m_flDucktime",                   OFS_m_flDucktime);
    FindNetProps("CNMRiH_Player", "m_flDuckJumpTime",               OFS_m_flDuckJumpTime);
    FindNetProps("CNMRiH_Player", "m_flJumpTime",                   OFS_m_flJumpTime);
    FindNetProps("CNMRiH_Player", "m_flFallVelocity",               OFS_m_flFallVelocity);
    FindNetProps("CNMRiH_Player", "m_bPoisoned",                    OFS_m_bPoisoned);
    FindNetProps("CNMRiH_Player", "m_flStepSize",                   OFS_m_flStepSize);
    FindNetProps("CNMRiH_Player", "m_vecViewOffset[0]",             OFS_m_vecViewOffset_0);
    FindNetProps("CNMRiH_Player", "m_vecViewOffset[1]",             OFS_m_vecViewOffset_1);
    FindNetProps("CNMRiH_Player", "m_vecViewOffset[2]",             OFS_m_vecViewOffset_2);
    FindNetProps("CNMRiH_Player", "m_flFriction",                   OFS_m_flFriction);
    FindNetProps("CNMRiH_Player", "m_hLastWeapon",                  OFS_m_hLastWeapon);
    FindNetProps("CNMRiH_Player", "m_hGroundEntity",                OFS_m_hGroundEntity);
    FindNetProps("CNMRiH_Player", "m_vecVelocity[0]",               OFS_m_vecVelocity_0);
    FindNetProps("CNMRiH_Player", "m_vecVelocity[1]",               OFS_m_vecVelocity_1);
    FindNetProps("CNMRiH_Player", "m_vecVelocity[2]",               OFS_m_vecVelocity_2);
    FindNetProps("CNMRiH_Player", "m_flDeathTime",                  OFS_m_flDeathTime);
    FindNetProps("CNMRiH_Player", "m_nWaterLevel",                  OFS_m_nWaterLevel);
    FindNetProps("CNMRiH_Player", "m_flLaggedMovementValue",        OFS_m_flLaggedMovementValue);
    FindNetProps("CNMRiH_Player", "m_flStamina",                    OFS_m_flStamina);
    FindNetProps("CNMRiH_Player", "m_bIsSprinting",                 OFS_m_bIsSprinting );
    FindNetProps("CNMRiH_Player", "m_bTalkingWalkie",               OFS_m_bTalkingWalkie);
    FindNetProps("CNMRiH_Player", "m_bSprintEnabled",               OFS_m_bSprintEnabled);
    FindNetProps("CNMRiH_Player", "m_bStickyIronsight",             OFS_m_bStickyIronsight);
    FindNetProps("CNMRiH_Player", "m_bDiedWhileInfected",           OFS_m_bDiedWhileInfected);
    FindNetProps("CNMRiH_Player", "m_bGrabbed",                     OFS_m_bGrabbed);
    FindNetProps("CNMRiH_Player", "_bleedingOut",                   OFS__bleedingOut);
    FindNetProps("CNMRiH_Player", "m_flThrowDropTimer",             OFS_m_flThrowDropTimer);
    FindNetProps("CNMRiH_Player", "_carriedWeight",                 OFS__carriedWeight);
    FindNetProps("CNMRiH_Player", "m_iTokens",                      OFS_m_iTokens);
    FindNetProps("CNMRiH_Player", "m_iDeaths",                      OFS_m_iDeaths);
    FindNetProps("CNMRiH_Player", "_usingToolSecondary",            OFS__usingToolSecondary);
    FindNetProps("CNMRiH_Player", "_contemplatingSuicide",          OFS__contemplatingSuicide);
    FindNetProps("CNMRiH_Player", "_playerModelIndex",              OFS__playerModelIndex);
    FindNetProps("CNMRiH_Player", "_nextRespawnTime",               OFS__nextRespawnTime);
    FindNetProps("CNMRiH_Player", "_vaccinated",                    OFS__vaccinated);
    FindNetProps("CNMRiH_Player", "m_bGrabbedByCrawler",            OFS_m_bGrabbedByCrawler);
    FindNetProps("CNMRiH_Player", "m_flPartialBlindnessEffectEnd",  OFS_m_flPartialBlindnessEffectEnd);
    FindNetProps("CNMRiH_Player", "m_bIsExtracted",                 OFS_m_bIsExtracted);
    FindNetProps("CNMRiH_Player", "m_bUsingProgressTrigger",        OFS_m_bUsingProgressTrigger);
    FindNetProps("CNMRiH_Player", "m_bLevelTransition",             OFS_m_bLevelTransition);
    FindNetProps("CNMRiH_Player", "m_flSpeedModifier",              OFS_m_flSpeedModifier);
    FindNetProps("CNMRiH_Player", "m_flSpeedOverride",              OFS_m_flSpeedOverride);
    FindNetProps("CNMRiH_Player", "m_flTriggerSpeedModifier",       OFS_m_flTriggerSpeedModifier);
    FindNetProps("CNMRiH_Player", "m_ArmorValue",                   OFS_m_ArmorValue);
    FindNetProps("CNMRiH_Player", "m_flNextAttack",                 OFS_m_flNextAttack);
    FindNetProps("CNMRiH_Player", "m_nBody",                        OFS_m_nBody);
    FindNetProps("CNMRiH_Player", "m_nSkin",                        OFS_m_nSkin);
    FindNetProps("CNMRiH_Player", "m_nModelIndex",                  OFS_m_nModelIndex);
    // FindNetProps("CNMRiH_Player", "",                            OFS_);
}

static void FindNetProps(const char[] cls, const char[] prop, int index)
{
    if (index < 0 || index >= OFS_Total)
        SetFailState("Invalid iNetPropsOffset index %d", index);

    int offset = FindSendPropInfo(cls, prop);
    if (offset == 0)
        SetFailState("Property \"%s.%s\" has no available offset", cls, prop);

    if (offset == -1)
        SetFailState("Property \"%s.%s\" not found", cls, prop);

    iNetPropsOffset[index] = offset;
}

void CreateNetPropsNatives()
{
    CreateNative("NMR_Player.m_fEffects.get",                       Native_Get_m_fEffects);
    CreateNative("NMR_Player.m_fEffects.set",                       Native_Set_m_fEffects);
    CreateNative("NMR_Player.m_CollisionGroup.get",                 Native_Get_m_CollisionGroup);
    CreateNative("NMR_Player.m_CollisionGroup.set",                 Native_Set_m_CollisionGroup);
    CreateNative("NMR_Player.moveparent.get",                       Native_Get_moveparent);
    CreateNative("NMR_Player.moveparent.set",                       Native_Set_moveparent);
    CreateNative("NMR_Player.m_iParentAttachment.get",              Native_Get_m_iParentAttachment);
    CreateNative("NMR_Player.m_iParentAttachment.set",              Native_Set_m_iParentAttachment);
    CreateNative("NMR_Player.movetype.get",                         Native_Get_movetype);
    CreateNative("NMR_Player.movetype.set",                         Native_Set_movetype);
    CreateNative("NMR_Player.movecollide.get",                      Native_Get_movecollide);
    CreateNative("NMR_Player.movecollide.set",                      Native_Set_movecollide);
    CreateNative("NMR_Player.m_bIsGlowable.get",                    Native_Get_m_bIsGlowable);
    CreateNative("NMR_Player.m_bIsGlowable.set",                    Native_Set_m_bIsGlowable);
    CreateNative("NMR_Player.m_bGlowing.get",                       Native_Get_m_bGlowing);
    CreateNative("NMR_Player.m_bGlowing.set",                       Native_Set_m_bGlowing);
    CreateNative("NMR_Player.m_clrGlowColor.get",                   Native_Get_m_clrGlowColor);
    CreateNative("NMR_Player.m_clrGlowColor.set",                   Native_Set_m_clrGlowColor);
    CreateNative("NMR_Player.m_flGlowDistance.get",                 Native_Get_m_flGlowDistance);
    CreateNative("NMR_Player.m_flGlowDistance.set",                 Native_Set_m_flGlowDistance);
    CreateNative("NMR_Player.m_bGlowBlip.get",                      Native_Get_m_bGlowBlip);
    CreateNative("NMR_Player.m_bGlowBlip.set",                      Native_Set_m_bGlowBlip);
    CreateNative("NMR_Player.m_hActiveWeapon.get",                  Native_Get_m_hActiveWeapon);
    CreateNative("NMR_Player.m_hActiveWeapon.set",                  Native_Set_m_hActiveWeapon);
    CreateNative("NMR_Player.m_flInfectionDeathTime.get",           Native_Get_m_flInfectionDeathTime);
    CreateNative("NMR_Player.m_flInfectionDeathTime.set",           Native_Set_m_flInfectionDeathTime);
    CreateNative("NMR_Player.m_flInfectionTime.get",                Native_Get_m_flInfectionTime);
    CreateNative("NMR_Player.m_flInfectionTime.set",                Native_Set_m_flInfectionTime);
    CreateNative("NMR_Player.m_iHealth.get",                        Native_Get_m_iHealth);
    CreateNative("NMR_Player.m_iHealth.set",                        Native_Set_m_iHealth);
    CreateNative("NMR_Player.m_lifeState.get",                      Native_Get_m_lifeState);
    CreateNative("NMR_Player.m_lifeState.set",                      Native_Set_m_lifeState);
    CreateNative("NMR_Player.m_flMaxspeed.get",                     Native_Get_m_flMaxspeed);
    CreateNative("NMR_Player.m_flMaxspeed.set",                     Native_Set_m_flMaxspeed);
    CreateNative("NMR_Player.m_fFlags.get",                         Native_Get_m_fFlags);
    CreateNative("NMR_Player.m_fFlags.set",                         Native_Set_m_fFlags);
    CreateNative("NMR_Player.m_iObserverMode.get",                  Native_Get_m_iObserverMode);
    CreateNative("NMR_Player.m_iObserverMode.set",                  Native_Set_m_iObserverMode);
    CreateNative("NMR_Player.m_hObserverTarget.get",                Native_Get_m_hObserverTarget);
    CreateNative("NMR_Player.m_hObserverTarget.set",                Native_Set_m_hObserverTarget);
    CreateNative("NMR_Player.m_iFOV.get",                           Native_Get_m_iFOV);
    CreateNative("NMR_Player.m_iFOV.set",                           Native_Set_m_iFOV);
    CreateNative("NMR_Player.m_iFOVStart.get",                      Native_Get_m_iFOVStart);
    CreateNative("NMR_Player.m_iFOVStart.set",                      Native_Set_m_iFOVStart);
    CreateNative("NMR_Player.m_flFOVTime.get",                      Native_Get_m_flFOVTime);
    CreateNative("NMR_Player.m_flFOVTime.set",                      Native_Set_m_flFOVTime);
    CreateNative("NMR_Player.m_iDefaultFOV.get",                    Native_Get_m_iDefaultFOV);
    CreateNative("NMR_Player.m_iDefaultFOV.set",                    Native_Set_m_iDefaultFOV);
    CreateNative("NMR_Player.m_iHideHUD.get",                       Native_Get_m_iHideHUD);
    CreateNative("NMR_Player.m_iHideHUD.set",                       Native_Set_m_iHideHUD);
    CreateNative("NMR_Player.m_flFOVRate.get",                      Native_Get_m_flFOVRate);
    CreateNative("NMR_Player.m_flFOVRate.set",                      Native_Set_m_flFOVRate);
    CreateNative("NMR_Player.m_bDucked.get",                        Native_Get_m_bDucked);
    CreateNative("NMR_Player.m_bDucked.set",                        Native_Set_m_bDucked);
    CreateNative("NMR_Player.m_bDucking.get",                       Native_Get_m_bDucking);
    CreateNative("NMR_Player.m_bDucking.set",                       Native_Set_m_bDucking);
    CreateNative("NMR_Player.m_bInDuckJump.get",                    Native_Get_m_bInDuckJump);
    CreateNative("NMR_Player.m_bInDuckJump.set",                    Native_Set_m_bInDuckJump);
    CreateNative("NMR_Player.m_flDucktime.get",                     Native_Get_m_flDucktime);
    CreateNative("NMR_Player.m_flDucktime.set",                     Native_Set_m_flDucktime);
    CreateNative("NMR_Player.m_flDuckJumpTime.get",                 Native_Get_m_flDuckJumpTime);
    CreateNative("NMR_Player.m_flDuckJumpTime.set",                 Native_Set_m_flDuckJumpTime);
    CreateNative("NMR_Player.m_flJumpTime.get",                     Native_Get_m_flJumpTime);
    CreateNative("NMR_Player.m_flJumpTime.set",                     Native_Set_m_flJumpTime);
    CreateNative("NMR_Player.m_flFallVelocity.get",                 Native_Get_m_flFallVelocity);
    CreateNative("NMR_Player.m_flFallVelocity.set",                 Native_Set_m_flFallVelocity);
    CreateNative("NMR_Player.m_bPoisoned.get",                      Native_Get_m_bPoisoned);
    CreateNative("NMR_Player.m_bPoisoned.set",                      Native_Set_m_bPoisoned);
    CreateNative("NMR_Player.m_flStepSize.get",                     Native_Get_m_flStepSize);
    CreateNative("NMR_Player.m_flStepSize.set",                     Native_Set_m_flStepSize);
    CreateNative("NMR_Player.m_vecViewOffset_0.get",                Native_Get_m_vecViewOffset_0);
    CreateNative("NMR_Player.m_vecViewOffset_0.set",                Native_Set_m_vecViewOffset_0);
    CreateNative("NMR_Player.m_vecViewOffset_1.get",                Native_Get_m_vecViewOffset_1);
    CreateNative("NMR_Player.m_vecViewOffset_1.set",                Native_Set_m_vecViewOffset_1);
    CreateNative("NMR_Player.m_vecViewOffset_2.get",                Native_Get_m_vecViewOffset_2);
    CreateNative("NMR_Player.m_vecViewOffset_2.set",                Native_Set_m_vecViewOffset_2);
    CreateNative("NMR_Player.m_flFriction.get",                     Native_Get_m_flFriction);
    CreateNative("NMR_Player.m_flFriction.set",                     Native_Set_m_flFriction);
    CreateNative("NMR_Player.m_hLastWeapon.get",                    Native_Get_m_hLastWeapon);
    CreateNative("NMR_Player.m_hLastWeapon.set",                    Native_Set_m_hLastWeapon);
    CreateNative("NMR_Player.m_hGroundEntity.get",                  Native_Get_m_hGroundEntity);
    CreateNative("NMR_Player.m_hGroundEntity.set",                  Native_Set_m_hGroundEntity);
    CreateNative("NMR_Player.m_vecVelocity_0.get",                  Native_Get_m_vecVelocity_0);
    CreateNative("NMR_Player.m_vecVelocity_0.set",                  Native_Set_m_vecVelocity_0);
    CreateNative("NMR_Player.m_vecVelocity_1.get",                  Native_Get_m_vecVelocity_1);
    CreateNative("NMR_Player.m_vecVelocity_1.set",                  Native_Set_m_vecVelocity_1);
    CreateNative("NMR_Player.m_vecVelocity_2.get",                  Native_Get_m_vecVelocity_2);
    CreateNative("NMR_Player.m_vecVelocity_2.set",                  Native_Set_m_vecVelocity_2);
    CreateNative("NMR_Player.m_flDeathTime.get",                    Native_Get_m_flDeathTime);
    CreateNative("NMR_Player.m_flDeathTime.set",                    Native_Set_m_flDeathTime);
    CreateNative("NMR_Player.m_nWaterLevel.get",                    Native_Get_m_nWaterLevel);
    CreateNative("NMR_Player.m_nWaterLevel.set",                    Native_Set_m_nWaterLevel);
    CreateNative("NMR_Player.m_flLaggedMovementValue.get",          Native_Get_m_flLaggedMovementValue);
    CreateNative("NMR_Player.m_flLaggedMovementValue.set",          Native_Set_m_flLaggedMovementValue);
    CreateNative("NMR_Player.m_flStamina.get",                      Native_Get_m_flStamina);
    CreateNative("NMR_Player.m_flStamina.set",                      Native_Set_m_flStamina);
    CreateNative("NMR_Player.m_bIsSprinting.get",                   Native_Get_m_bIsSprinting);
    CreateNative("NMR_Player.m_bIsSprinting.set",                   Native_Set_m_bIsSprinting);
    CreateNative("NMR_Player.m_bTalkingWalkie.get",                 Native_Get_m_bTalkingWalkie);
    CreateNative("NMR_Player.m_bTalkingWalkie.set",                 Native_Set_m_bTalkingWalkie);
    CreateNative("NMR_Player.m_bSprintEnabled.get",                 Native_Get_m_bSprintEnabled);
    CreateNative("NMR_Player.m_bSprintEnabled.set",                 Native_Set_m_bSprintEnabled);
    CreateNative("NMR_Player.m_bStickyIronsight.get",               Native_Get_m_bStickyIronsight);
    CreateNative("NMR_Player.m_bStickyIronsight.set",               Native_Set_m_bStickyIronsight);
    CreateNative("NMR_Player.m_bDiedWhileInfected.get",             Native_Get_m_bDiedWhileInfected);
    CreateNative("NMR_Player.m_bDiedWhileInfected.set",             Native_Set_m_bDiedWhileInfected);
    CreateNative("NMR_Player.m_bGrabbed.get",                       Native_Get_m_bGrabbed);
    CreateNative("NMR_Player.m_bGrabbed.set",                       Native_Set_m_bGrabbed);
    CreateNative("NMR_Player._bleedingOut.get",                     Native_Get__bleedingOut);
    CreateNative("NMR_Player._bleedingOut.set",                     Native_Set__bleedingOut);
    CreateNative("NMR_Player.m_flThrowDropTimer.get",               Native_Get_m_flThrowDropTimer);
    CreateNative("NMR_Player.m_flThrowDropTimer.set",               Native_Set_m_flThrowDropTimer);
    CreateNative("NMR_Player._carriedWeight.get",                   Native_Get__carriedWeight);
    CreateNative("NMR_Player._carriedWeight.set",                   Native_Set__carriedWeight);
    CreateNative("NMR_Player.m_iTokens.get",                        Native_Get_m_iTokens);
    CreateNative("NMR_Player.m_iTokens.set",                        Native_Set_m_iTokens);
    CreateNative("NMR_Player.m_iDeaths.get",                        Native_Get_m_iDeaths);
    CreateNative("NMR_Player.m_iDeaths.set",                        Native_Set_m_iDeaths);
    CreateNative("NMR_Player._usingToolSecondary.get",              Native_Get__usingToolSecondary);
    CreateNative("NMR_Player._usingToolSecondary.set",              Native_Set__usingToolSecondary);
    CreateNative("NMR_Player._contemplatingSuicide.get",            Native_Get__contemplatingSuicide);
    CreateNative("NMR_Player._contemplatingSuicide.set",            Native_Set__contemplatingSuicide);
    CreateNative("NMR_Player._playerModelIndex.get",                Native_Get__playerModelIndex);
    CreateNative("NMR_Player._playerModelIndex.set",                Native_Set__playerModelIndex);
    CreateNative("NMR_Player._nextRespawnTime.get",                 Native_Get__nextRespawnTime);
    CreateNative("NMR_Player._nextRespawnTime.set",                 Native_Set__nextRespawnTime);
    CreateNative("NMR_Player._vaccinated.get",                      Native_Get__vaccinated);
    CreateNative("NMR_Player._vaccinated.set",                      Native_Set__vaccinated);
    CreateNative("NMR_Player.m_bGrabbedByCrawler.get",              Native_Get_m_bGrabbedByCrawler);
    CreateNative("NMR_Player.m_bGrabbedByCrawler.set",              Native_Set_m_bGrabbedByCrawler);
    CreateNative("NMR_Player.m_flPartialBlindnessEffectEnd.get",    Native_Get_m_flPartialBlindnessEffectEnd);
    CreateNative("NMR_Player.m_flPartialBlindnessEffectEnd.set",    Native_Set_m_flPartialBlindnessEffectEnd);
    CreateNative("NMR_Player.m_bIsExtracted.get",                   Native_Get_m_bIsExtracted);
    CreateNative("NMR_Player.m_bIsExtracted.set",                   Native_Set_m_bIsExtracted);
    CreateNative("NMR_Player.m_bUsingProgressTrigger.get",          Native_Get_m_bUsingProgressTrigger);
    CreateNative("NMR_Player.m_bUsingProgressTrigger.set",          Native_Set_m_bUsingProgressTrigger);
    CreateNative("NMR_Player.m_bLevelTransition.get",               Native_Get_m_bLevelTransition);
    CreateNative("NMR_Player.m_bLevelTransition.set",               Native_Set_m_bLevelTransition);
    CreateNative("NMR_Player.m_flSpeedModifier.get",                Native_Get_m_flSpeedModifier);
    CreateNative("NMR_Player.m_flSpeedModifier.set",                Native_Set_m_flSpeedModifier);
    CreateNative("NMR_Player.m_flSpeedOverride.get",                Native_Get_m_flSpeedOverride);
    CreateNative("NMR_Player.m_flSpeedOverride.set",                Native_Set_m_flSpeedOverride);
    CreateNative("NMR_Player.m_flTriggerSpeedModifier.get",         Native_Get_m_flTriggerSpeedModifier);
    CreateNative("NMR_Player.m_flTriggerSpeedModifier.set",         Native_Set_m_flTriggerSpeedModifier);
    CreateNative("NMR_Player.m_ArmorValue.get",                     Native_Get_m_ArmorValue);
    CreateNative("NMR_Player.m_ArmorValue.set",                     Native_Set_m_ArmorValue);
    CreateNative("NMR_Player.m_flNextAttack.get",                   Native_Get_m_flNextAttack);
    CreateNative("NMR_Player.m_flNextAttack.set",                   Native_Set_m_flNextAttack);
    CreateNative("NMR_Player.m_nBody.get",                          Native_Get_m_nBody);
    CreateNative("NMR_Player.m_nBody.set",                          Native_Set_m_nBody);
    CreateNative("NMR_Player.m_nSkin.get",                          Native_Get_m_nSkin);
    CreateNative("NMR_Player.m_nSkin.set",                          Native_Set_m_nSkin);
    CreateNative("NMR_Player.m_nModelIndex.get",                    Native_Get_m_nModelIndex);
    CreateNative("NMR_Player.m_nModelIndex.set",                    Native_Set_m_nModelIndex);
    CreateNative("NMR_Player.m_iMaxHealth.get",                     Native_Get_m_iMaxHealth);
    CreateNative("NMR_Player.m_iMaxHealth.set",                     Native_Set_m_iMaxHealth);
    CreateNative("NMR_Player.m_LastHitGroup.get",                   Native_Get_m_LastHitGroup);
    CreateNative("NMR_Player.m_LastHitGroup.set",                   Native_Set_m_LastHitGroup);
    CreateNative("NMR_Player.m_iFrags.get",                         Native_Get_m_iFrags);
    CreateNative("NMR_Player.m_iFrags.set",                         Native_Set_m_iFrags);
    CreateNative("NMR_Player.m_flGravity.get",                      Native_Get_m_flGravity);
    CreateNative("NMR_Player.m_flGravity.set",                      Native_Set_m_flGravity);
    CreateNative("NMR_Player.GetVelocity",                          Native_GetVelocity);
    CreateNative("NMR_Player.SetVelocity",                          Native_SetVelocity);
    CreateNative("NMR_Player.GetOrigin",                            Native_GetOrigin);
    CreateNative("NMR_Player.SetOrigin",                            Native_SetOrigin);
    CreateNative("NMR_Player.GetAbsOrigin",                         Native_GetAbsOrigin);
    CreateNative("NMR_Player.SetAbsOrigin",                         Native_SetAbsOrigin);
    CreateNative("NMR_Player.GetAbsAngles",                         Native_GetAbsAngles);
    CreateNative("NMR_Player.SetAbsAngles",                         Native_SetAbsAngles);
    CreateNative("NMR_Player.GetAbsVelocity",                       Native_GetAbsVelocity);
    CreateNative("NMR_Player.SetAbsVelocity",                       Native_SetAbsVelocity);
    CreateNative("NMR_Player.GetAbsRotation",                       Native_GetAbsRotation);
    CreateNative("NMR_Player.SetAbsRotation",                       Native_SetAbsRotation);
    CreateNative("NMR_Player.GetMaxs",                              Native_GetMaxs);
    CreateNative("NMR_Player.SetMaxs",                              Native_SetMaxs);
    CreateNative("NMR_Player.GetMins",                              Native_GetMins);
    CreateNative("NMR_Player.SetMins",                              Native_SetMins);
    CreateNative("NMR_Player.GetOldButtons",                        Native_GetOldButtons);
    CreateNative("NMR_Player.SetOldButtons",                        Native_SetOldButtons);
}


static any Native_Get_m_fEffects(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_fEffects], 2);
}

static any Native_Set_m_fEffects(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_fEffects], GetNativeCell(2), 2);
}

static any Native_Get_m_CollisionGroup(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_CollisionGroup], 1);
}

static any Native_Set_m_CollisionGroup(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_CollisionGroup], GetNativeCell(2), 1);
}

static any Native_Get_moveparent(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_moveparent], 4);
}

static any Native_Set_moveparent(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_moveparent], GetNativeCell(2), 4);
}

static any Native_Get_m_iParentAttachment(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_iParentAttachment], 1);
}

static any Native_Set_m_iParentAttachment(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_iParentAttachment], GetNativeCell(2), 1);
}

static any Native_Get_movetype(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_movetype], 1);
}

static any Native_Set_movetype(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_movetype], GetNativeCell(2), 1);
}

static any Native_Get_movecollide(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_movecollide], 1);
}

static any Native_Set_movecollide(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_movecollide], GetNativeCell(2), 1);
}

static any Native_Get_m_bIsGlowable(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_bIsGlowable], 1);
}

static any Native_Set_m_bIsGlowable(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_bIsGlowable], GetNativeCell(2), 1);
}

static any Native_Get_m_bGlowing(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_bGlowing], 1);
}

static any Native_Set_m_bGlowing(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_bGlowing], GetNativeCell(2), 1);
}

static any Native_Get_m_clrGlowColor(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_clrGlowColor], 4);
}

static any Native_Set_m_clrGlowColor(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_clrGlowColor], GetNativeCell(2), 4);
}

static any Native_Get_m_flGlowDistance(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataFloat(player, iNetPropsOffset[OFS_m_flGlowDistance]);
}

static any Native_Set_m_flGlowDistance(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataFloat(player, iNetPropsOffset[OFS_m_flGlowDistance], GetNativeCell(2));
}

static any Native_Get_m_bGlowBlip(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_bGlowBlip], 1);
}

static any Native_Set_m_bGlowBlip(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_bGlowBlip], GetNativeCell(2), 1);
}

static any Native_Get_m_hActiveWeapon(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataEnt2(player, iNetPropsOffset[OFS_m_hActiveWeapon]);
}

static any Native_Set_m_hActiveWeapon(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataEnt2(player, iNetPropsOffset[OFS_m_hActiveWeapon], GetNativeCell(2));
}

static any Native_Get_m_flInfectionDeathTime(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataFloat(player, iNetPropsOffset[OFS_m_flInfectionDeathTime]);
}

static any Native_Set_m_flInfectionDeathTime(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataFloat(player, iNetPropsOffset[OFS_m_flInfectionDeathTime], GetNativeCell(2));
}

static any Native_Get_m_flInfectionTime(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataFloat(player, iNetPropsOffset[OFS_m_flInfectionTime]);
}

static any Native_Set_m_flInfectionTime(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataFloat(player, iNetPropsOffset[OFS_m_flInfectionTime], GetNativeCell(2));
}

static any Native_Get_m_iHealth(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_iHealth], 4);
}

static any Native_Set_m_iHealth(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_iHealth], GetNativeCell(2), 4);
}

static any Native_Get_m_lifeState(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_lifeState], 1);
}

static any Native_Set_m_lifeState(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_lifeState], GetNativeCell(2), 1);
}

static any Native_Get_m_flMaxspeed(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataFloat(player, iNetPropsOffset[OFS_m_flMaxspeed]);
}

static any Native_Set_m_flMaxspeed(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataFloat(player, iNetPropsOffset[OFS_m_flMaxspeed], GetNativeCell(2));
}

static any Native_Get_m_fFlags(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_fFlags], 2);
}

static any Native_Set_m_fFlags(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_fFlags], GetNativeCell(2), 2);
}

static any Native_Get_m_iObserverMode(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_iObserverMode], 1);
}

static any Native_Set_m_iObserverMode(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_iObserverMode], GetNativeCell(2), 1);
}

static any Native_Get_m_hObserverTarget(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataEnt2(player, iNetPropsOffset[OFS_m_hObserverTarget]);
}

static any Native_Set_m_hObserverTarget(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataEnt2(player, iNetPropsOffset[OFS_m_hObserverTarget], GetNativeCell(2));
}

static any Native_Get_m_iFOV(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_iFOV], 1);
}

static any Native_Set_m_iFOV(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_iFOV], GetNativeCell(2), 1);
}

static any Native_Get_m_iFOVStart(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_iFOVStart], 1);
}

static any Native_Set_m_iFOVStart(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_iFOVStart], GetNativeCell(2), 1);
}

static any Native_Get_m_flFOVTime(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataFloat(player, iNetPropsOffset[OFS_m_flFOVTime]);
}

static any Native_Set_m_flFOVTime(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataFloat(player, iNetPropsOffset[OFS_m_flFOVTime], GetNativeCell(2));
}

static any Native_Get_m_iDefaultFOV(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_iDefaultFOV], 1);
}

static any Native_Set_m_iDefaultFOV(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_iDefaultFOV], GetNativeCell(2), 1);
}

static any Native_Get_m_iHideHUD(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_iHideHUD], 2);
}

static any Native_Set_m_iHideHUD(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_iHideHUD], GetNativeCell(2), 2);
}

static any Native_Get_m_flFOVRate(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataFloat(player, iNetPropsOffset[OFS_m_flFOVRate]);
}

static any Native_Set_m_flFOVRate(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataFloat(player, iNetPropsOffset[OFS_m_flFOVRate], GetNativeCell(2));
}

static any Native_Get_m_bDucked(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_bDucked], 1);
}

static any Native_Set_m_bDucked(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_bDucked], GetNativeCell(2), 1);
}

static any Native_Get_m_bDucking(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_bDucking], 1);
}

static any Native_Set_m_bDucking(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_bDucking], GetNativeCell(2), 1);
}

static any Native_Get_m_bInDuckJump(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_bInDuckJump], 1);
}

static any Native_Set_m_bInDuckJump(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_bInDuckJump], GetNativeCell(2), 1);
}

static any Native_Get_m_flDucktime(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataFloat(player, iNetPropsOffset[OFS_m_flDucktime]);
}

static any Native_Set_m_flDucktime(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataFloat(player, iNetPropsOffset[OFS_m_flDucktime], GetNativeCell(2));
}

static any Native_Get_m_flDuckJumpTime(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataFloat(player, iNetPropsOffset[OFS_m_flDuckJumpTime]);
}

static any Native_Set_m_flDuckJumpTime(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataFloat(player, iNetPropsOffset[OFS_m_flDuckJumpTime], GetNativeCell(2));
}

static any Native_Get_m_flJumpTime(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataFloat(player, iNetPropsOffset[OFS_m_flJumpTime]);
}

static any Native_Set_m_flJumpTime(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataFloat(player, iNetPropsOffset[OFS_m_flJumpTime], GetNativeCell(2));
}

static any Native_Get_m_flFallVelocity(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataFloat(player, iNetPropsOffset[OFS_m_flFallVelocity]);
}

static any Native_Set_m_flFallVelocity(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataFloat(player, iNetPropsOffset[OFS_m_flFallVelocity], GetNativeCell(2));
}

static any Native_Get_m_bPoisoned(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_bPoisoned], 1);
}

static any Native_Set_m_bPoisoned(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_bPoisoned], GetNativeCell(2), 1);
}

static any Native_Get_m_flStepSize(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataFloat(player, iNetPropsOffset[OFS_m_flStepSize]);
}

static any Native_Set_m_flStepSize(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataFloat(player, iNetPropsOffset[OFS_m_flStepSize], GetNativeCell(2));
}

static any Native_Get_m_vecViewOffset_0(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataFloat(player, iNetPropsOffset[OFS_m_vecViewOffset_0]);
}

static any Native_Set_m_vecViewOffset_0(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataFloat(player, iNetPropsOffset[OFS_m_vecViewOffset_0], GetNativeCell(2));
}

static any Native_Get_m_vecViewOffset_1(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataFloat(player, iNetPropsOffset[OFS_m_vecViewOffset_1]);
}

static any Native_Set_m_vecViewOffset_1(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataFloat(player, iNetPropsOffset[OFS_m_vecViewOffset_1], GetNativeCell(2));
}

static any Native_Get_m_vecViewOffset_2(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataFloat(player, iNetPropsOffset[OFS_m_vecViewOffset_2]);
}

static any Native_Set_m_vecViewOffset_2(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataFloat(player, iNetPropsOffset[OFS_m_vecViewOffset_2], GetNativeCell(2));
}

static any Native_Get_m_flFriction(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataFloat(player, iNetPropsOffset[OFS_m_flFriction]);
}

static any Native_Set_m_flFriction(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataFloat(player, iNetPropsOffset[OFS_m_flFriction], GetNativeCell(2));
}

static any Native_Get_m_hLastWeapon(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataEnt2(player, iNetPropsOffset[OFS_m_hLastWeapon]);
}

static any Native_Set_m_hLastWeapon(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataEnt2(player, iNetPropsOffset[OFS_m_hLastWeapon], GetNativeCell(2));
}

static any Native_Get_m_hGroundEntity(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataEnt2(player, iNetPropsOffset[OFS_m_hGroundEntity]);
}

static any Native_Set_m_hGroundEntity(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataEnt2(player, iNetPropsOffset[OFS_m_hGroundEntity], GetNativeCell(2));
}

static any Native_Get_m_vecVelocity_0(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataFloat(player, iNetPropsOffset[OFS_m_vecVelocity_0]);
}

static any Native_Set_m_vecVelocity_0(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataFloat(player, iNetPropsOffset[OFS_m_vecVelocity_0], GetNativeCell(2));
}

static any Native_Get_m_vecVelocity_1(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataFloat(player, iNetPropsOffset[OFS_m_vecVelocity_1]);
}

static any Native_Set_m_vecVelocity_1(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataFloat(player, iNetPropsOffset[OFS_m_vecVelocity_1], GetNativeCell(2));
}

static any Native_Get_m_vecVelocity_2(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataFloat(player, iNetPropsOffset[OFS_m_vecVelocity_2]);
}

static any Native_Set_m_vecVelocity_2(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataFloat(player, iNetPropsOffset[OFS_m_vecVelocity_2], GetNativeCell(2));
}

static any Native_Get_m_flDeathTime(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataFloat(player, iNetPropsOffset[OFS_m_flDeathTime]);
}

static any Native_Set_m_flDeathTime(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataFloat(player, iNetPropsOffset[OFS_m_flDeathTime], GetNativeCell(2));
}

static any Native_Get_m_nWaterLevel(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_nWaterLevel], 1);
}

static any Native_Set_m_nWaterLevel(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_nWaterLevel], GetNativeCell(2), 1);
}

static any Native_Get_m_flLaggedMovementValue(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataFloat(player, iNetPropsOffset[OFS_m_flLaggedMovementValue]);
}

static any Native_Set_m_flLaggedMovementValue(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataFloat(player, iNetPropsOffset[OFS_m_flLaggedMovementValue], GetNativeCell(2));
}

static any Native_Get_m_flStamina(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataFloat(player, iNetPropsOffset[OFS_m_flStamina]);
}

static any Native_Set_m_flStamina(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataFloat(player, iNetPropsOffset[OFS_m_flStamina], GetNativeCell(2));
}

static any Native_Get_m_bIsSprinting(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_bIsSprinting], 1);
}

static any Native_Set_m_bIsSprinting(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_bIsSprinting], GetNativeCell(2), 1);
}

static any Native_Get_m_bTalkingWalkie(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_bTalkingWalkie], 1);
}

static any Native_Set_m_bTalkingWalkie(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_bTalkingWalkie], GetNativeCell(2), 1);
}

static any Native_Get_m_bSprintEnabled(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_bSprintEnabled], 1);
}

static any Native_Set_m_bSprintEnabled(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_bSprintEnabled], GetNativeCell(2), 1);
}

static any Native_Get_m_bStickyIronsight(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_bStickyIronsight], 1);
}

static any Native_Set_m_bStickyIronsight(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_bStickyIronsight], GetNativeCell(2), 1);
}

static any Native_Get_m_bDiedWhileInfected(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_bDiedWhileInfected], 1);
}

static any Native_Set_m_bDiedWhileInfected(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_bDiedWhileInfected], GetNativeCell(2), 1);
}

static any Native_Get_m_bGrabbed(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_bGrabbed], 1);
}

static any Native_Set_m_bGrabbed(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_bGrabbed], GetNativeCell(2), 1);
}

static any Native_Get__bleedingOut(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS__bleedingOut], 1);
}

static any Native_Set__bleedingOut(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS__bleedingOut], GetNativeCell(2), 1);
}

static any Native_Get_m_flThrowDropTimer(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataFloat(player, iNetPropsOffset[OFS_m_flThrowDropTimer]);
}

static any Native_Set_m_flThrowDropTimer(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataFloat(player, iNetPropsOffset[OFS_m_flThrowDropTimer], GetNativeCell(2));
}

static any Native_Get__carriedWeight(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS__carriedWeight], 4);
}

static any Native_Set__carriedWeight(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS__carriedWeight], GetNativeCell(2));
}

static any Native_Get_m_iTokens(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_iTokens], 4);
}

static any Native_Set_m_iTokens(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_iTokens], GetNativeCell(2), 4);
}

static any Native_Get_m_iDeaths(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_iDeaths], 4);
}

static any Native_Set_m_iDeaths(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_iDeaths], GetNativeCell(2), 4);
}

static any Native_Get__usingToolSecondary(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS__usingToolSecondary], 1);
}

static any Native_Set__usingToolSecondary(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS__usingToolSecondary], GetNativeCell(2), 1);
}

static any Native_Get__contemplatingSuicide(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS__contemplatingSuicide], 1);
}

static any Native_Set__contemplatingSuicide(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS__contemplatingSuicide], GetNativeCell(2), 1);
}

static any Native_Get__playerModelIndex(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS__playerModelIndex], 4);
}

static any Native_Set__playerModelIndex(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS__playerModelIndex], GetNativeCell(2), 4);
}

static any Native_Get__nextRespawnTime(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataFloat(player, iNetPropsOffset[OFS__nextRespawnTime]);
}

static any Native_Set__nextRespawnTime(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataFloat(player, iNetPropsOffset[OFS__nextRespawnTime], GetNativeCell(2));
}

static any Native_Get__vaccinated(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS__vaccinated], 1);
}

static any Native_Set__vaccinated(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS__vaccinated], GetNativeCell(2), 1);
}

static any Native_Get_m_bGrabbedByCrawler(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_bGrabbedByCrawler], 1);
}

static any Native_Set_m_bGrabbedByCrawler(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_bGrabbedByCrawler], GetNativeCell(2), 1);
}

static any Native_Get_m_flPartialBlindnessEffectEnd(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataFloat(player, iNetPropsOffset[OFS_m_flPartialBlindnessEffectEnd]);
}

static any Native_Set_m_flPartialBlindnessEffectEnd(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataFloat(player, iNetPropsOffset[OFS_m_flPartialBlindnessEffectEnd], GetNativeCell(2));
}

static any Native_Get_m_bIsExtracted(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_bIsExtracted], 1);
}

static any Native_Set_m_bIsExtracted(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_bIsExtracted], GetNativeCell(2), 1);
}

static any Native_Get_m_bUsingProgressTrigger(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_bUsingProgressTrigger], 1);
}

static any Native_Set_m_bUsingProgressTrigger(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_bUsingProgressTrigger], GetNativeCell(2), 1);
}

static any Native_Get_m_bLevelTransition(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_bLevelTransition], 1);
}

static any Native_Set_m_bLevelTransition(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntData(player, iNetPropsOffset[OFS_m_bLevelTransition], GetNativeCell(2), 1);
}

static any Native_Get_m_flSpeedModifier(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataFloat(player, iNetPropsOffset[OFS_m_flSpeedModifier]);
}

static any Native_Set_m_flSpeedModifier(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataFloat(player, iNetPropsOffset[OFS_m_flSpeedModifier], GetNativeCell(2));
}

static any Native_Get_m_flSpeedOverride(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataFloat(player, iNetPropsOffset[OFS_m_flSpeedOverride]);
}

static any Native_Set_m_flSpeedOverride(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataFloat(player, iNetPropsOffset[OFS_m_flSpeedOverride], GetNativeCell(2));
}

static any Native_Get_m_flTriggerSpeedModifier(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataFloat(player, iNetPropsOffset[OFS_m_flTriggerSpeedModifier]);
}

static any Native_Set_m_flTriggerSpeedModifier(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return SetEntDataFloat(player, iNetPropsOffset[OFS_m_flTriggerSpeedModifier], GetNativeCell(2));
}

static any Native_Get_m_ArmorValue(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_ArmorValue], 1);
}

static void Native_Set_m_ArmorValue(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    SetEntData(player, iNetPropsOffset[OFS_m_ArmorValue], GetNativeCell(2), 1);
}

static any Native_Get_m_flNextAttack(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntDataFloat(player, iNetPropsOffset[OFS_m_flNextAttack]);
}

static void Native_Set_m_flNextAttack(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    SetEntDataFloat(player, iNetPropsOffset[OFS_m_flNextAttack], GetNativeCell(2));
}

static any Native_Get_m_nBody(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_nBody], 4);
}

static void Native_Set_m_nBody(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    SetEntData(player, iNetPropsOffset[OFS_m_nBody], GetNativeCell(2), 4);
}

static any Native_Get_m_nSkin(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_nSkin], 2);
}

static void Native_Set_m_nSkin(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    SetEntData(player, iNetPropsOffset[OFS_m_nSkin], GetNativeCell(2), 2);
}

static any Native_Get_m_nModelIndex(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    return GetEntData(player, iNetPropsOffset[OFS_m_nModelIndex], 2);
}

static void Native_Set_m_nModelIndex(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    SetEntData(player, iNetPropsOffset[OFS_m_nModelIndex], GetNativeCell(2), 2);
}

static any Native_Get_m_iMaxHealth(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    static int offset = 0;
    if (offset == 0)
        offset = FindDataMapInfo(player, "m_iMaxHealth");
    if (offset == -1)
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "DataMap offset \"m_iMaxHealth\" not found!");

    return GetEntData(player, offset, 4);
}

static void Native_Set_m_iMaxHealth(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    static int offset = 0;
    if (offset == 0)
        offset = FindDataMapInfo(player, "m_iMaxHealth");
    if (offset == -1)
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "DataMap offset \"m_iMaxHealth\" not found!");

    SetEntData(player, offset, GetNativeCell(2), 4);
}

static any Native_Get_m_LastHitGroup(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    static int offset = 0;
    if (offset == 0)
        offset = FindDataMapInfo(player, "m_LastHitGroup");
    if (offset == -1)
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "DataMap offset \"m_LastHitGroup\" not found!");

    return GetEntData(player, offset, 4);
}

static void Native_Set_m_LastHitGroup(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    static int offset = 0;
    if (offset == 0)
        offset = FindDataMapInfo(player, "m_LastHitGroup");
    if (offset == -1)
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "DataMap offset \"m_LastHitGroup\" not found!");

    SetEntData(player, offset, GetNativeCell(2), 4);
}

static any Native_Get_m_iFrags(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    static int offset = 0;
    if (offset == 0)
        offset = FindDataMapInfo(player, "m_iFrags");
    if (offset == -1)
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "DataMap offset \"m_iFrags\" not found!");

    return GetEntData(player, offset, 4);
}

static void Native_Set_m_iFrags(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    static int offset = 0;
    if (offset == 0)
        offset = FindDataMapInfo(player, "m_iFrags");
    if (offset == -1)
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "DataMap offset \"m_iFrags\" not found!");

    SetEntData(player, offset, GetNativeCell(2), 4);
}

static any Native_Get_m_flGravity(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    static int offset = 0;
    if (offset == 0)
        offset = FindDataMapInfo(player, "m_flGravity");
    if (offset == -1)
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "DataMap offset \"m_flGravity\" not found!");

    return GetEntDataFloat(player, offset);
}

static void Native_Set_m_flGravity(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    static int offset = 0;
    if (offset == 0)
        offset = FindDataMapInfo(player, "m_flGravity");
    if (offset == -1)
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "DataMap offset \"m_flGravity\" not found!");

    SetEntDataFloat(player, offset, GetNativeCell(2));
}

static void Native_GetVelocity(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    static int offset = 0;
    if (offset == 0)
        offset = FindDataMapInfo(player, "m_vecVelocity");
    if (offset == -1)
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "DataMap offset \"m_vecVelocity\" not found!");

    float velocity[3];
    GetEntDataVector(player, offset, velocity);

    SetNativeArray(2, velocity, sizeof(velocity));
}

static void Native_SetVelocity(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    static int offset = 0;
    if (offset == 0)
        offset = FindDataMapInfo(player, "m_vecVelocity");
    if (offset == -1)
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "DataMap offset \"m_vecVelocity\" not found!");

    float velocity[3];
    GetNativeArray(2, velocity, sizeof(velocity));

    bool stack = GetNativeCell(3);
    if (stack)
    {
        float speed[3];
        NMR_Player(player).GetVelocity(speed);
        AddVectors(speed, velocity, velocity);
    }

    TeleportEntity(player, NULL_VECTOR, NULL_VECTOR, velocity);
}

static void Native_GetOrigin(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    static int offset = 0;
    if (offset == 0)
        offset = FindDataMapInfo(player, "m_vecOrigin");
    if (offset == -1)
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "DataMap offset \"m_vecOrigin\" not found!");

    float position[3];
    GetEntDataVector(player, offset, position);
    SetNativeArray(2, position, sizeof(position));
}

static void Native_SetOrigin(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    static int offset = 0;
    if (offset == 0)
        offset = FindDataMapInfo(player, "m_vecVelocity");
    if (offset == -1)
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "DataMap offset \"m_vecVelocity\" not found!");

    float position[3];
    GetNativeArray(2, position, sizeof(position));

    bool changeState = GetNativeCell(3);
    SetEntDataVector(player, offset, position, changeState);
}

static void Native_GetAbsOrigin(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    static int offset = 0;
    if (offset == 0)
        offset = FindDataMapInfo(player, "m_vecAbsOrigin");
    if (offset == -1)
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "DataMap offset \"m_vecAbsOrigin\" not found!");

    float position[3];
    GetEntDataVector(player, offset, position);
    SetNativeArray(2, position, sizeof(position));
}

static void Native_SetAbsOrigin(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    static int offset = 0;
    if (offset == 0)
        offset = FindDataMapInfo(player, "m_vecAbsOrigin");
    if (offset == -1)
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "DataMap offset \"m_vecAbsOrigin\" not found!");

    float position[3];
    GetNativeArray(2, position, sizeof(position));

    bool changeState = GetNativeCell(3);
    SetEntDataVector(player, offset, position, changeState);
}

static void Native_GetAbsVelocity(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    static int offset = 0;
    if (offset == 0)
        offset = FindDataMapInfo(player, "m_vecAbsVelocity");
    if (offset == -1)
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "DataMap offset \"m_vecAbsVelocity\" not found!");

    float velocity[3];
    GetEntDataVector(player, offset, velocity);
    SetNativeArray(2, velocity, sizeof(velocity));
}

static void Native_SetAbsVelocity(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    static int offset = 0;
    if (offset == 0)
        offset = FindDataMapInfo(player, "m_vecAbsVelocity");
    if (offset == -1)
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "DataMap offset \"m_vecAbsVelocity\" not found!");

    float velocity[3];
    GetNativeArray(2, velocity, sizeof(velocity));

    bool changeState = GetNativeCell(3);
    SetEntDataVector(player, offset, velocity, changeState);
}

static void Native_GetAbsRotation(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    static int offset = 0;
    if (offset == 0)
        offset = FindDataMapInfo(player, "m_angAbsRotation");
    if (offset == -1)
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "DataMap offset \"m_angAbsRotation\" not found!");

    float angles[3];
    GetEntDataVector(player, offset, angles);
    SetNativeArray(2, angles, sizeof(angles));
}

static void Native_SetAbsRotation(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    static int offset = 0;
    if (offset == 0)
        offset = FindDataMapInfo(player, "m_angAbsRotation");
    if (offset == -1)
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "DataMap offset \"m_angAbsRotation\" not found!");

    float angles[3];
    GetNativeArray(2, angles, sizeof(angles));

    bool changeState = GetNativeCell(3);
    SetEntDataVector(player, offset, angles, changeState);
}

static void Native_GetAbsAngles(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    static int offset = 0;
    if (offset == 0)
        offset = FindDataMapInfo(player, "m_angAbsRotation");
    if (offset == -1)
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "DataMap offset \"m_angAbsRotation\" not found!");

    float angles[3];
    GetEntDataVector(player, offset, angles);
    SetNativeArray(2, angles, sizeof(angles));
}

static void Native_SetAbsAngles(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    static int offset = 0;
    if (offset == 0)
        offset = FindDataMapInfo(player, "m_angAbsRotation");
    if (offset == -1)
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "DataMap offset \"m_angAbsRotation\" not found!");

    float angles[3];
    GetNativeArray(2, angles, sizeof(angles));

    bool changeState = GetNativeCell(3);
    SetEntDataVector(player, offset, angles, changeState);
}

static void Native_GetMaxs(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    static int offset = 0;
    if (offset == 0)
        offset = FindDataMapInfo(player, "m_vecMaxs");
    if (offset == -1)
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "DataMap offset \"m_vecMaxs\" not found!");

    float maxs[3];
    GetEntDataVector(player, offset, maxs);
    SetNativeArray(2, maxs, sizeof(maxs));
}

static void Native_SetMaxs(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    static int offset = 0;
    if (offset == 0)
        offset = FindDataMapInfo(player, "m_vecMaxs");
    if (offset == -1)
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "DataMap offset \"m_vecMaxs\" not found!");

    float maxs[3];
    GetNativeArray(2, maxs, sizeof(maxs));

    bool changeState = GetNativeCell(3);
    SetEntDataVector(player, offset, maxs, changeState);
}

static void Native_GetMins(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    static int offset = 0;
    if (offset == 0)
        offset = FindDataMapInfo(player, "m_vecMins");
    if (offset == -1)
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "DataMap offset \"m_vecMins\" not found!");

    float mins[3];
    GetEntDataVector(player, offset, mins);
    SetNativeArray(2, mins, sizeof(mins));
}

static void Native_SetMins(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    static int offset = 0;
    if (offset == 0)
        offset = FindDataMapInfo(player, "m_vecMins");
    if (offset == -1)
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "DataMap offset \"m_vecMins\" not found!");

    float mins[3];
    GetNativeArray(2, mins, sizeof(mins));

    bool changeState = GetNativeCell(3);
    SetEntDataVector(player, offset, mins, changeState);
}

static any Native_GetOldButtons(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    static int offset = 0;
    if (offset == 0)
        offset = FindDataMapInfo(player, "m_nOldButtons");
    if (offset == -1)
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "DataMap offset \"m_nOldButtons\" not found!");

    return GetEntData(player, offset, 4);
}

static void Native_SetOldButtons(Handle plugin, int numParams)
{
    int player = GetNativeCell(1);
    if (!IsValidClient(player))
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

    static int offset = 0;
    if (offset == 0)
        offset = FindDataMapInfo(player, "m_nOldButtons");
    if (offset == -1)
        ThrowCallNativeError(SP_ERROR_PARAM, plugin, "DataMap offset \"m_nOldButtons\" not found!");

    int value = GetNativeCell(2);
    SetEntData(player, offset, value, 4);
}


// 方便后续增加功能复制粘贴
// static any Native_Get_(Handle plugin, int numParams)
// {
//     int player = GetNativeCell(1);
//     if (!IsValidClient(player))
//         ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

//     return GetEntDataFloat(player, iNetPropsOffset[OFS_]);
// }

// static void Native_Set_(Handle plugin, int numParams)
// {
//     int player = GetNativeCell(1);
//     if (!IsValidClient(player))
//         ThrowCallNativeError(SP_ERROR_PARAM, plugin, "invalid player %d", player);

//     SetEntDataFloat(player, iNetPropsOffset[OFS_], GetNativeCell(2));
// }


stock void DebugNetPropsOffset()
{
    char buffer[512];
    log.TraceAmxTpl("************** Load Networkable Send Property Offset Count=%d **************", OFS_Total);
    for (int i = 0; i < OFS_Total; ++i)
    {
        if (i % 5 == 0)
            FormatEx(buffer, sizeof(buffer), "* No.%-3d=%5d |", i, iNetPropsOffset[i]);
        else
            Format(buffer, sizeof(buffer), "%s No.%-3d=%5d |", buffer, i, iNetPropsOffset[i]);

        if (i != 0 && ((i + 1) % 5 == 0 || i == OFS_Total - 1))
            log.Trace(buffer);
    }
}
