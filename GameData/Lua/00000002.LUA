
------------------------------------------------------------
-- Constants
local STATETYPE_UNKNOWN	 = -1;
local STATETYPE_IDLE = 0;
local STATETYPE_MOVING = 1;
local STATETYPE_DEAD = 2;
local STATETYPE_JUMP = 3;
local STATETYPE_DIRECT_MOVING = 4;
local STATETYPE_DIRECT_JUMP = 5;

------------------------------------------------------------
-- 以毫秒為單位的休眠函式。
local function SleepInMilliseconds( nTimeMilliseconds )
	local nTime = nTimeMilliseconds / 100;
	Sleep( nTime );	-- 以 0.1 秒為單位。
	-- For debug.
	-- C_Msg( string.format( "SleepInMilliseconds(%d)", nTimeMilliseconds ) );
end

------------------------------------------------------------

-- 這個旗標必須是全域的，重點是不能放在 g_CurrentStage.Data 裡面。因為一
-- 旦 stage end，變數 g_CurrentStage.Data 就會變成別的關卡的資料。
local g_Task102_Stage2_bCompleted = false;

------------------------------------------------------------

-- 不會變的常數，即使 stage end 之後，還是會使用到。
local g_Stage2 =
{
	CheckPoints = 
	{
		-- 阻止玩家進入 Stage 3 的阻擋物件（Check Point）。
		BetweenStage2AndStage3 = 
		{
			nSpecialId =			205,									-- Stage2 與 Stage3 之間的阻擋物件。
		};
	};

	Triggers =
	{
		-- 走進這個區域，就啟動魔王的表演。
		BossArea =
		{
			nGroupId =				202,
		};

		-- Stage2 與 Stage3 之間的事件觸發區。	
		-- 能夠走到這個區域，表示已經通過檢查點完成，Stage 2。
		CompleteArea =
		{
			nGroupId =				206,
		};	
	};

};

------------------------------------------------------------
local function Task102_Stage2_NPC_Boss_Initialize( Task102_Stage2 )
	C_Msg( string.format("Task102_Stage2_NPC_Boss_Initialize()" ) );	-- For debug.

	Task102_Stage2.NPC.Boss =
	{
		nEntityId =					C_GetEntityIdBySpecialId(203),		-- Stage2 Boss: 毒氣兔兵
		bPerforming =				false,								-- true 表示正在表演中。
		bPerformed =				false,								-- true 表示已經表演過了。

		JumpInSource =				{ x = 2612, y = 2,  z =  220 },	-- 從場景外面的點起跳。
		JumpInTarget =				{ x = 2400, y = 10, z =  -50 },	-- 跳進場景中的馬路上。
		nJumpInDurationSeconds =	1.0,								-- 花幾秒鐘跳進場景中。

		MoveToLeaveTarget =			{ x = 2790, y = 10, z = -100 },	-- 離開完家視線。

		JumpOutTarget =				{ x = 3100, y = 10, z =  220 },	-- 跳離場景中的馬路，看起來像 Stage3 前進。
		nJumpOutDurationSeconds =	1.0,								-- 花幾秒鐘跳離場景。

		nAttackDeltaHP =			-20,								-- 魔王攻擊的損血量
	};

	-- 魔王落地時，地板裂開的樣子的物件。
	Task102_Stage2.NPC.BossGroundChink =
	{
		nEntityId =				C_GetEntityIdBySpecialId(204),		-- Stage2 地裂
	};
end

------------------------------------------------------------
local function Task102_Stage2_Trigger_Initialize( Task102_Stage2 )
	C_Msg( string.format("Task102_Stage2_Trigger_Initialize()" ) );	-- For debug.

	Task102_Stage2.Trigger = {};

	-- 開啟 Trigger。
	C_SetTriggerEnable( g_Stage2.Triggers.BossArea.nGroupId, true );		-- 開啟魔王表演區。
	C_SetTriggerEnable( g_Stage2.Triggers.CompleteArea.nGroupId, true );	-- 開啟 Stage2 結束偵測區。
end

