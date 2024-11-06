/** Double-include prevention */
#if defined _nmrih_player_utils_included_
  #endinput
#endif
#define _nmrih_player_utils_included_

#pragma newdecls required
#pragma semicolon 1


/**
 * 值取自逆向函数 RegisterSharedScriptConstants 以及控制台指令 script_help 的输出
 * 注释取自 entity_prop_stocks.inc 中定义的 FL_** 宏
 */
#define NMR_FL_ONGROUND             (1 << 0)    /**< At rest / on the ground */
#define NMR_FL_DUCKING              (1 << 1)    /**< Player flag -- Player is fully crouched */
#define NMR_FL_WATERJUMP            (1 << 3)    /**< player jumping out of water */
#define NMR_FL_ONTRAIN              (1 << 4)    /**< Player is _controlling_ a train, so movement commands should be ignored on client during prediction. */
#define NMR_FL_INRAIN               (1 << 5)    /**< Indicates the entity is standing in rain */
#define NMR_FL_FROZEN               (1 << 6)    /**< Player is frozen for 3rd person camera */
#define NMR_FL_ATCONTROLS           (1 << 7)    /**< Player can't move, but keeps key inputs for controlling another entity */
#define NMR_FL_CLIENT               (1 << 8)    /**< Is a player */
#define NMR_FL_FAKECLIENT           (1 << 9)    /**< Fake client, simulated server side; don't send network messages to them */
#define NMR_FL_INWATER              (1 << 10)   /**< In water */
#define NMR_FL_FLY                  (1 << 11)   /**< Changes the SV_Movestep() behavior to not need to be on ground */
#define NMR_FL_SWIM                 (1 << 12)   /**< Changes the SV_Movestep() behavior to not need to be on ground (but stay in water) */
#define NMR_FL_CONVEYOR             (1 << 13)
#define NMR_FL_NPC                  (1 << 14)
#define NMR_FL_GODMODE              (1 << 15)
#define NMR_FL_NOTARGET             (1 << 16)
#define NMR_FL_AIMTARGET            (1 << 17)   /**< set if the crosshair needs to aim onto the entity */
#define NMR_FL_PARTIALGROUND        (1 << 18)   /**< not all corners are valid */
#define NMR_FL_STATICPROP           (1 << 19)   /**< Eetsa static prop!  */
#define NMR_FL_GRAPHED              (1 << 20)   /**< worldgraph has this ent listed as something that blocks a connection */
#define NMR_FL_GRENADE              (1 << 21)
#define NMR_FL_STEPMOVEMENT         (1 << 22)   /**< Changes the SV_Movestep() behavior to not do any processing */
#define NMR_FL_DONTTOUCH            (1 << 23)   /**< Doesn't generate touch functions, generates Untouch() for anything it was touching when this flag was set */
#define NMR_FL_BASEVELOCITY         (1 << 24)   /**< Base velocity has been applied this frame (used to convert base velocity into momentum) */
#define NMR_FL_WORLDBRUSH           (1 << 25)   /**< Not moveable/removeable brush entity (really part of the world, but represented as an entity for transparency or something) */
#define NMR_FL_OBJECT               (1 << 26)   /**< Terrible name. This is an object that NPCs should see. Missiles, for example. */
#define NMR_FL_KILLME               (1 << 27)   /**< This entity is marked for death -- will be freed by game DLL */
#define NMR_FL_ONFIRE               (1 << 28)   /**< You know... */
#define NMR_FL_DISSOLVING           (1 << 29)   /**< We're dissolving! */
#define NMR_FL_TRANSRAGDOLL         (1 << 30)   /**< In the process of turning into a client side ragdoll. */
#define NMR_FL_UNBLOCKABLE_BY_PLAYER (1 << 31)  /**< pusher that can't be blocked by the player */


