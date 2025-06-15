/** Double-include prevention */
#if defined _nmrih_player_utils_included_
  #endinput
#endif
#define _nmrih_player_utils_included_

#include <vscript_proxy>

#pragma newdecls required
#pragma semicolon 1


#define NMR_MAXPLAYERS              9

#define NMR_IN_DROP_WEAPON          (1 << 15)   // key g "+dropweapon"
#define NMR_IN_SELECT_FIRE          (1 << 24)   // key x "+selectfire"
#define NMR_IN_MAGLITE              (1 << 26)   // Brings up the maglite if owned and using a one handed weapon (+maglite)
#define NMR_IN_SHOVE                (1 << 27)   // Shoves away zombies (+shove)
#define NMR_IN_COMPASS              (1 << 28)   // key c "+compass"
#define NMR_IN_INVENTORY            (1 << 29)   // Opens weapon inventory (+inventory)
#define NMR_IN_AMMOINV              (1 << 30)   // Opens ammunition inventory (+ammoinv)
#define NMR_IN_VOICE_COMMAND        (1 << 31)   // key 3 "+voicecommand"

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


enum NMR_ObserverMode
{
    ObsMode_InEye = 4,              // First Person
    ObsMode_Chase,                  // Third Person Observer Mode
    ObsMode_Poi,                    // Third Person but no player name and health ?
    ObsMode_Free,                   // Free
}


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
 * @note 此 Detour 的是 CNMRiH_Player::BecomeInfected, 如需检测由未感染变为感染
 *       要回调内判断 GetEntData(client, 285) & 128 != 0 && _vaccinated == 0
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
 * @note 检测 GetEntData(client, 1340) != 0
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
 * @note 绕行的是实际工作的函数，但使用指令 bleedout 会在已流血的情况下触发，而 OnTakeDamage_Alive 不会
 *       因此在检查从未流血变为流血时，需要判断 _bleedingOut 是否为 false
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
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_fEffects"); }
        public set(int value)   { SetEntProp(this.Index, Prop_Send, "m_fEffects", value); }
    }

    property int m_CollisionGroup {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_CollisionGroup"); }
        public set(int value)   { SetEntProp(this.Index, Prop_Send, "m_CollisionGroup", value); }
    }

    property int moveparent {
        public get()            { return GetEntProp(this.Index, Prop_Send, "moveparent"); }
        public set(int value)   { SetEntProp(this.Index, Prop_Send, "moveparent", value); }
    }

    /**
     * Object movetype
     *
     * 0 if we're relative to the parent's absorigin and absangles.
     */
    property int m_iParentAttachment {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_iParentAttachment"); }
        public set(int value)   { SetEntProp(this.Index, Prop_Send, "m_iParentAttachment", value); }
    }

    property MoveType movetype {
        public get()                { return view_as<MoveType>(GetEntProp(this.Index, Prop_Send, "movetype")); }
        public set(MoveType value)  { SetEntProp(this.Index, Prop_Send, "movetype", value); }
    }

    property int movecollide {
        public get()            { return GetEntProp(this.Index, Prop_Send, "movecollide"); }
        public set(int value)   { SetEntProp(this.Index, Prop_Send, "movecollide", value); }
    }

    property bool m_bIsGlowable {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_bIsGlowable") != 0 ? true : false; }
        public set(bool value)  { SetEntProp(this.Index, Prop_Send, "m_bIsGlowable", value); }
    }

    property bool m_bGlowing {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_bGlowing") != 0 ? true : false; }
        public set(bool value)  { SetEntProp(this.Index, Prop_Send, "m_bGlowing", value); }
    }

    property int m_clrGlowColor {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_clrGlowColor"); }
        public set(int value)   { SetEntProp(this.Index, Prop_Send, "m_clrGlowColor", value); }
    }

    property float m_flGlowDistance {
        public get()            { return GetEntPropFloat(this.Index, Prop_Send, "m_flGlowDistance"); }
        public set(float value) { SetEntPropFloat(this.Index, Prop_Send, "m_flGlowDistance", value); }
    }

    property bool m_bGlowBlip {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_bGlowBlip") != 0 ? true : false; }
        public set(bool value)  { SetEntProp(this.Index, Prop_Send, "m_bGlowBlip", value); }
    }

    /**
     * The active weapon index of player.
     */
    property int m_hActiveWeapon {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_hActiveWeapon"); }
        public set(int value)   { SetEntProp(this.Index, Prop_Send, "m_hActiveWeapon", value); }
    }

    /**
     * Note1: 感染结束时间, 达到这个时间玩家就会死亡, 尸体变为 npc
     * Note2: You can use GetGameTime() to calculate this value.
     *        This value should always be in the future, it normally depends on "sv_infectionlength".
     */
    property float m_flInfectionDeathTime {
        public get()            { return GetEntPropFloat(this.Index, Prop_Send, "m_flInfectionDeathTime"); }
        public set(float value) { SetEntPropFloat(this.Index, Prop_Send, "m_flInfectionDeathTime", value); }
    }

    /**
     * Note1: 感染开始时间
     * Note2: You can subtract this from GetGameTime() to get the number of seconds since infection.
     */
    property float m_flInfectionTime {
        public get()            { return GetEntPropFloat(this.Index, Prop_Send, "m_flInfectionTime"); }
        public set(float value) { SetEntPropFloat(this.Index, Prop_Send, "m_flInfectionTime", value); }
    }

    property int m_iHealth {
        public get()            { GetClientHealth(this.Index); }
        public set(int value)   { SetEntityHealth(this.Index, value); }
    }

    property int m_lifeState {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_lifeState"); }
        public set(int value)   { SetEntProp(this.Index, Prop_Send, "m_lifeState", value); }
    }

    property int m_iPlayerState {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_iPlayerState"); }
        public set(int value)   { SetEntProp(this.Index, Prop_Send, "m_iPlayerState", value); }
    }

    /**
     * 默认值为 224, 应该是奔跑时的最大速度
     * send 和 Data 都有, 但仅修改 data 时似乎没效果
     */
    property float m_flMaxspeed {
        public get()            { return GetEntPropFloat(this.Index, Prop_Send, "m_flMaxspeed"); }
        public set(float value) { SetEntPropFloat(this.Index, Prop_Send, "m_flMaxspeed", value); }
    }

    property int m_fFlags {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_fFlags"); }
        public set(int value)   { SetEntProp(this.Index, Prop_Send, "m_fFlags", value); }
    }

    property NMR_ObserverMode m_iObserverMode {
        public get()                        { return view_as<NMR_ObserverMode>(GetEntProp(this.Index, Prop_Send, "m_iObserverMode")); }
        public set(NMR_ObserverMode value)  { SetEntProp(this.Index, Prop_Send, "m_iObserverMode", value); }
    }

    property int m_hObserverTarget {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_hObserverTarget"); }
        public set(int value)   { SetEntProp(this.Index, Prop_Send, "m_hObserverTarget", value); }
    }

    /**
     * field of view
     */
    property int m_iFOV {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_iFOV"); }
        public set(int value)   { SetEntProp(this.Index, Prop_Send, "m_iFOV", value); }
    }

    /**
     * starting value of the FOV changing over time (client only)
     */
    property int m_iFOVStart {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_iFOVStart"); }
        public set(int value)   { SetEntProp(this.Index, Prop_Send, "m_iFOVStart", value); }
    }

    /**
     * starting time of the FOV zoom
     */
    property float m_flFOVTime {
        public get()            { return GetEntPropFloat(this.Index, Prop_Send, "m_flFOVTime"); }
        public set(float value) { SetEntPropFloat(this.Index, Prop_Send, "m_flFOVTime", value); }
    }

    /**
     * default FOV if no other zooms are occurring
     */
    property int m_iDefaultFOV {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_iDefaultFOV"); }
        public set(int value)   { SetEntProp(this.Index, Prop_Send, "m_iDefaultFOV", value); }
    }

    /**
     * bitfields containing sections of the HUD to hide
     */
    property int m_iHideHUD {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_iHideHUD"); }
        public set(int value)   { SetEntProp(this.Index, Prop_Send, "m_iHideHUD", value); }
    }

    /**
     * rate at which the FOV changes
     */
    property float m_flFOVRate {
        public get()            { return GetEntPropFloat(this.Index, Prop_Send, "m_flFOVRate"); }
        public set(float value) { SetEntPropFloat(this.Index, Prop_Send, "m_flFOVRate", value); }
    }

    property bool m_bDucked {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_bDucked") != 0 ? true : false; }
        public set(bool value)  { SetEntProp(this.Index, Prop_Send, "m_bDucked", value); }
    }

    property bool m_bDucking {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_bDucking") != 0 ? true : false; }
        public set(bool value)  { SetEntProp(this.Index, Prop_Send, "m_bDucking", value); }
    }

    property bool m_bInDuckJump {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_bInDuckJump") != 0 ? true : false; }
        public set(bool value)  { SetEntProp(this.Index, Prop_Send, "m_bInDuckJump", value); }
    }

    property float m_flDucktime {
        public get()            { return GetEntPropFloat(this.Index, Prop_Send, "m_flDucktime"); }
        public set(float value) { SetEntPropFloat(this.Index, Prop_Send, "m_flDucktime", value); }
    }

    property float m_flDuckJumpTime {
        public get()            { return GetEntPropFloat(this.Index, Prop_Send, "m_flDuckJumpTime"); }
        public set(float value) { SetEntPropFloat(this.Index, Prop_Send, "m_flDuckJumpTime", value); }
    }

    property float m_flJumpTime {
        public get()            { return GetEntPropFloat(this.Index, Prop_Send, "m_flJumpTime"); }
        public set(float value) { SetEntPropFloat(this.Index, Prop_Send, "m_flJumpTime", value); }
    }

    property float m_flFallVelocity {
        public get()            { return GetEntPropFloat(this.Index, Prop_Send, "m_flFallVelocity"); }
        public set(float value) { SetEntPropFloat(this.Index, Prop_Send, "m_flFallVelocity", value); }
    }

    property bool m_bPoisoned {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_bPoisoned") != 0 ? true : false; }
        public set(bool value)  { SetEntProp(this.Index, Prop_Send, "m_bPoisoned", value); }
    }

    property float m_flStepSize {
        public get()            { return GetEntPropFloat(this.Index, Prop_Send, "m_flStepSize"); }
        public set(float value) { SetEntPropFloat(this.Index, Prop_Send, "m_flStepSize", value); }
    }

    /**
     * Object eye position
     */
    property float m_vecViewOffset_0 {
        public get()            { return GetEntPropFloat(this.Index, Prop_Send, "m_vecViewOffset_0"); }
        public set(float value) { SetEntPropFloat(this.Index, Prop_Send, "m_vecViewOffset_0", value); }
    }

    /**
     * Object eye position
     */
    property float m_vecViewOffset_1 {
        public get()            { return GetEntPropFloat(this.Index, Prop_Send, "m_vecViewOffset_1"); }
        public set(float value) { SetEntPropFloat(this.Index, Prop_Send, "m_vecViewOffset_1", value); }
    }

    /**
     * Object eye position
     */
    property float m_vecViewOffset_2 {
        public get()            { return GetEntPropFloat(this.Index, Prop_Send, "m_vecViewOffset_2"); }
        public set(float value) { SetEntPropFloat(this.Index, Prop_Send, "m_vecViewOffset_2", value); }
    }

    /**
     * 摩擦系数
     * offset = 636
     * send 和 Data 都有
     */
    property float m_flFriction {
        public get()            { return GetEntPropFloat(this.Index, Prop_Send, "m_flFriction"); }
        public set(float value) { SetEntPropFloat(this.Index, Prop_Send, "m_flFriction", value); }
    }

    property int m_hLastWeapon {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_hLastWeapon"); }
        public set(int value)   { SetEntProp(this.Index, Prop_Send, "m_hLastWeapon", value); }
    }

    /**
     * 玩家所在地面 entity index
     * @note  0 is world
     * @note -1 is nothing
     */
    property int m_hGroundEntity {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_hGroundEntity"); }
        public set(int value)   { SetEntProp(this.Index, Prop_Send, "m_hGroundEntity", value); }
    }

    /**
     * ? 地面时的移动速度, 但比 cl_showpos 计算的更小, 特别在侧向移动时差值更大
     */
    property float m_flGroundSpeed {
        public get()            { return GetEntPropFloat(this.Index, Prop_Send, "m_flGroundSpeed"); }
        public set(float value) {        SetEntPropFloat(this.Index, Prop_Send, "m_flGroundSpeed", value); }
    }

    property float m_vecVelocity_0 {
        public get()            { return GetEntPropFloat(this.Index, Prop_Send, "m_vecVelocity_0"); }
        public set(float value) {        SetEntPropFloat(this.Index, Prop_Send, "m_vecVelocity_0", value); }
    }

    property float m_vecVelocity_1 {
        public get()            { return GetEntPropFloat(this.Index, Prop_Send, "m_vecVelocity_1"); }
        public set(float value) {        SetEntPropFloat(this.Index, Prop_Send, "m_vecVelocity_1", value); }
    }

    property float m_vecVelocity_2 {
        public get()            { return GetEntPropFloat(this.Index, Prop_Send, "m_vecVelocity_2"); }
        public set(float value) {        SetEntPropFloat(this.Index, Prop_Send, "m_vecVelocity_2", value); }
    }

    /**
     * last time player died
     */
    property float m_flDeathTime {
        public get()            { return GetEntPropFloat(this.Index, Prop_Send, "m_flDeathTime"); }
        public set(float value) {        SetEntPropFloat(this.Index, Prop_Send, "m_flDeathTime", value); }
    }

    property int m_nWaterLevel {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_nWaterLevel"); }
        public set(int value)   { SetEntProp(this.Index, Prop_Send, "m_nWaterLevel", value); }
    }

    property float m_flLaggedMovementValue {
        public get()            { return GetEntPropFloat(this.Index, Prop_Send, "m_flLaggedMovementValue"); }
        public set(float value) { SetEntPropFloat(this.Index, Prop_Send, "m_flLaggedMovementValue", value); }
    }

    /**
     * Note: default full stamina = 130.0
     */
    property float m_flStamina {
        public get()            { return GetEntPropFloat(this.Index, Prop_Send, "m_flStamina"); }
        public set(float value) { SetEntPropFloat(this.Index, Prop_Send, "m_flStamina", value); }
    }

    property bool m_bIsSprinting {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_bIsSprinting") != 0 ? true : false; }
        public set(bool value)  { SetEntProp(this.Index, Prop_Send, "m_bIsSprinting", value); }
    }

    property bool m_bTalkingWalkie {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_bTalkingWalkie") != 0 ? true : false; }
        public set(bool value)  { SetEntProp(this.Index, Prop_Send, "m_bTalkingWalkie", value); }
    }

    property bool m_bSprintEnabled {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_bSprintEnabled") != 0 ? true : false; }
        public set(bool value)  { SetEntProp(this.Index, Prop_Send, "m_bSprintEnabled", value); }
    }

    property bool m_bStickyIronsight {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_bStickyIronsight") != 0 ? true : false; }
        public set(bool value)  { SetEntProp(this.Index, Prop_Send, "m_bStickyIronsight", value); }
    }

    /**
     * Note: The clients dead body will come back to life as a dead npc zombie.
     */
    property bool m_bDiedWhileInfected {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_bDiedWhileInfected") != 0 ? true : false; }
        public set(bool value)  { SetEntProp(this.Index, Prop_Send, "m_bDiedWhileInfected", value); }
    }

    property bool m_bGrabbed {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_bGrabbed") != 0 ? true : false; }
        public set(bool value)  { SetEntProp(this.Index, Prop_Send, "m_bGrabbed", value); }
    }

    property bool _bleedingOut {
        public get()            { return GetEntProp(this.Index, Prop_Send, "_bleedingOut") != 0 ? true : false; }
        public set(bool value)  { SetEntProp(this.Index, Prop_Send, "_bleedingOut", value); }
    }

    property float m_flThrowDropTimer {
        public get()            { return GetEntPropFloat(this.Index, Prop_Send, "m_flThrowDropTimer"); }
        public set(float value) { SetEntPropFloat(this.Index, Prop_Send, "m_flThrowDropTimer", value); }
    }

    /**
     * Note1: 仅一号背包，不包括弹药重量。
     * Note2: 最大值为 1000。
     */
    property int _carriedWeight {
        public get()            { return GetEntProp(this.Index, Prop_Send, "_carriedWeight"); }
        public set(int value)   { SetEntProp(this.Index, Prop_Send, "_carriedWeight", value); }
    }

    property int m_iTokens {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_iTokens"); }
        public set(int value)   { SetEntProp(this.Index, Prop_Send, "m_iTokens", value); }
    }

    property int m_iDeaths {
        public get()            { return GetClientDeaths(this.Index); }
        public set(int value)   { SetEntProp(this.Index, Prop_Send, "m_hLastWeapon", value); }
    }

    property bool _usingToolSecondary {
        public get()            { return GetEntProp(this.Index, Prop_Send, "_usingToolSecondary") != 0 ? true : false; }
        public set(bool value)  { SetEntProp(this.Index, Prop_Send, "_usingToolSecondary", value); }
    }

    property bool _contemplatingSuicide {
        public get()            { return GetEntProp(this.Index, Prop_Send, "_contemplatingSuicide") != 0 ? true : false; }
        public set(bool value)  { SetEntProp(this.Index, Prop_Send, "_contemplatingSuicide", value); }
    }

    property int _playerModelIndex {
        public get()            { return GetEntProp(this.Index, Prop_Send, "_playerModelIndex"); }
        public set(int value)   { SetEntProp(this.Index, Prop_Send, "_playerModelIndex", value); }
    }

    property float _nextRespawnTime {
        public get()            { return GetEntPropFloat(this.Index, Prop_Send, "_nextRespawnTime"); }
        public set(float value) { SetEntPropFloat(this.Index, Prop_Send, "_nextRespawnTime", value); }
    }

    property bool _vaccinated {
        public get()            { return GetEntProp(this.Index, Prop_Send, "_vaccinated") != 0 ? true : false; }
        public set(bool value)  { SetEntProp(this.Index, Prop_Send, "_vaccinated", value); }
    }

    property bool m_bGrabbedByCrawler {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_bGrabbedByCrawler") != 0 ? true : false; }
        public set(bool value)  { SetEntProp(this.Index, Prop_Send, "m_bGrabbedByCrawler", value); }
    }

    /**
     * Note1: 玩家因注射疫苗部分失明，距离恢复光明的时间
     * Note2: 游戏中到达此时间后不会立即恢复光明，而是几秒内缓慢恢复
     * Note3: You can subtract GetGameTime() from this to get the number of seconds left.
     *        This value is always in the future, it normally depends on "sv_vaccine_partial_blind_duration".
     */
    property float m_flPartialBlindnessEffectEnd {
        public get()            { return GetEntPropFloat(this.Index, Prop_Send, "m_flPartialBlindnessEffectEnd"); }
        public set(float value) { SetEntPropFloat(this.Index, Prop_Send, "m_flPartialBlindnessEffectEnd", value); }
    }

    property bool m_bIsExtracted {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_bIsExtracted") != 0 ? true : false; }
        public set(bool value)  { SetEntProp(this.Index, Prop_Send, "m_bIsExtracted", value); }
    }

    property bool m_bUsingProgressTrigger {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_bUsingProgressTrigger") != 0 ? true : false; }
        public set(bool value)  { SetEntProp(this.Index, Prop_Send, "m_bUsingProgressTrigger", value); }
    }

    property bool m_bLevelTransition {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_bLevelTransition") != 0 ? true : false; }
        public set(bool value)  { SetEntProp(this.Index, Prop_Send, "m_bLevelTransition", value); }
    }

    property float m_flSpeedModifier {
        public get()            { return GetEntPropFloat(this.Index, Prop_Send, "m_flSpeedModifier"); }
        public set(float value) { SetEntPropFloat(this.Index, Prop_Send, "m_flSpeedModifier", value); }
    }

    property float m_flSpeedOverride {
        public get()            { return GetEntPropFloat(this.Index, Prop_Send, "m_flSpeedOverride"); }
        public set(float value) { SetEntPropFloat(this.Index, Prop_Send, "m_flSpeedOverride", value); }
    }

    property float m_flTriggerSpeedModifier {
        public get()            { return GetEntPropFloat(this.Index, Prop_Send, "m_flTriggerSpeedModifier"); }
        public set(float value) { SetEntPropFloat(this.Index, Prop_Send, "m_flTriggerSpeedModifier", value); }
    }

    property int m_ArmorValue {
        public get()            { return GetClientArmor(this.Index); }
        public set(int value)   { SetEntProp(this.Index, Prop_Send, "m_ArmorValue", value); }
    }

    /**
     * Control the firing rate.
     */
    property float m_flNextAttack {
        public get()            { return GetEntPropFloat(this.Index, Prop_Send, "m_flNextAttack"); }
        public set(float value) { SetEntPropFloat(this.Index, Prop_Send, "m_flNextAttack", value); }
    }

    /**
     * The body index
     *
     * @note Object bodygroup
     */
    property int m_nBody {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_nBody"); }
        public set(int value)   { SetEntProp(this.Index, Prop_Send, "m_nBody", value); }
    }

    /**
     * The skin index
     *
     * @note Texture group to use
     */
    property int m_nSkin {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_nSkin"); }
        public set(int value)   { SetEntProp(this.Index, Prop_Send, "m_nSkin", value); }
    }

    /**
     * The model index of an entity
     *
     * @note Object model index
     */
    property int m_nModelIndex {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_nModelIndex"); }
        public set(int value)   { SetEntProp(this.Index, Prop_Send, "m_nModelIndex", value); }
    }

    property int m_iMaxHealth {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_iMaxHealth"); }
        public set(int value)   { SetEntProp(this.Index, Prop_Send, "m_iMaxHealth", value); }
    }

    property int m_LastHitGroup {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_LastHitGroup"); }
        public set(int value)   { SetEntProp(this.Index, Prop_Send, "m_LastHitGroup", value); }
    }

    property int m_iFrags {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_iFrags"); }
        public set(int value)   { SetEntProp(this.Index, Prop_Send, "m_iFrags", value); }
    }

    property float m_flGravity {
        public get()            { return GetEntityGravity(this.Index); }
        public set(float value) { SetEntityGravity(this.Index, value); }
    }

    /**
     * Adds carried inventory weight.
     *
     * @note    这不是增加背包容量, 而是增加了玩家当前负重.
     */
    public void AddCarriedWeight(int weight) {
        __CheckClientValid(this.Index);
        char code[64];
        FormatEx(code, sizeof(code), "self.AddCarriedWeight(%d)", weight);
        SetVariantString(code);
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Drops one box of owned ammo, with parameter of ammo name (without ammobox_ prefix, e.g. '12gauge'). Returns success.
     */
    public bool Ammo_Drop(const char[] ammo) {
        __CheckClientValid(this.Index);
        char code[64];
        FormatEx(code, sizeof(code), "Ammo_Drop(\"%s\")", ammo);
        return RunEntVScriptBool(this.Index, code);
    }

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
    public void CancelSuicide(bool cancelAnimation) {
        __CheckClientValid(this.Index);
        char code[32];
        FormatEx(code, sizeof(code), "self.CancelSuicide(%s)", cancelAnimation ? "true" : "false");
        SetVariantString(code);
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Cancels active weapon throw.
     *
     * @note    似乎不起作用
     */
    public void CancelThrowDrop() {
        __CheckClientValid(this.Index);
        SetVariantString("self.CancelThrowDrop()");
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Resets viewmodel hands back to default.
     *
     * @note    没有测试条件
     */
    public void ClearHandModelOverride() {
        __CheckClientValid(this.Index);
        SetVariantString("self.ClearHandModelOverride()");
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Begins contemplating suicide.
     */
    public void ContemplateSuicide() {
        __CheckClientValid(this.Index);
        SetVariantString("self.ContemplateSuicide()");
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Returns the amount of times player has died.
     *
     * @note    与计分板的死亡数不同, 这应该是当前回合的死亡数, 相当于 m_iDeaths
     */
    public int DeathCount() {
        __CheckClientValid(this.Index);
        return this.m_iDeaths;
    }

    /**
     * Decrements active respawn tokens.
     */
    public void DecrementRespawnTokens() {
        __CheckClientValid(this.Index);
        SetVariantString("self.DecrementRespawnTokens()");
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Destroys all ammo that player owns.
     */
    public void DestroyAllAmmo() {
        __CheckClientValid(this.Index);
        SetVariantString("self.DestroyAllAmmo()");
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Destroys all weapons that player owns.
     */
    public void DestroyAllWeapons() {
        __CheckClientValid(this.Index);
        SetVariantString("self.DestroyAllWeapons()");
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Destroys all items that player owns.
     */
    public void DestroyEverything() {
        __CheckClientValid(this.Index);
        SetVariantString("self.DestroyEverything()");
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Does commit suicide.
     */
    public void DoCommitSuicide() {
        __CheckClientValid(this.Index);
        SetVariantString("self.DoCommitSuicide()");
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Drops all items that player owns.
     */
    public void DropEverything() {
        __CheckClientValid(this.Index);
        SetVariantString("self.DropEverything()");
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Enables / disables sprinting ability.
     */
    public native void EnableSprint(bool value);

    /**
     * 获取已有的弹药数量
     *
     *  1 - 9MM |  2 - 45ACP |  3 - 357  |  4 - 12Gauge |  5 - 22LR
     *  6 - 308 |  7 - 556   |  8 - 762  |  9 - Grenade | 10 - Molotov
     * 11 - TNT | 12 - Arrow | 13 - Fuel | 14 - Boards  | 15 - Flares
     */
    public int GetAmmoCarryCount(int element) {
        __CheckClientValid(this.Index);
        return GetEntProp(this.Index, Prop_Send, "m_iAmmo", _, element);
    }

    /**
     * Returns ammo inventory weight.
     *
     * @note 不包含投掷物（9，10，11）
     */
    public native int GetAmmoCarryWeight();

    /**
     * 获取当前手持武器的主弹夹弹药数
     *
     * @note 无效时返回 -1
     */
    public int GetActiveWeaponClip1() {
        __CheckClientValid(this.Index);
        int weapon = this.m_hActiveWeapon;
        if (!IsValidEntity(weapon))
            return -1;
        return GetEntProp(weapon, Prop_Send, "m_iClip1");
    }

    /**
     * 获取当前手持武器的备用弹夹弹药数
     *
     * @note 无效时返回 0
     */
    public int GetActiveWeaponClip2() {
        __CheckClientValid(this.Index);
        int weapon = this.m_hActiveWeapon;
        if (!IsValidEntity(weapon))
            return -1;

        int type = GetEntProp(weapon, Prop_Send, "m_iPrimaryAmmoType");
        if (type == -1)
            return 0;

        return this.GetAmmoCarryCount(type);
    }

    /**
     * Fills table with carried inventory items, including weapons and custom items (excl. passive items such as fists, zippo, and ammo).
     */
    // TODO
    // public native void GetCarriedItems(Handle handle);

    /**
     * Returns total carried inventory weight.
     */
    public int GetCarriedWeight() {
        __CheckClientValid(this.Index);
        return this._carriedWeight + this.GetAmmoCarryWeight();
    }

    /**
     * Returns the amount of stamina jumping costs.
     */
    public native float GetJumpStaminaCost();

    /**
     * Returns previous observer mode.
     */
    public native NMR_ObserverMode GetLastObserverMode();

    /**
     * Returns next respawn time for this player.
     */
    public float GetNextRespawnTime() {
        __CheckClientValid(this.Index);
        return this._nextRespawnTime;
    }

    /**
     * Returns max carried inventory weight.
     */
    public native int GetMaxCarriedWeight();

    /**
     * Returns next spawn attempt time for this player.
     */
    public float GetNextSpawnTryTime() {
        __CheckClientValid(this.Index);
        return RunEntVScriptFloat(this.Index, "GetNextSpawnTryTime()");
    }

    /**
     * Returns active speed modifier.
     */
    public float GetSpeedModifier() {
        __CheckClientValid(this.Index);
        return this.m_flSpeedModifier;
    }

    /**
     * Returns active speed override, -1.0 if none is applied.
     */
    public float GetSpeedOverride()  {
        __CheckClientValid(this.Index);
        return this.m_flSpeedOverride;
    }

    /**
     * Returns player stamina.
     */
    public float GetStamina() {
        __CheckClientValid(this.Index);
        return this.m_flStamina;
    }

    /**
     * Returns current weapon throw scale.
     */
    public float GetThrowScale() {
        __CheckClientValid(this.Index);
        float value = (GetGameTime() - this.m_flThrowDropTimer) * 2.0 / 3.0;
        if (value <= 0.25)  return 0.25;
        if (value >= 1.0)   return 1.0;
        return value;

    }

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
    public bool HasLeftoverWeight(int value) {
        __CheckClientValid(this.Index);
        return value <= this._carriedWeight + this.GetAmmoCarryWeight();
    }

    /**
     * Returns true if player owns walkie talkie.
     */
    public native bool HasWalkieTalkie();

    /**
     * Increases visual bloodiness.
     */
    public void IncreaseBloodiness() {
        __CheckClientValid(this.Index);
        SetVariantString("self.IncreaseBloodiness()");
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Increments active respawn tokens.
     */
    public void IncrementRespawnTokens() {
        __CheckClientValid(this.Index);
        SetVariantString("self.IncrementRespawnTokens()");
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Returns true is player is bleeding.
     */
    public bool IsBleedingOut() {
        __CheckClientValid(this.Index);
        return this._bleedingOut;
    }

    /**
     * Returns true when player is contemplating suicide.
     */
    public bool IsContemplatingSuicide() {
        __CheckClientValid(this.Index);
        return this._contemplatingSuicide;
    }

    /**
     * Returns true if player is ducking.
     */
    public bool IsDucking() {
        __CheckClientValid(this.Index);
        return this.m_fFlags & NMR_FL_DUCKING;
    }

    /**
     * Returns true if player is extracted.
     */
    public bool IsExtracted() {
        __CheckClientValid(this.Index);
        return this.m_bIsExtracted;
    }

    /**
     * Returns true if player is being grabbed by a zombie.
     */
    public bool IsGrabbed() {
        __CheckClientValid(this.Index);
        return RunEntVScriptBool(this.Index, "IsGrabbed()");
    }

    /**
     * Returns true if this player is a listen server host.
     */
    public bool IsHost() {
        __CheckClientValid(this.Index);
        return RunEntVScriptBool(this.Index, "IsHost()");
    }

    /**
     * Returns true if player is in level transition.
     */
    public bool IsInLevelTransition() {
        __CheckClientValid(this.Index);
        return this.m_bLevelTransition;
    }

    /**
     * Returns true if player is jumping.
     */
    public bool IsJumping() {
        __CheckClientValid(this.Index);
        return RunEntVScriptBool(this.Index, "IsJumping()");
    }

    /**
     * Returns true if player is experiencing blindness from vaccine side effects.
     */
    public bool IsPartialBlindnessActive() {
        __CheckClientValid(this.Index);
        return this.m_flPartialBlindnessEffectEnd > GetGameTime();
    }

    /**
     * Returns true if player is sprinting.
     */
    public bool IsSprinting() {
        __CheckClientValid(this.Index);
        return this.m_bIsSprinting;
    }

    /**
     * Returns true if player is talking without a walkie talkie.
     */
    public bool IsTalkingLocal() {
        __CheckClientValid(this.Index);
        return RunEntVScriptBool(this.Index, "IsTalkingLocal()");
    }

    /**
     * Returns true if player is talking with a walkie talkie.
     */
    public bool IsTalkingWalkie() {
        __CheckClientValid(this.Index);
        return this.m_bTalkingWalkie;
    }

    /**
     * Returns true if player is using a tool.
     */
    public bool IsUsingProgressTrigger() {
        __CheckClientValid(this.Index);
        return this.m_bUsingProgressTrigger;
    }

    /**
     * Returns true if player is vaccinated.
     */
    public bool IsVaccinated() {
        __CheckClientValid(this.Index);
        return this._vaccinated;
    }

    /**
     * Returns true when voice command timer has expired.
     */
    public bool IsVoiceCommandTimerExpired() {
        __CheckClientValid(this.Index);
        return RunEntVScriptBool(this.Index, "IsVoiceCommandTimerExpired()");
    }

    /**
     * Returns true if player is ready to respawn.
     */
    public bool ReadyToRespawn() {
        __CheckClientValid(this.Index);
        return RunEntVScriptBool(this.Index, "ReadyToRespawn()");
    }

    /**
     * Removes carried inventory weight.
     * Note: 似乎不起作用
     */
    public void RemoveCarriedWeight(int weight) {
        __CheckClientValid(this.Index);
        char code[64];
        FormatEx(code, sizeof(code), "self.RemoveCarriedWeight(%d)", weight);
        SetVariantString(code);
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Removes infection and bleeding.
     */
    public void RemoveInflictions() {
        __CheckClientValid(this.Index);
        SetVariantString("self.RemoveInflictions()");
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Resets active respawn tokens.
     */
    public void ResetRespawnTokens() {
        SetVariantString("self.ResetRespawnTokens()");
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Resets voice command cooldown timer.
     */
    public void ResetVoiceCommandTimer() {
        __CheckClientValid(this.Index);
        SetVariantString("self.ResetVoiceCommandTimer()");
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Returns active respawn token count.
     */
    public int RespawnTokenCount() {
        __CheckClientValid(this.Index);
    return RunEntVScriptInt(this.Index, "RespawnTokenCount()");
    }

    /**
     * Sets this player as extracted.
     */
    public void SetExtracted(bool value) {
        __CheckClientValid(this.Index);
        char code[32];
        FormatEx(code, sizeof(code), "self.SetExtracted(%s)", value ? "true" : "false");
        SetVariantString(code);
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Overrides viewmodel hands, with string parameter for model name.
     */
    public void SetHandModelOverride(const char[] model) {
        __CheckClientValid(this.Index);
        char code[PLATFORM_MAX_PATH];
        FormatEx(code, sizeof(code), "self.SetHandModelOverride(\"%s\")", model);
        SetVariantString(code);
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Sets timeout for idle auto-kick.
     */
    public void SetIdleTimeout(float time) {
        __CheckClientValid(this.Index);
        char code[64];
        FormatEx(code, sizeof(code), "self.SetIdleTimeout(%f)", time);
        SetVariantString(code);
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Makes the player ignore all fall damage.
     */
    public void SetIgnoreFallDamage(bool value) {
        __CheckClientValid(this.Index);
        char code[32];
        FormatEx(code, sizeof(code), "self.SetIgnoreFallDamage(%f)", value ? "true" : "false");
        SetVariantString(code);
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Sets next respawn time for this player.
     */
    public void SetNextRespawnTime(float time) {
        __CheckClientValid(this.Index);
        char code[64];
        FormatEx(code, sizeof(code), "self.SetNextRespawnTime(%f)", time);
        SetVariantString(code);
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Sets next spawn attempt time for this player.
     */
    public void SetNextSpawnTryTime(float time) {
        __CheckClientValid(this.Index);
        char code[64];
        FormatEx(code, sizeof(code), "self.SetNextSpawnTryTime(%f)", time);
        SetVariantString(code);
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Sets active respawn tokens, with boolean parameter if player should be notified.
     */
    public void SetRespawnTokens(int tokens, bool notify) {
        __CheckClientValid(this.Index);
        char code[PLATFORM_MAX_PATH];
        FormatEx(code, sizeof(code), "self.SetRespawnTokens(%d,%s)", tokens, notify ? "true" : "false");
        SetVariantString(code);
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Sets starting weapon when player spawns, with weapon classname, and ammo percent as integer.
     */
    public void SetSpawnWeapon(const char[] classname, int ammoPercent) {
        __CheckClientValid(this.Index);
        char code[128];
        FormatEx(code, sizeof(code), "self.SetSpawnWeapon(\"%s\",%d)", classname, ammoPercent);
        SetVariantString(code);
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Sets overall player speed modifier, applied last.
     */
    public void SetSpeedModifier(float value) {
        __CheckClientValid(this.Index);
        char code[64];
        FormatEx(code, sizeof(code), "self.SetSpeedModifier(%f)", value);
        SetVariantString(code);
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Overrides player speed to an absolute value, ignoring all modifiers.
     */
    public void SetSpeedOverride(float speed) {
        __CheckClientValid(this.Index);
        char code[64];
        FormatEx(code, sizeof(code), "self.SetSpeedOverride(%f)", speed);
        SetVariantString(code);
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Sets player stamina.
     */
    public void SetStamina(float stamina) {
        __CheckClientValid(this.Index);
        this.m_flStamina = stamina;
    }

    /**
     * Sets the state of player using a tool.
     */
    public void SetUsingProgressTrigger(bool value) {
        __CheckClientValid(this.Index);
        char code[64];
        FormatEx(code, sizeof(code), "self.SetUsingProgressTrigger(%s)", value ? "true" : "false");
        SetVariantString(code);
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Returns true if player should ignore fall damage.
     */
    public bool ShouldIgnoreFallDamage() {
        __CheckClientValid(this.Index);
        return RunEntVScriptBool(this.Index, "ShouldIgnoreFallDamage()");
    }

    /**
     * Stops bleeding.
     */
    public native void StopBleedingOut();

    /**
     * Throws all ammo that player owns.
     */
    public void ThrowAllAmmo() {
        __CheckClientValid(this.Index);
        SetVariantString("self.ThrowAllAmmo()");
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Throws all custom items that player owns.
     */
    public void ThrowAllCustomItems() {
        __CheckClientValid(this.Index);
        SetVariantString("self.ThrowAllCustomItems()");
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Throws all weapons that player owns.
     *
     * @note    丢弃后会导致视图武器为丢弃前手持的武器, 无法使用拳头
     */
    public void ThrowAllWeapons() {
        __CheckClientValid(this.Index);
        SetVariantString("self.ThrowAllWeapons()");
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

    /**
     * Tries a voice command, with boolean parameter for playing it regardless of cooldown.
     */
    public void VoiceCommand(int voice, bool cooldown) {
        __CheckClientValid(this.Index);
        char code[64];
        FormatEx(code, sizeof(code), "self.VoiceCommand(%d,%s)", voice, cooldown ? "true" : "false");
        SetVariantString(code);
        AcceptEntityInput(this.Index, "RunScriptCode");
    }

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

    public native void State_Transition(int state);

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
    public void GetVelocity(float velocity[3]) {
        __CheckClientValid(this.Index);
        GetEntPropVector(this.Index, Prop_Send, "m_vecVelocity", velocity);
    }

    /**
     * Sets the velocity.
     *
     * @param velocity          The velocity output.
     * @param stack             True will stack new velocity onto the player current velocity.
     *                          False will reset it.
     */
    public void SetVelocity(float velocity[3], bool stack=false) {
        __CheckClientValid(this.Index);
        if (stack)
        {
            float speed[3];
            this.GetVelocity(speed);
            AddVectors(speed, velocity, velocity);
        }
        TeleportEntity(this.Index, NULL_VECTOR, NULL_VECTOR, velocity);
    }

    /**
     * Gets the m_vecOrigin
     */
    public void GetOrigin(float position[3]) {
        __CheckClientValid(this.Index);
        GetEntPropVector(this.Index, Prop_Send, "m_vecOrigin", position);
    }

    public void SetOrigin(float position[3]) {
        __CheckClientValid(this.Index);
        SetEntPropVector(this.Index, Prop_Send, "m_vecOrigin", position);
    }

    /**
     * Gets the abs origin.
     * @note m_vecAbsOrigin
     *
     * @param position          The origin output.
     */
    public void GetAbsOrigin(float position[3]) {
        __CheckClientValid(this.Index);
        GetEntPropVector(this.Index, Prop_Send, "m_vecAbsOrigin", position);
    }

    public void SetAbsOrigin(float position[3]) {
        __CheckClientValid(this.Index);
        SetEntPropVector(this.Index, Prop_Send, "m_vecAbsOrigin", position);
    }

    /**
     * Gets the abs angle.
     * @note m_angAbsRotation
     *
     * @param angles             The angle output.
     */
    public void GetAbsAngles(float angles[3]) {
        __CheckClientValid(this.Index);
        GetEntPropVector(this.Index, Prop_Send, "m_angAbsRotation", angles);
    }

    public void SetAbsAngles(float angles[3]) {
        __CheckClientValid(this.Index);
        SetEntPropVector(this.Index, Prop_Send, "m_angAbsRotation", angles);
    }

    /**
     * Gets the abs velocity.
     * @note m_vecAbsVelocity
     *
     * @param velocity          The velocity output.
     */
    public void GetAbsVelocity(float velocity[3]) {
        __CheckClientValid(this.Index);
        GetEntPropVector(this.Index, Prop_Send, "m_vecAbsVelocity", velocity);
    }

    public void SetAbsVelocity(float velocity[3]) {
        __CheckClientValid(this.Index);
        SetEntPropVector(this.Index, Prop_Send, "m_vecAbsVelocity", velocity);
    }

    /**
     * Gets the max size vector.
     * @note m_vecMaxs
     *
     * @param maxs              The max size vector output.
     */
    public void GetMaxs(float maxs[3]) {
        __CheckClientValid(this.Index);
        GetClientMaxs(this.Index, maxs);
    }

    public void SetMaxs(float maxs[3]) {
        __CheckClientValid(this.Index);
        SetEntPropVector(this.Index, Prop_Send, "m_vecMaxs", maxs);
    }

    /**
     * Gets the min size vector.
     * @note m_vecMins
     *
     * @param mins              The max size vector output.
     */
    public void GetMins(float mins[3]) {
        __CheckClientValid(this.Index);
        GetClientMins(this.Index, mins);
    }

    public void SetMins(float mins[3]) {
        __CheckClientValid(this.Index);
        SetEntPropVector(this.Index, Prop_Send, "m_vecMins", mins);
    }

    /**
     * @note m_nOldButtons
     *
     * @return                  player old buttons.
     */
    public int GetOldButtons() {
        __CheckClientValid(this.Index);
        return GetEntProp(this.Index, Prop_Send, "m_nOldButtons");
    }

    public int SetOldButtons(int buttons) {
        __CheckClientValid(this.Index);
        GetEntProp(this.Index, Prop_Send, "m_nOldButtons", buttons);
    }

    /**
     * Gets the speed.
     */
    public float GetSpeed(bool ignoreVertical=false) {
        __CheckClientValid(this.Index);
        float velocity[3];
        this.GetVelocity(velocity);
        if (ignoreVertical)
            velocity[2] = 0.0;
        return GetVectorLength(velocity);
    }

    /**
     * 获取玩家距离 entity 的长度
     *
     * @return                  返回玩家距离 entity 的长度
     */
    public float GetEntityDistance(int entity) {
        __CheckClientValid(this.Index);
        float playerPosition[3];
        this.GetAbsOrigin(playerPosition);

        float entityPosition[3];
        GetEntPropVector(entity, Prop_Data, "m_vecAbsOrigin", entityPosition);
        return GetVectorDistance(playerPosition, entityPosition);
    }

    /**
     * @return                  True if character is infected.
     */
    public bool IsInfected() {
        __CheckClientValid(this.Index);
        return this.m_flInfectionTime != -1.0;
    }

    /**
     * Simple respawn.
     */
    public void RespawnPlayer() {
        __CheckClientValid(this.Index);
        ServerCommand("respawnplayer %d", this.UserId);
    }

    /**
     * Author   dysphie
     * url      https://github.com/dysphie/nmrih-guaranteedspawn/blob/2b06ceb48fb0146f72c947600b4661e802b07031/scripting/nmrih-guaranteedspawn.sp#L569
     *
     * @note check point entity class name: "info_player_nmrih"
     *
     * @param   target          The entity index to be force spawn near this entity.
     * @error   Invalid target.
     */
    public native void ForceSpawn(int target);

    public bool IsGenericAdmin() {
        __CheckClientValid(this.Index);
        return IsGenericAdmin(this.Index);
    }

    public void Freeze() {
        __CheckClientValid(this.Index);
        this.m_fFlags |= NMR_FL_FROZEN;
    }

    public void UnFreeze() {
        __CheckClientValid(this.Index);
        this.m_fFlags &= ~NMR_FL_FROZEN;
    }

    public bool IsFreeze() {
        __CheckClientValid(this.Index);
        return (this.m_fFlags & NMR_FL_FROZEN) != 0;
    }

    /**
     * Author   dysphie
     * url      https://github.com/dysphie/nmrih-team-healing/blob/c68dcc687c943be9927656e07f880e66e174651f/scripting/nmrih-team-healing.sp#L844
     */
    public void IncreaseAtControls() {
        __CheckClientValid(this.Index);
        this.m_fFlags |= NMR_FL_ATCONTROLS;
    }

    public void DecreaseAtControls() {
        __CheckClientValid(this.Index);
        this.m_fFlags &= ~NMR_FL_ATCONTROLS;
    }

    public bool IsAtControls() {
        __CheckClientValid(this.Index);
        return (this.m_fFlags & NMR_FL_ATCONTROLS) != 0;
    }
}


methodmap NMR_PlayerSpawn < NMR_Player {

    public NMR_PlayerSpawn(int player) {
        return view_as<NMR_PlayerSpawn>(NMR_Player(player));
    }

    property bool m_bEnabled {
        public get()            { return GetEntProp(this.Index, Prop_Send, "m_bEnabled", 1) != 0; }
        public set(bool value)  {        SetEntProp(this.Index, Prop_Send, "m_bEnabled", value, 1); }
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

static void __CheckClientValid(int player) {
    if (!IsValidClient(player))
        ThrowError("Invalid player index %d", player);
}