------------------------------------------------------------
local function Task102_Stage2_NPC_Boss_Deactivate( Task102_Stage2 )
	C_Msg( string.format("Task102_Stage2_NPC_Boss_Deactivate()" ) );	-- For debug.

--	local Task102_Stage2 = g_CurrentStage.Data;
	local nBossEntityId = Task102_Stage2.NPC.Boss.nEntityId;
	C_SetShowNpc( nBossEntityId, 0 );
	C_SetFightable( nBossEntityId, 0 );
	C_SetRandomMove( nBossEntityId, 0 );

	C_EnableRandomMove( nBossEntityId, 0 );
	C_EnableFollowTarget( nBossEntityId, 0 );
	C_EnableSearchEnemy( nBossEntityId, 0 );
	C_EnableFightEnemy( nBossEntityId, 0 );

	C_SetNpcWalk( nBossEntityId, 0 );								-- IsWalkable = false. 因為要暫時移到場景外。
	local BossJumpInSource = Task102_Stage2.NPC.Boss.JumpInSource;	-- 從場景外面的點起跳。
	local BossJumpInTarget = Task102_Stage2.NPC.Boss.JumpInTarget;	-- 跳進場景中的馬路上。
	C_SetPosition( nBossEntityId, BossJumpInSource.x, BossJumpInSource.y, BossJumpInSource.z );

	-- 魔王地裂。
	local nBossGroundChinkEntityId = Task102_Stage2.NPC.BossGroundChink.nEntityId;
	-- C_Msg( string.format("nBossGroundChinkEntityId = %d", nBossGroundChinkEntityId ) );	-- For debug.
	C_SetShowNpc( nBossGroundChinkEntityId, 0 );					-- 隱藏地裂。
	C_SetNpcWalk( nBossGroundChinkEntityId, 1 );					-- 讓地裂貼著地表。
	C_SetPosition( nBossGroundChinkEntityId, BossJumpInTarget.x, BossJumpInTarget.y, BossJumpInTarget.z );	-- 地裂位置就在魔王落地的地方。
	C_SetPositionToGround( nBossGroundChinkEntityId );				-- 讓地裂貼著地表。
	-- 註：這裡如果執行 C_Move()，Game Client 會當掉。	(2008/01/31 by CakeChen)	
end