/**
 * 注意! 这在底层是 Detour 而不是 Event 或 UserMessage，Detour 触发不代表事件一定触发
 * 在 Detour 原函数内部可能还有一些判断逻辑来决定是否执行相关代码，反之可能什么都不做
 *
 * 比如 BecomeInfected 需要判断 IsVaccinated，当 IsVaccinated == true 时原函数什么都不做
 *
 * 注意！谨慎返回 Plugin_Continue 以外的值, 除非你很清楚你在做什么！
 *
 * OnPlayerBleedOut 不需要判断条件，因为 Detour 的是实际工作的函数（原函数判断条件后调用被 Detour 的函数）
 */

/**
 * Call when a client cures active infection.
 *
 * @note called 0 times, on death
 * @note called 1 times, on vaccine taken
 * @note called 2 times, on spawn
 *
 * @param client    client index.
 * @return          Return Plugin_Continue Continue with the original action, otherwise skip real function.
 */
forward Action OnPlayerCureInfection(int client);
forward  void  OnPlayerCureInfectionPost(int client);


/**
 * Call when a character becomes infected.
 *
 * @note 如果想让某个玩家免疫感染, 可以将 offset _vaccinated 的值设为 1
 * @note 已注射疫苗也会触发
 * @note 此 Detour 的是 CNMRiH_Player::BecomeInfected, 如果需要在玩家感染后执行逻辑
 *       需要额外判断 (OFS-285, NumberType_Int32) & 128 >= 0 && _vaccinated == 0
 *       或 Detour 真正的工作函数 ( CInfectableCharacter::BecomeInfected
 *       更推荐的做法是使用 User message - BecameInfected
 *       HookUserMessage(GetUserMessageId("BecameInfected"), UserMsg_BecameInfected)
 *
 * @param client    client index.
 * @return          Return Plugin_Continue Continue with the original action, otherwise skip real function.
 */
forward Action OnPlayerBecomeInfected(int client);
forward  void  OnPlayerBecomeInfectedPost(int client);

/**
 * Call when a client take pills.
 *
 * @note (OFS-1340, NumberType_Int8) == 1
 *
 * @param client    client index.
 * @return          Return Plugin_Continue Continue with the original action, otherwise skip real function.
 */
forward Action OnPlayerTakePills(int client);
forward  void  OnPlayerTakePillsPost(int client);

/**
 * Call when a client is caught by a zombie.
 *
 * @note If you need to use the OnGrabbedEnd, you can achieve it by using event "grab_end"
 * @note IsGrabbed == 0
 *
 * @param client    client index.
 * @param causer    causer index.
 * @return          Return Plugin_Continue Continue with the original action, otherwise skip real function.
 */
forward Action OnPlayerOnGrabbedBegin(int client, int causer);
forward  void  OnPlayerOnGrabbedBeginPost(int client, int causer);

/**
 * Call when a client applies the effect of using a bandage.
 *
 * @note _bleedingOut == 1
 *
 * @param client    client index.
 * @return          Return Plugin_Continue Continue with the original action, otherwise skip real function.
 */
forward Action OnPlayerApplyBandage(int client);
forward  void  OnPlayerApplyBandagePost(int client);

/**
 * Call when a client applies the effect of using a first aid kit.
 *
 * @param client    client index.
 * @return          Return Plugin_Continue Continue with the original action, otherwise skip real function.
 */
forward Action OnPlayerApplyFirstAidKit(int client);
forward  void  OnPlayerApplyFirstAidKitPost(int client);


/**
 * Call when a client applies the effect of gene therapy vaccine, cures and immunizes infection.
 *
 * @note _vaccinated == 0
 *
 * @param client    client index.
 * @return          Return Plugin_Continue Continue with the original action, otherwise skip real function.
 */
forward Action OnPlayerApplyVaccine(int client);
forward  void  OnPlayerApplyVaccinePost(int client);

/**
 * Call when a client inflicts bleeding.
 *
 * @note 不需要判断，因为绕行的是实际工作的函数
 *
 * @param client    client index.
 * @return          Return Plugin_Continue Continue with the original action, otherwise skip real function.
 */
forward Action OnPlayerBleedOut(int client);
forward  void  OnPlayerBleedOutPost(int client);

/**
 * Call when a client stop bleeding out.
 *
 * @note called 0 times, on death, spawn
 * @note called 1 times, on extract, use medical box
 * @note called 2 times, on bandage taken, on firstAidKit taken
 * @note _bleedingOut == 1
 *
 * @param client    client index.
 * @return          Return Plugin_Continue Continue with the original action, otherwise skip real function.
 */