------------------------------------------------------------
-- @param nTargetEntityId
--   要讓魔王面對哪個物件的方向。
local function Task102_Stage2_NPC_Boss_Perform( nBossEntityId, nTargetEntityId )
	C_Msg( string.format("Task102_Stage2_NPC_Boss_Perform( nBossEntityId=%d, nTargetEntityId=%d )", nBossEntityId, nTargetEntityId ) );	-- For debug.

	if ( g_Task102_Stage2_bCompleted ) then
		C_Msg( "g_Task102_Stage2_bCompleted = " .. tostring(g_Task102_Stage2_bCompleted) );	-- For debug.
		return;
	end

	local Task102_Stage2 = g_CurrentStage.Data;

	Task102_Stage2.NPC.Boss.bPerforming = true;				-- 魔王表演開始。

	--local nBossEntityId = Task102_Stage2.NPC.Boss.nEntityId;
	local nBossGroundChinkEntityId = Task102_Stage2.NPC.BossGroundChink.nEntityId;

	-- C_Msg( string.format("Task102_Stage2_NPC_Boss_Perform( nBossEntityId=%d, nTargetEntityId=%d )", nBossEntityId, nTargetEntityId ) );	-- For debug.

	local BossJumpInSource = Task102_Stage2.NPC.Boss.JumpInSource;							-- 從場景外面的點起跳。
	local BossJumpInTarget = Task102_Stage2.NPC.Boss.JumpInTarget;							-- 跳進場景中的馬路上。
	local nBossJumpInDurationSeconds = Task102_Stage2.NPC.Boss.nJumpInDurationSeconds;		-- 花幾秒鐘跳進場景中。
	local BossMoveToLeaveTarget = Task102_Stage2.NPC.Boss.MoveToLeaveTarget;				-- 離開完家視線。
	local BossJumpOutTarget = Task102_Stage2.NPC.Boss.JumpOutTarget;						-- 跳往 Stage3 
	local nBossJumpOutDurationSeconds = Task102_Stage2.NPC.Boss.nJumpOutDurationSeconds;	-- 花幾秒鐘跳離場景。
	local nBossAttackDeltaHP = Task102_Stage2.NPC.Boss.nAttackDeltaHP;						-- 魔王攻擊的損血量

	-- C_LockUserControl( true );																		-- 關閉玩家的控制權。
	C_SetCheckPointEnable( g_Stage2.CheckPoints.BetweenStage2AndStage3.nSpecialId, true );	-- 讓玩家無法從 Stage 2 走入 Stage3。強迫玩家觀看表演。

	C_SetShowNpc( nBossGroundChinkEntityId, 0 );				-- 隱藏地裂。

	C_SetNpcWalk( nBossEntityId, 0 );							-- IsWalkable = false. 因為要暫時移到場景外。
	C_SetPosition( nBossEntityId, BossJumpInSource.x, BossJumpInSource.y, BossJumpInSource.z );
	C_SetShowNpc( nBossEntityId, 1 );							-- 魔王出現

	C_DirectJump( nBossEntityId, BossJumpInTarget.x, BossJumpInTarget.y, BossJumpInTarget.z, nBossJumpInDurationSeconds, 1 );
	-- 跳到目的之後，才繼續下面的程式。

	C_SetNpcWalk( nBossEntityId, 1 );							-- IsWalkable = true. 讓它正確站在地面上。
	C_Move( nBossEntityId, BossJumpInTarget.x, BossJumpInTarget.y, BossJumpInTarget.z, 1 );	-- 有移動，才能真的被拉到地表上。

	C_SetPosition( nBossGroundChinkEntityId, BossJumpInTarget.x, BossJumpInTarget.y, BossJumpInTarget.z );	-- 地裂位置就在魔王落地的地方。
	C_SetPositionToGround( nBossGroundChinkEntityId );			-- 讓地裂貼著地表。
	C_SetShowNpc( nBossGroundChinkEntityId, 1 );				-- 顯現地裂。

	C_PlayAnimation( nBossEntityId, 00009 );					-- 魔王站起來
	SleepInMilliseconds( 1500 );								-- 

	C_SetDirectionByTarget( nBossEntityId, nTargetEntityId );	-- 魔王轉向面對玩家。
	C_PlayAnimation( nBossEntityId, 00016 );					-- 普通攻擊：旋轉攻擊
	SleepInMilliseconds( 1500 );								-- 假設普通攻擊需要時間 1.5 秒鐘。
	-- C_AddHP( nTargetEntityId, nBossAttackDeltaHP / 2, 1 );		-- 對玩家稍為扣一點血。

	C_SetDirectionByTarget( nBossEntityId, nTargetEntityId );	-- 魔王轉向面對玩家。
	C_PlayAnimation( nBossEntityId, 01001 );					-- 特殊攻擊：噴吐毒霧
	SleepInMilliseconds( 2000 );								-- 假設普通攻擊需要時間 2 秒鐘。
	-- C_AddHP( nTargetEntityId, nBossAttackDeltaHP, 1 );			-- 對玩家稍為扣一點血。

	C_SetDirectionByTarget( nBossEntityId, nTargetEntityId );	-- 魔王轉向面對玩家。
	C_PlayAnimation( nBossEntityId, 00016 );					-- 普通攻擊：旋轉攻擊
	SleepInMilliseconds( 1500 );								-- 假設普通攻擊需要時間 1.5 秒鐘。
	-- C_AddHP( nTargetEntityId, nBossAttackDeltaHP / 2, 1 );		-- 對玩家稍為扣一點血。

	C_SetDirectionByTarget( nBossEntityId, nTargetEntityId );	-- 魔王轉向面對玩家。
	C_PlayAnimation( nBossEntityId, 01001 );					-- 特殊攻擊：噴吐毒霧
	SleepInMilliseconds( 2000 );								-- 假設普通攻擊需要時間 2 秒鐘。
	-- C_AddHP( nTargetEntityId, nBossAttackDeltaHP, 1 );			-- 對玩家稍為扣一點血。

	-- C_LockUserControl( false );								-- 在魔王開始逃跑之前，就打開（恢復）玩家的控制權。讓玩家想要追擊它。
	
	-- Move: delay_to_finished.
	C_Move( nBossEntityId, BossMoveToLeaveTarget.x, BossMoveToLeaveTarget.y, BossMoveToLeaveTarget.z, 1 );
	-- 等待移動到目的之後，才繼續下面的程式。

	C_SetNpcWalk( nBossEntityId, 0 );							-- IsWalkable = false. 因為要跳到場景外。
	C_DirectJump( nBossEntityId, BossJumpOutTarget.x, BossJumpOutTarget.y, BossJumpOutTarget.z, nBossJumpOutDurationSeconds, 1 );
	-- 跳到當時出來的地方之後，才繼續下面的程式。

	C_SetShowNpc( nBossEntityId, 0 );							-- 消失

	Task102_Stage2.NPC.Boss.bPerformed = true;					-- 有讓魔王全部表演完畢。
	Task102_Stage2.NPC.Boss.bPerforming = false;

--[[ !!! (2008/02/29 Remarked by CakeChen)	Moved to BecomeComplete().
--]]
	-- 關閉 Stage 2 與 Stage3 之間的阻擋物件。讓玩家可以走入 Stage 3。
	-- C_Msg( "CheckPoint23 nSpecialId = " .. g_Stage2.CheckPoints.BetweenStage2AndStage3.nSpecialId );
	C_SetCheckPointEnable( g_Stage2.CheckPoints.BetweenStage2AndStage3.nSpecialId, false );

--[[ !!! (2008/03/01 Remarked by CakeChen)
--]]
	-- 告訴 Game Server，這個 Game Client 的 stage2 魔王表演完畢了。	(2008/03/01 Added by CakeChen)
	local nMainPlayerEntityId = C_GetMainPlayerEntityId();
	C_RunServerScript( nMainPlayerEntityId, nil, "Task102_Stage2_OnClientBossPerformDone" );
end

------------------------------------------------------------
--
-- Should be called by RunScript().
function Task102_Stage2_NPC_Boss_Perform_ByRunScript()
	local nBossEntityId = OwnerID();		-- 魔王
	local nTargetEntityId = TargetID();	-- 玩家
	-- C_Msg( string.format("Task102_Stage2_NPC_Boss_Perform_ByRunScript( nBossEntityId=%d, nTargetEntityId=%d )", nBossEntityId, nTargetEntityId ) );	-- For debug.
	Task102_Stage2_NPC_Boss_Perform( nBossEntityId, nTargetEntityId );
	-- C_Msg( "Task102_Stage2_NPC_Boss_Perform_ByRunScript() completed. " );	-- For debug.
end

------------------------------------------------------------
-- 對指定編號的 Game Object 扣減血量，並且定時重複扣血。
local function HurtPeriodicallyForever( nOwnerId, nIntervalTimeMilliseconds, nDeltaHP )
	-- For debug.
	-- C_Msg( string.format( "HurtPeriodicallyForever( %d, %d, %d )", nOwnerId, nIntervalTimeMilliseconds, nDeltaHP ) );
	while true do
		C_AddHP( nOwnerId, nDeltaHP, 1 );
		SleepInMilliseconds( nIntervalTimeMilliseconds );
	end
end

------------------------------------------------------------
-- 進入毒霧區後，會啟動這個持續扣血的劇情。
function Task102_Stage2_HurtPeriodicallyForever_AfterEnterToxicFog()
	local nOwnerId = OwnerID();
	-- For debug.
	-- C_Msg( string.format("Task102_Stage2_HurtPeriodicallyForever_AfterEnterToxicFog( nOwnerId=%d )", nOwnerId ) );
	HurtPeriodicallyForever( nOwnerId, 2000, -10 );		-- 開始定時扣血。
end

------------------------------------------------------------
-- 進入毒霧區時，這個函式會被呼叫。
function Task102Stage2OnEnterToxicFog()
	local nOwnerId = OwnerID();
	-- C_Msg( string.format("Task102Stage2OnEnterToxicFog( nOwnerId=%d )", nOwnerId ) );	-- For debug.