forward Action OnPlayerStopBleedingOut(int client);
forward  void  OnPlayerStopBleedingOutPost(int client);





/**
 * CNMRIH_Player
 */
methodmap NMR_Player {

    public NMR_Player(int player) {
        return view_as<NMR_Player>(player);
    }

    property int Index {
        public get() {
            return view_as<int>(this);
        }
    }

    property bool InBound {
        public get() {
            return (this.Index > 0 && this.Index <= MaxClients);
        }
    }

    property bool Connected {
        public get() {
            return IsClientConnected(this.Index);
        }
    }

    property bool InGame {
        public get() {
            return IsClientInGame(this.Index);
        }
    }

    property bool IsValid {
        public get() {
            return IsValidClient(this.Index);
        }
    }

    property int UserId {
        public get() {
            return GetClientUserId(this.Index);
        }
    }

    property int Serial {
        public get() {
            return GetClientSerial(this.Index);
        }
    }

    property bool IsTimingOut {
        public get() {
            return IsClientTimingOut(this.Index);
        }
    }

    property bool InKickQueue {
        public get() {
            return IsClientInKickQueue(this.Index);
        }
    }

    property bool IsAuthorized {
        public get() {
            return IsClientAuthorized(this.Index);
        }
    }

    property bool IsAlive {
        public get() {
            return IsPlayerAlive(this.Index);
        }
    }

    property bool IsFake {
        public get() {
            return IsFakeClient(this.Index);
        }
    }

    property bool IsSourceTV {
        public get() {
            return IsClientSourceTV(this.Index);
        }
    }

    property bool IsReplay {
        public get() {
            return IsClientReplay(this.Index);
        }
    }

    property bool IsObserver {
        public get() {
            return IsClientObserver(this.Index);
        }
    }

    property int FlagBits {
        public get() {
            return GetUserFlagBits(this.Index);
        }
    }

    property Address Addr {
        public get() {
            return GetEntityAddress(this.Index);
        }
    }

    /**
     * Effects to apply
     */
    property int m_fEffects {
        public native get();
        public native set(int value);
    }

    property int m_CollisionGroup {
        public native get();
        public native set(int value);
    }

    property int moveparent {
        public native get();
        public native set(int value);
    }

    /**
     * Object movetype
     *
     * 0 if we're relative to the parent's absorigin and absangles.
     */
    property int m_iParentAttachment {
        public native get();
        public native set(int value);
    }

    property MoveType movetype {
        public native get();
        public native set(MoveType value);
    }

    property int movecollide {
        public native get();
        public native set(int value);
    }

    property bool m_bIsGlowable {
        public native get();
        public native set(bool value);
    }

    property bool m_bGlowing {
        public native get();
        public native set(bool value);
    }

    property int m_clrGlowColor {
        public native get();
        public native set(int value);
    }

    property float m_flGlowDistance {
        public native get();
        public native set(float value);
    }

    property bool m_bGlowBlip {
        public native get();
        public native set(bool value);
    }

    /**
     * The active weapon index of player.
     */
    property int m_hActiveWeapon {
        public native get();
        public native set(int value);
    }

    /**
     * Note1: 感染结束时间, 达到这个时间玩家就会死亡, 尸体变为 npc
     * Note2: You can use GetGameTime() to calculate this value.
     *        This value should always be in the future, it normally depends on "sv_infectionlength".
     */
    property float m_flInfectionDeathTime {
        public native get();
        public native set(float value);
    }

    /**
     * Note1: 感染开始时间
     * Note2: You can subtract this from GetGameTime() to get the number of seconds since infection.
     */
    property float m_flInfectionTime {
        public native get();
        public native set(float value);
    }

    property int m_iHealth {
        public native get();
        public native set(int value);
    }

    property int m_lifeState {
        public native get();
        public native set(int value);
    }

    /**
     * 默认值为 224, 应该是奔跑时的最大速度
     * send 和 Data 都有, 但仅修改 data 时似乎没效果
     */
    property float m_flMaxspeed {
        public native get();
        public native set(float value);
    }

    property int m_fFlags {
        public native get();
        public native set(int value);
    }

    property int m_iObserverMode {
        public native get();
        public native set(int value);
    }

    property int m_hObserverTarget {
        public native get();
        public native set(int value);
    }

    /**
     * field of view
     */
    property int m_iFOV {
        public native get();
        public native set(int value);
    }

    /**
     * starting value of the FOV changing over time (client only)
     */
    property int m_iFOVStart {
        public native get();
        public native set(int value);
    }

    /**
     * starting time of the FOV zoom
     */
    property float m_flFOVTime {
        public native get();
        public native set(float value);
    }

    /**
     * default FOV if no other zooms are occurring
     */
    property int m_iDefaultFOV {
        public native get();
        public native set(int value);
    }

    /**
     * bitfields containing sections of the HUD to hide
     */
    property int m_iHideHUD {
        public native get();
        public native set(int value);
    }

    /**
     * rate at which the FOV changes
     */
    property float m_flFOVRate {
        public native get();
        public native set(float value);
    }

    property bool m_bDucked {
        public native get();
        public native set(bool value);
    }

    property bool m_bDucking {
        public native get();
        public native set(bool value);
    }

    property bool m_bInDuckJump {
        public native get();
        public native set(bool value);
    }

    property float m_flDucktime {
        public native get();
        public native set(float value);
    }

    property float m_flDuckJumpTime {
        public native get();
        public native set(float value);
    }

    property float m_flJumpTime {
        public native get();
        public native set(float value);
    }

    property float m_flFallVelocity {
        public native get();
        public native set(float value);
    }

    property bool m_bPoisoned {
        public native get();
        public native set(bool value);
    }

    property float m_flStepSize {
        public native get();
        public native set(float value);
    }

    /**
     * Object eye position
     */
    property float m_vecViewOffset_0 {
        public native get();
        public native set(float value);
    }

    /**
     * Object eye position
     */
    property float m_vecViewOffset_1 {
        public native get();
        public native set(float value);
    }

    /**
     * Object eye position
     */
    property float m_vecViewOffset_2 {
        public native get();
        public native set(float value);
    }

    /**
     * 摩擦系数
     * offset = 636
     * send 和 Data 都有
     */
    property float m_flFriction {
        public native get();
        public native set(float value);
    }

    property int m_hLastWeapon {
        public native get();
        public native set(int value);
    }

    /**
     * 玩家所在地面 entity index
     * @note  0 is world
     * @note -1 is nothing
     */
    property int m_hGroundEntity {
        public native get();
        public native set(int value);
    }

    /**
     * ? 地面时的移动速度, 但比 cl_showpos 计算的更小, 特别在侧向移动时差值更大
     */
    property float m_flGroundSpeed {
        public get()            { return GetEntPropFloat(this.Index, Prop_Data, "m_flGroundSpeed"); }
        public set(float value) { SetEntPropFloat(this.Index, Prop_Data, "m_flGroundSpeed", value); }
    }

    property float m_vecVelocity_0 {
        public native get();
        public native set(float value);
    }

    property float m_vecVelocity_1 {
        public native get();
        public native set(float value);
    }

    property float m_vecVelocity_2 {
        public native get();
        public native set(float value);
    }

    /**
     * last time player died
     */
    property float m_flDeathTime {
        public native get();
        public native set(float value);
    }

    property int m_nWaterLevel {
        public native get();
        public native set(int value);
    }

    property float m_flLaggedMovementValue {
        public native get();
        public native set(float value);
    }

    /**
     * Note: default full stamina = 130.0
     */
    property float m_flStamina {
        public native get();
        public native set(float value);
    }

    property bool m_bIsSprinting {
        public native get();
        public native set(bool value);
    }

    property bool m_bTalkingWalkie {
        public native get();
        public native set(bool value);
    }

    property bool m_bSprintEnabled {
        public native get();
        public native set(bool value);
    }

    property bool m_bStickyIronsight {
        public native get();
        public native set(bool value);
    }

    /**
     * Note: The clients dead body will come back to life as a dead npc zombie.
     */
    property bool m_bDiedWhileInfected {
        public native get();
        public native set(bool value);
    }

    property bool m_bGrabbed {
        public native get();
        public native set(bool value);
    }

    property bool _bleedingOut {
        public native get();
        public native set(bool value);
    }

    property float m_flThrowDropTimer {
        public native get();
        public native set(float value);
    }

    /**
     * Note1: 仅一号背包，不包括弹药重量。
     * Note2: 最大值为 1000。
     */
    property int _carriedWeight {
        public native get();
        public native set(int value);
    }

    property int m_iTokens {
        public native get();
        public native set(int value);
    }

    property int m_iDeaths {
        public native get();
        public native set(int value);
    }

    property bool _usingToolSecondary {
        public native get();
        public native set(bool value);
    }

    property bool _contemplatingSuicide {
        public native get();
        public native set(bool value);
    }

    property int _playerModelIndex {
        public native get();
        public native set(int value);
    }

    property float _nextRespawnTime {
        public native get();
        public native set(float value);
    }

    property bool _vaccinated {
        public native get();
        public native set(bool value);
    }

    property bool m_bGrabbedByCrawler {
        public native get();
        public native set(bool value);
    }

    /**
     * Note1: 玩家因注射疫苗部分失明，距离恢复光明的时间
     * Note2: 游戏中到达此时间后不会立即恢复光明，而是几秒内缓慢恢复
     * Note3: You can subtract GetGameTime() from this to get the number of seconds left.
     *        This value is always in the future, it normally depends on "sv_vaccine_partial_blind_duration".
     */
    property float m_flPartialBlindnessEffectEnd {
        public native get();
        public native set(float value);
    }

    property bool m_bIsExtracted {
        public native get();
        public native set(bool value);
    }

    property bool m_bUsingProgressTrigger {
        public native get();
        public native set(bool value);
    }

    property bool m_bLevelTransition {
        public native get();
        public native set(bool value);
    }

    property float m_flSpeedModifier {
        public native get();
        public native set(float value);
    }

    property float m_flSpeedOverride {
        public native get();
        public native set(float value);
    }

    property float m_flTriggerSpeedModifier {
        public native get();
        public native set(float value);
    }

    property int m_ArmorValue {
        public native get();
        public native set(int value);
    }

    /**
     * Control the firing rate.
     */
    property float m_flNextAttack {
        public native get();
        public native set(float value);
    }

    /**
     * The body index
     *
     * @note Object bodygroup
     */
    property int m_nBody {
        public native get();
        public native set(int value);
    }

    /**
     * The skin index
     *
     * @note Texture group to use
     */
    property int m_nSkin {
        public native get();
        public native set(int value);
    }

    /**
     * The model index of an entity
     *
     * @note Object model index
     */
    property int m_nModelIndex {
        public native get();
        public native set(int value);
    }

    property int m_iMaxHealth {
        public native get();
        public native set(int value);
    }

    property int m_LastHitGroup {
        public native get();
        public native set(int value);
    }

    property int m_iFrags {
        public native get();
        public native set(int value);
    }

    property float m_flGravity {
        public native get();
        public native set(float value);
    }

    /**
     * Adds carried inventory weight.
     *
     * @note    这不是增加背包容量, 而是增加了玩家当前负重.
     */
    public native void AddCarriedWeight(int weight);

    /**
     * Drops one box of owned ammo, with parameter of ammo name (without ammobox_ prefix, e.g. '12gauge'). Returns success.
     */
    public native bool Ammo_Drop(const char[] ammo);

    /**
     * Applies the effect of using a bandage.
     */
    public native void ApplyBandage();

    /**
     * Applies the effect of using a first aid kit.
     */
    public native void ApplyFirstAidKit();

    /**
     * Applies the effect of gene therapy vaccine, cures and immunizes infection.
     */
    public native void ApplyVaccine();

    /**
     * Inflicts bleeding.
     */
    public native void BleedOut();

    /**
     * Cancels suicide when contemplating, with boolean parameter for playing cancel animation.
     */
    public native void CancelSuicide(bool cancelAnimation);

    /**
     * Cancels active weapon throw.
     *
     * @note    似乎不起作用
     */
    public native void CancelThrowDrop();

    /**
     * Resets viewmodel hands back to default.
     *
     * @note    没有测试条件
     */
    public native void ClearHandModelOverride();

    /**
     * Begins contemplating suicide.
     */
    public native void ContemplateSuicide();

    /**
     * Returns the amount of times player has died.
     *
     * @note    与计分板的死亡数不同, 这应该是当前回合的死亡数, 相当于 m_iDeaths
     */
    public native int DeathCount();

    /**
     * Decrements active respawn tokens.
     */
    public native void DecrementRespawnTokens();

    /**
     * Destroys all ammo that player owns.
     */
    public native void DestroyAllAmmo();

    /**
     * Destroys all weapons that player owns.
     */
    public native void DestroyAllWeapons();

    /**
     * Destroys all items that player owns.
     */
    public native void DestroyEverything();

    /**
     * Does commit suicide.
     */
    public native void DoCommitSuicide();

    /**
     * Drops all items that player owns.
     */
    public native void DropEverything();

    /**
     * Enables / disables sprinting ability.
     */
    public native void EnableSprint(bool value);

    /**
     * Returns ammo inventory weight.
     */
    public native int GetAmmoCarryWeight();

    /**
     * Fills table with carried inventory items, including weapons and custom items (excl. passive items such as fists, zippo, and ammo).
     */
    // TODO
    // public native void GetCarriedItems(Handle handle);

    /**
     * Returns total carried inventory weight.
     */
    public native int GetCarriedWeight();

    /**
     * Returns the amount of stamina jumping costs.
     */
    public native float GetJumpStaminaCost();

    /**
     * Returns previous observer mode.
     */
    public native int GetLastObserverMode();

    /**
     * Returns next respawn time for this player.
     */
    public native float GetNextRespawnTime();

    /**
     * Returns max carried inventory weight.
     */
    public native float GetMaxCarriedWeight();

    /**
     * Returns next spawn attempt time for this player.
     */
    public native float GetNextSpawnTryTime();

    /**
     * Returns active speed modifier.
     */
    public native float GetSpeedModifier();

    /**
     * Returns active speed override, -1.0 if none is applied.
     */
    public native float GetSpeedOverride();

    /**
     * Returns player stamina.
     */
    public native float GetStamina();

    /**
     * Returns current weapon throw scale.
     */
    public native float GetThrowScale();

    // TODO
    /**
     * Returns weapon throw vector, with parameter of throw force.
     */
    // public native Vector GetThrowVector(float vec);

    /**
     * Returns true if player owns flashlight.
     */
    public native bool HasFlashlight();

    /**
     * Returns true if player has given weight available.
     */
    public native bool HasLeftoverWeight(int value);

    /**
     * Returns true if player owns walkie talkie.
     */
    public native bool HasWalkieTalkie();

    /**
     * Increases visual bloodiness.
     */
    public native void IncreaseBloodiness();

    /**
     * Increments active respawn tokens.
     */
    public native void IncrementRespawnTokens();

    /**
     * Returns true is player is bleeding.
     */
    public native bool IsBleedingOut();

    /**
     * Returns true when player is contemplating suicide.
     */
    public native bool IsContemplatingSuicide();

    /**
     * Returns true if player is ducking.
     */
    public native bool IsDucking();

    /**
     * Returns true if player is extracted.
     */
    public native bool IsExtracted();

    /**
     * Returns true if player is being grabbed by a zombie.
     */
    public native bool IsGrabbed();

    /**
     * Returns true if this player is a listen server host.
     */
    public native bool IsHost();

    /**
     * Returns true if player is in level transition.
     */
    public native bool IsInLevelTransition();

    /**
     * Returns true if player is jumping.
     */
    public native bool IsJumping();

    /**
     * Returns true if player is experiencing blindness from vaccine side effects.
     */
    public native bool IsPartialBlindnessActive();

    /**
     * Returns true if player is sprinting.
     */
    public native bool IsSprinting();

    /**
     * Returns true if player is talking without a walkie talkie.
     */
    public native bool IsTalkingLocal();

    /**
     * Returns true if player is talking with a walkie talkie.
     */
    public native bool IsTalkingWalkie();

    /**
     * Returns true if player is using a tool.
     */
    public native bool IsUsingProgressTrigger();

    /**
     * Returns true if player is vaccinated.
     */
    public native bool IsVaccinated();

    /**
     * Returns true when voice command timer has expired.
     */
    public native bool IsVoiceCommandTimerExpired();

    /**
     * Returns true if player is ready to respawn.
     */
    public native bool ReadyToRespawn();

    /**
     * Removes carried inventory weight.
     * Note: 似乎不起作用
     */
    public native void RemoveCarriedWeight(int weight);

    /**
     * Removes infection and bleeding.
     */
    public native void RemoveInflictions();

    /**
     * Resets active respawn tokens.
     */
    public native void ResetRespawnTokens();

    /**
     * Resets voice command cooldown timer.
     */
    public native void ResetVoiceCommandTimer();

    /**
     * Returns active respawn token count.
     */
    public native int RespawnTokenCount();

    /**
     * Sets this player as extracted.
     */
    public native void SetExtracted(bool value);

    /**
     * Overrides viewmodel hands, with string parameter for model name.
     */
    public native void SetHandModelOverride(const char[] model);

    /**
     * Sets timeout for idle auto-kick.
     */
    public native void SetIdleTimeout(float time);

    /**
     * Makes the player ignore all fall damage.
     */
    public native void SetIgnoreFallDamage(bool value);

    /**
     * Sets next respawn time for this player.
     */
    public native void SetNextRespawnTime(float time);

    /**
     * Sets next spawn attempt time for this player.
     */
    public native void SetNextSpawnTryTime(float time);

    /**
     * Sets active respawn tokens, with boolean parameter if player should be notified.
     */
    public native void SetRespawnTokens(int tokens, bool notify);

    /**
     * Sets starting weapon when player spawns, with weapon classname, and ammo percent as integer.
     */
    public native void SetSpawnWeapon(const char[] classname, int ammoPercent);

    /**
     * Sets overall player speed modifier, applied last.
     */
    public native void SetSpeedModifier(float value);

    /**
     * Overrides player speed to an absolute value, ignoring all modifiers.
     */
    public native void SetSpeedOverride(float speed);

    /**
     * Sets player stamina.
     */
    public native void SetStamina(float stamina);

    /**
     * Sets the state of player using a tool.
     */
    public native void SetUsingProgressTrigger(bool value);

    /**
     * Returns true if player should ignore fall damage.
     */
    public native bool ShouldIgnoreFallDamage();

    /**
     * Stops bleeding.
     */
    public native void StopBleedingOut();

    /**
     * Throws all ammo that player owns.
     */
    public native void ThrowAllAmmo();

    /**
     * Throws all custom items that player owns.
     */
    public native void ThrowAllCustomItems();

    /**
     * Throws all weapons that player owns.
     *
     * @note    丢弃后会导致视图武器为丢弃前手持的武器, 无法使用拳头
     */
    public native void ThrowAllWeapons();

    /**
     * Tries a voice command, with boolean parameter for playing it regardless of cooldown.
     */
    public native void VoiceCommand(int voice, bool cooldown);

    /**
     * Check if the player is moving.
     *
     * @note    撞到墙上时即使, 按着移动键, 没有位移, 返回 false
     */
    public native bool IsMoving();

    /**
     * Returns how long the player has lived or 99999.999 for never survived.
     *
     * @note    死亡后还在增加
     * @return  return time we have been alive (only valid when alive)
     */
    public native float GetAliveDuration();

    /**
     * Returns true if the flashlight is on.
     */
    public native bool FlashlightIsOn();

    /**
     * Turns on the flashlight.
     */
    public native void FlashlightTurnOn();

    /**
     * Turns off the flashlight.
     */
    public native void FlashlightTurnOff();

    /**
     * Cures active infection.
     */
    public native void CureInfection();

    /**
     * Character becomes infected.
     */
    public native void BecomeInfected();

    /**
     * Resets infection time.
     *
     * @note 未感染时调用无效
     */
    public native void TakePills();

    /**
     * CNMRiH_Player::TakePills 内部实际调用的是 CInfectableCharacter::TakePills
     * 以及处理效果和发送事件等琐碎
     */
    public native void TakePillsInner();

    /**
     * 使用药丸的效果，类似于闪光弹造成的白屏，但时间很短。
     *
     * @note 未感染时调用也有效
     * @note 暂不支持 windows
     */
    public native void TakePillsEffects();

    public native bool IsValidObserverTarget(int entity);

    public native bool CanSprint();

    /**
     * Gets the velocity.
     * @note m_vecVelocity
     *
     * @param velocity          The velocity output.
     */
    public native void GetVelocity(float velocity[3]);
    /**
     * Sets the velocity.
     *
     * @param velocity          The velocity output.
     * @param stack             True will stack new velocity onto the player current velocity.
     *                          False will reset it.
     */
    public native void SetVelocity(float velocity[3], bool stack=false);

    /**
     * Gets the m_vecOrigin
     */
    public native void GetOrigin(float position[3]);
    public native void SetOrigin(float position[3], bool changeState=false);

    /**
     * Gets the abs origin.
     * @note m_vecAbsOrigin
     *
     * @param position          The origin output.
     */
    public native void GetAbsOrigin(float position[3]);
    public native void SetAbsOrigin(float position[3], bool changeState=false);

    /**
     * Gets the abs angle.
     * @note m_angAbsRotation
     *
     * @param angles             The angle output.
     */
    public native void GetAbsAngles(float angles[3]);
    public native void SetAbsAngles(float angles[3], bool changeState=false);

    /**
     * Gets the abs velocity.
     * @note m_vecAbsVelocity
     *
     * @param velocity          The velocity output.
     */
    public native void GetAbsVelocity(float velocity[3]);
    public native void SetAbsVelocity(float velocity[3], bool changeState=false);

    /**
     * Gets the max size vector.
     *
     * @param maxs              The max size vector output.
     */
    public native void GetMaxs(float maxs[3]);
    public native void SetMaxs(float maxs[3], bool changeState=false);

    /**
     * Gets the min size vector.
     *
     * @param mins              The max size vector output.
     */
    public native void GetMins(float mins[3]);
    public native void SetMins(float mins[3], bool changeState=false);

    /**
     * @note m_nOldButtons
     *
     * @return                  player old buttons.
     */
    public native int GetOldButtons();
    public native int SetOldButtons();

    /**
     * Gets the speed.
     */
    public native float GetSpeed(bool ignoreVertical=false);

    /**
     * 获取玩家距离 entity 的长度
     *
     * @return                  返回玩家距离 entity 的长度
     */
    public native float GetEntityDistance(int entity);

    /**
     * @return                  True if character is infected.
     */
    public native bool IsInfected();

    public bool IsGenericAdmin() {
        return IsGenericAdmin(this.Index);
    }

    /**
     * Author   dysphie
     * url      https://github.com/dysphie/nmrih-team-healing/blob/c68dcc687c943be9927656e07f880e66e174651f/scripting/nmrih-team-healing.sp#L844
     */
    public void Freeze() {
        this.m_fFlags |= NMR_FL_ATCONTROLS;
    }

    /**
     * Author   dysphie
     * url      https://github.com/dysphie/nmrih-team-healing/blob/c68dcc687c943be9927656e07f880e66e174651f/scripting/nmrih-team-healing.sp#L850
     */
    public void UnFreeze() {
        this.m_fFlags &= ~NMR_FL_ATCONTROLS;
    }

    public bool IsFreeze() {
        return (this.m_fFlags & NMR_FL_ATCONTROLS) != 0;
    }
}

#if !defined _gremulock_clients_methodmap_included_
stock bool IsValidClient(int client) {
    return client > 0 && client <= MaxClients && IsClientInGame(client);
}
#endif

stock bool IsGenericAdmin(int client) {
    return CheckCommandAccess(client, "generic_admin", ADMFLAG_GENERIC, false);
}