--[[ (2008/02/29 Remarked by CakeChen) Moved to server side.
--	local nOwnerStateId = C_GetState( nOwnerId );
--	if ( nOwnerStateId == STATETYPE_JUMP ) then
		-- 如果是在跳躍的過程中撞進毒霧區，就不要啟動扣血。
		-- 因為它最後有可能因為找不到地板而被拉回其他地方。
		--
		-- 不過這樣做可能會造成取巧的不扣血操作技巧。
--	else
		C_RunScript( nOwnerId, nil, "Task102_Stage2_HurtPeriodicallyForever_AfterEnterToxicFog" );
--	end
--]]

	-- 如果進入毒霧區的人，是這個 Game Client 的主控玩家，才
	-- 幫它觸發 Game Server 端的扣血劇情。
	---
	-- (2008/03/04 Modified by CakeChen)	
	local nMainPlayerEntityId = C_GetMainPlayerEntityId();
	-- C_Msg( string.format("nOwnerId=%d, nMainPlayerEntityId=%d", nOwnerId, nMainPlayerEntityId ) );	-- For debug.
	if ( nOwnerId == nMainPlayerEntityId ) then
		C_RunServerScript( nOwnerId, nil, "Task102Stage2OnEnterToxicFog" );
	end
end

-- 離開毒霧區時，這個函式會被呼叫。
function Task102Stage2OnLeaveToxicFog()
	local nOwnerId = OwnerID();
	-- C_Msg( string.format("Task102Stage2OnLeaveToxicFog( nOwnerId=%d )", nOwnerId ) );	-- For debug.

-- (2008/02/29 Remarked by CakeChen) Moved to server side.
--	C_StopScript( nOwnerId, "Task102_Stage2_HurtPeriodicallyForever_AfterEnterToxicFog" );		-- 停止定時扣血。

	-- 如果離開毒霧區的人，是這個 Game Client 的主控玩家，才
	-- 幫它觸發 Game Server 端的停止扣血劇情。
	---
	-- (2008/03/04 Modified by CakeChen)	
	local nMainPlayerEntityId = C_GetMainPlayerEntityId();
	-- C_Msg( string.format("nOwnerId=%d, nMainPlayerEntityId=%d", nOwnerId, nMainPlayerEntityId ) );	-- For debug.
	if ( nOwnerId == nMainPlayerEntityId ) then
		C_RunServerScript( nOwnerId, nil, "Task102Stage2OnLeaveToxicFog" );	-- (2008/02/29 Modified by CakeChen)
	end
end

------------------------------------------------------------
function Task102_Stage2_Initialize( Task102_Stage2 )
	C_Msg( string.format("Task102_Stage2_Initialize()" ) );	-- For debug.

	-- 注意：
	-- 這裡不可執行 "Task102_Stage2 = {};" 這道敘述。因為它
	-- 會產生一個新的 table 物件，結果反而沒有初始化傳進來
	-- 的物件。

	g_Task102_Stage2_bCompleted = false;
	Task102_Stage2.NPC = {};
	Task102_Stage2_NPC_Boss_Initialize( Task102_Stage2 );
	Task102_Stage2_Trigger_Initialize( Task102_Stage2 );
	Task102_Stage2.bInitialized = true;
end

function Task102_Stage2_Start( Task102_Stage2 )
	C_Msg( string.format("Task102_Stage2_Start()" ) );	-- For debug.
	Task102_Stage2_NPC_Boss_Deactivate( Task102_Stage2 );
end

function Task102_Stage2_End( Task102_Stage2 )
	C_Msg( string.format("Task102_Stage2_End()" ) );	-- For debug.
end

function Task102_Stage2_Update( Task102_Stage2 )
	-- C_Msg( string.format("Task102_Stage2_Update()" ) );	-- For debug.
	local bStillRunningIfOne = 1;
	if ( g_Task102_Stage2_bCompleted ) then
		bStillRunningIfOne = 0;							-- 執行完成。
		C_Msg( string.format("Task102_Stage2_Update() completed." ) );	-- For debug.
	end
	-- C_Msg( string.format("bStillRunningIfOne = %d", bStillRunningIfOne ) );	-- For debug.
	return bStillRunningIfOne;
end

------------------------------------------------------------
-- 進入魔王（毒霧兔兵表演）區時，這個函式會被呼叫。
function Task102Stage2OnEnterBoss()
	local nOwnerId = OwnerID();	-- 應該會是玩家
	C_Msg( string.format("Task102Stage2OnEnterBoss( nOwnerId=%d )", nOwnerId ) );	-- For debug.

	if ( g_Task102_Stage2_bCompleted ) then
		C_Msg( "g_Task102_Stage2_bCompleted = " .. tostring(g_Task102_Stage2_bCompleted) );	-- For debug.
		return;
	end

	local Task102_Stage2 = g_CurrentStage.Data;

	-- C_Msg( "Task102_Stage2.NPC.Boss.bPerforming = " .. tostring(Task102_Stage2.NPC.Boss.bPerforming) );	-- For debug.
	-- C_Msg( "Task102_Stage2.NPC.Boss.bPerformed = "  .. tostring(Task102_Stage2.NPC.Boss.bPerformed)  );	-- For debug.
	if (	( not Task102_Stage2.NPC.Boss.bPerformed )				-- 不曾表演過
		and	( not Task102_Stage2.NPC.Boss.bPerforming  ) ) then	-- 而且也不是正在表演中
		-- 讓毒氣兔兵面對玩家的方向，表演一些動畫。
		do
			local nBossEntityId = Task102_Stage2.NPC.Boss.nEntityId;	-- 魔王
			local nTargetEntityId = nOwnerId;							-- 玩家
			-- (2008/02/29 Remarked by CakeChen) 移到 server 端的 script，向所有的 game client 發出這項表演。
			-- C_Msg( string.format("Call Task102_Stage2_NPC_Boss_Perform_ByRunScript( nBossEntityId=%d, nTargetEntityId=%d )", nBossEntityId, nTargetEntityId ) );	-- For debug.
			-- C_RunScript( nBossEntityId, nTargetEntityId, "Task102_Stage2_NPC_Boss_Perform_ByRunScript" );
			C_Msg( string.format("C_RunServerScript: Task102Stage2OnEnterBoss( nOwnerId=%d, nBossEntityId=%d )", nTargetEntityId, nBossEntityId ) );	-- For debug.
			C_RunServerScript( nTargetEntityId, nBossEntityId, "Task102Stage2OnEnterBoss" );	-- 透過 game server 廣播給所有 game client。	(2008/02/29 Modified by CakeChen)
		end
	else
		-- 已經表演過，或者已經在表演中，就不要重複表演。
	end
end

-- 離開魔王（毒霧兔兵表演）區時，這個函式會被呼叫。
function Task102Stage2OnLeaveBoss()
	local nOwnerId = OwnerID();
	C_Msg( string.format("Task102Stage2OnLeaveBoss( nOwnerId=%d )", nOwnerId ) );	-- For debug.

	if ( g_Task102_Stage2_bCompleted ) then
		C_Msg( "g_Task102_Stage2_bCompleted = " .. tostring(g_Task102_Stage2_bCompleted) );	-- For debug.
		return;
	end

	local Task102_Stage2 = g_CurrentStage.Data;
--[[ 離開魔王表演觸發區，不須終止魔王的表演。
	if ( Task102_Stage2.bInitialized ) then
		local nBossEntityId = Task102_Stage2.NPC.Boss.nEntityId;
		C_StopScript( nBossEntityId, "Task102_Stage2_NPC_Boss_Perform_ByRunScript" );	-- 停止魔王的演出。

		Task102_Stage2_NPC_Boss_Deactivate( Task102_Stage2 );	-- For debug.
	end
--]]
end

------------------------------------------------------------

-- 走進 Stage2 與 Stage3 之間的 CompleteArea 時，這個函式會被呼叫。
function Task102Stage2OnEnterCompleteArea()
	local nOwnerId = OwnerID();
	local nTargetId = TargetID();
	C_Msg( string.format("Task102Stage2OnEnterCompleteArea( nOwnerId=%d, nTargetId=%d )", nOwnerId, nTargetId ) );	-- For debug.

	if ( g_Task102_Stage2_bCompleted ) then
		C_Msg( "g_Task102_Stage2_bCompleted = " .. tostring(g_Task102_Stage2_bCompleted) );	-- For debug.
		return;
	end

	local Task102_Stage2 = g_CurrentStage.Data;

--[[!!! (2008/02/29 Remarked by CakeChen)	Moved to server-side.
	C_SetTriggerEnable( g_Stage2.Triggers.BossArea.nGroupId, false );		-- 關閉魔王表演區。
	C_SetTriggerEnable( g_Stage2.Triggers.CompleteArea.nGroupId, false );	-- 這個 Complete Area 只能被觸發一次。所以一進來，就關閉它。

	-- 能夠走進這裡，表示 Stage2 與 Stage3 之間的 check point 已經
	-- 被打開了。
	--
	-- 也就是說，玩家已經看完魔王的表演了。
	g_Task102_Stage2_bCompleted = true;
	-- C_Msg( string.format("g_Task102_Stage2_bCompleted = %s", tostring( g_Task102_Stage2_bCompleted ) ) );	-- For debug.
--]]

	-- 通知 Game Server，可以結束 Stage2 了。
	C_Msg( string.format("C_RunServerScript: Task102Stage2OnEnterCompleteArea( nOwnerId=%d )", nOwnerId ) );	-- For debug.
	C_RunServerScript( nOwnerId, nil, "Task102Stage2OnEnterCompleteArea" );	-- (2008/02/29 Added by CakeChen)
end

-- 離開 Stage2 與 Stage3 之間的 CompleteArea 時，這個函式會被呼叫。
function Task102Stage2OnLeaveCompleteArea()
	local nOwnerId = OwnerID();
	C_Msg( string.format("Task102Stage2OnLeaveCompleteArea( nOwnerId=%d )", nOwnerId ) );	-- For debug.

	if ( g_Task102_Stage2_bCompleted ) then
		C_Msg( "g_Task102_Stage2_bCompleted = " .. tostring(g_Task102_Stage2_bCompleted) );	-- For debug.
		return;
	end

end

------------------------------------------------------------

-- Game server 會在下列情況呼叫這個函式：
--   1) 有玩家在 stage 2 的 completed == false 時，觸發
--      CompleteArea 的進入事件，此時會呼叫所有玩家的這個函式。
-- 
--   2) 有玩家在 stage 2 的 completed == true 時，觸發魔王區
--      的進入事件（表示該玩家才剛剛新加入遊戲室）時，呼叫該
--      玩家的這個函式。
function Task102_Stage2_BecomeComplete()
	local nOwnerId = OwnerID();
	local nTargetId = TargetID();
	C_Msg( string.format("Task102_Stage2_BecomeComplete( nOwnerId=%d, nTargetId=%d )", nOwnerId, nTargetId ) );	-- For debug.

	if ( g_Task102_Stage2_bCompleted ) then
		C_Msg( "g_Task102_Stage2_bCompleted = " .. tostring(g_Task102_Stage2_bCompleted) );	-- For debug.
		return;
	end

	C_SetTriggerEnable( g_Stage2.Triggers.BossArea.nGroupId, false );		-- 關閉魔王表演區。
	C_SetTriggerEnable( g_Stage2.Triggers.CompleteArea.nGroupId, false );	-- 關閉關卡完成區。

	-- 關閉 Stage 2 與 Stage3 之間的阻擋物件。讓玩家可以走入 Stage 3。
	-- C_Msg( "CheckPoint23.nSpecialId = " .. g_Stage2.CheckPoints.BetweenStage2AndStage3.nSpecialId );
	C_SetCheckPointEnable( g_Stage2.CheckPoints.BetweenStage2AndStage3.nSpecialId, false );

	-- 不論這個玩家是否已經看完（或看到）魔王的表演，總之這個關卡結束了，可以進入下一關。
	g_Task102_Stage2_bCompleted = true;
end

------------------------------------------------------------
