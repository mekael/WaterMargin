--=============================================================================
 function Stage1_Initialize(Stage_Data)
--[[	
	Stage_Data.RabbitSoldierPrototype = {};
	Stage_Data.bBornRabbit = false;
	Stage_Data.nSoldierCount = 5;
	Stage_Data.SightPrototype = {};
	Stage_Data.BatteryPrototype = {};
	Stage_Data.MagmaPrototype ={};
	Stage_Data.Battery ={};
	Stage_Data.RabbitSoldier ={};
 
	--先把所有NPC的關連串起來
	--記錄所有NPC原型
	for i =1,3 do
		Stage_Data.RabbitSoldierPrototype[i] = {};
		Stage_Data.RabbitSoldierPrototype[i].Id = C_GetEntityIdBySpecialId(100 + i);
		C_DeleteFromWorld(Stage_Data.RabbitSoldierPrototype[i].Id);
	end
	
	--記錄準星原型
	Stage_Data.SightPrototype[1] = {Id = C_GetEntityIdBySpecialId(104)};	--準星
	C_DeleteFromWorld(Stage_Data.SightPrototype[1].Id);						-- 隱藏
	
	--記錄砲台原型
	Stage_Data.BatteryPrototype[1] = {Id = C_GetEntityIdBySpecialId(105)};		--砲台
	C_DeleteFromWorld(Stage_Data.BatteryPrototype[1].Id);						-- 隱藏
	--記錄岩漿
	Stage_Data.MagmaPrototype[1] = {Id = C_GetEntityIdBySpecialId(107)};
	
	C_Msg("初始化完畢");
--]]	
end
--=============================================================================
-- 關卡開始
function Stage1_Start(Stage_Data)
--[[
	Stage_Data.bBornRabbit = true;
	Stage_Data.nSoldierCount = 1; -- 產生兔兵

	--C_SetFightable(Stage_Data.MagmaPrototype[1].Id , 0);
	--C_EnableRandomMove(Stage_Data.MagmaPrototype[1].Id , 0);
	--C_EnableFollowTarget(Stage_Data.MagmaPrototype[1].Id , 0);
	--C_EnableSearchEnemy(Stage_Data.MagmaPrototype[1].Id , 0);
	--C_EnableFightEnemy(Stage_Data.MagmaPrototype[1].Id , 0);

	-- 建立砲塔
	local Pos;
	Pos = {X=383;Y=4;Z=127;};
	Stage_Data.Battery[1] = {Id = CreateBattery(Stage_Data.BatteryPrototype[1].Id,Pos)};
	Pos = {X=540;Y=4;Z=150;};
	Stage_Data.Battery[2] = {Id = CreateBattery(Stage_Data.BatteryPrototype[1].Id,Pos)};
	Pos = {X=455;Y=10;Z=8;};
	Stage_Data.Battery[3] = {Id = CreateBattery(Stage_Data.BatteryPrototype[1].Id,Pos)};
	Stage_Data.BatteryCount = 3;
--	Pos = {X=563;Y=2;Z=-59;};
--	Stage_Data.Battery[4] = {Id = CreateBattery(Stage_Data.BatteryPrototype[1].Id,Pos)};
--	Pos = {X=396;Y=2;Z=-130;};
--	Stage_Data.Battery[5] = {Id = CreateBattery(Stage_Data.BatteryPrototype[1].Id,Pos)};
	-- 開啟 CheckPoint
--]]	
end
--=============================================================================
-- 關卡開始
function Stage1_Update(Stage_Data)
--[[
	if Stage_Data.nSoldierCount <= 0 then
		Stage_Data.bBornRabbit = false;
		Stage_Data.nSoldierCount = math.random(1,5);
	end
	
	if Stage_Data.bBornRabbit == false then
		local Box = {minX = -130 ;minY = 0; minZ = -280; maxX = 150 ; maxY = 0;maxZ = -60;};
		
		Stage1_CreateRabbitSoldier(Stage_Data.RabbitSoldierPrototype 
						, Stage_Data.nSoldierCount
						, Box);
			
		Stage_Data.bBornRabbit = true;
	end
	
	if (Stage_Data.BatteryCount == 0 ) then
		return 0;
	end
--]]	
	return 1;
end
--=============================================================================
-- 關卡結束
function Stage1_End(Stage_Data)
end
--=============================================================================

--建立所有NPC
function Stage1_CreateRabbitSoldier(RabbitSoldierPrototype , SoldierCount , Range)
--[[
	local RabbitSoldier={};
	-- 產生
	for i =1,SoldierCount,1 do 
		RabbitSoldier[i] = C_CreateNPC(RabbitSoldierPrototype[math.random(1,3)].Id
										,math.random(Range.minX,Range.maxX)
										,math.random(Range.minY,Range.maxY)
										,math.random(Range.minZ,Range.maxZ));
		C_SetDieScript(RabbitSoldier[i],"Stage1_SoldierDeath");
		local x,y,z = C_GetReSpawnPoint(RabbitSoldier[i]);
		C_SetReSpawnPoint(RabbitSoldier[i],x,y,z);
		C_AddToWorld(RabbitSoldier[i]);
		Sleep(20);
	end
--]]	
end

function Stage1_SoldierDeath()
--[[
	g_CurrentStage.Data.nSoldierCount = g_CurrentStage.Data.nSoldierCount -1;
--]]	
end
--=============================================================================
function Stage1EnterTrigger1()
	--- 啟動產生兔子兵
--[[	if g_CurrentStage.Data ~= nil then
		g_CurrentStage.Data.bBornRabbit = false;
		local x,y,z;
		x,y,z = C_GetPosition(OwnerID());
		C_SetReSpawnPoint(OwnerID(),x,y,z);
		C_Msg("啟動產生兔子兵");
	end
--]]	
	C_RunServerScript(OwnerID(),TargetID(),"Stage1EnterTrigger1");
end
--=============================================================================
function Stage1LeaveTrigger1()
	--關閉 Trigger
	--C_SetTriggerEnable(100,false);
	C_RunServerScript(OwnerID(),TargetID(),"Stage1LeaveTrigger1");
end
--=============================================================================
-- 岩漿事件
function Stage1EnterTrigger2()
	local OId = OwnerID();
	--C_AddHP(OId,-10,1);
	--C_DirectJump(OId,631,2,-96,0.5,0,1);
	C_RunServerScript(OwnerID(),TargetID(),"Stage1EnterTrigger2");
end
--=============================================================================
function Stage1LeaveTrigger2()
	local OId = OwnerID();
	C_StopScript(OId,[[Stage1EnterTrigger2]]);
end
--=============================================================================
-- 建立砲台NPC
function CreateBattery(Id,Pos)
--[[
	local BatteryID = C_CreateNPC(Id	,Pos.X	,Pos.Y	,Pos.Z);
	C_EnableRandomMove(BatteryID , 0);
	C_EnableFollowTarget(BatteryID , 0);
	C_EnableSearchEnemy(BatteryID , 0);
	C_EnableFightEnemy(BatteryID , 0);
	C_AddToWorld(BatteryID);
	C_RunScript (BatteryID,BatteryID ,"BatterySearchPlayer");
	C_PlayAnimation(BatteryID,29);
	C_SetDieScript(BatteryID,"Battery_Death");
	return BatteryID;
--]]
	return -1;
end
--=============================================================================
function BatterySearchPlayer ()
--[[
	local X,Y,Z;
	local sX,sY,sZ;
	local OId = OwnerID();
	
	local LockTarget = false;
	local Bindex,FireTime,Battery;

	
	--- 取得砲台資料
	for K,V in pairs (g_CurrentStage.Data.Battery) do
		if V.Id == OId then
			Battery = V;
			break;
		end
	end

	Battery.bFired = false;	--是否已經開砲
	Battery.nCooltime = 0;	--砲管冷卻時間
	Battery.BulletId = 0;	--子彈編號
	
	while true do
		X,Y,Z = C_GetPosition(1);
		sX,sY,sZ = C_GetPosition(OId);
		local Distance = math.sqrt((sX-X)*(sX-X)+(sY-Y)*(sY-Y)+(sZ-Z)*(sZ-Z));
		--- 進入射程
		if (Distance < 300) then
			C_SetDirectionByTarget(OId,1);
			
			-- 決定開砲，冷卻時間歸零，無子彈存在
			if (math.random(1,10) < 8) and (Battery.nCooltime < 0) and (Battery.BulletId == 0) then
				-- 播放開砲動作
				C_PlayAnimation(Battery.Id,16);	
				-- 產生準新物件
				Sleep(10);
				local Pos ={X=X,Y=Y,Z=Z};
				Battery.BulletId =CreateSight (OId,g_CurrentStage.Data.SightPrototype[1].Id,Pos);
				-- 加入砲塔冷卻時間
				Battery.nCooltime = 100;
			end
		end
		
		Sleep(10);
		Battery.nCooltime = Battery.nCooltime - 10;
	end
--]]	
end
--=============================================================================
function Battery_Death()
--[[
	if (g_CurrentStage.Data.BatteryCount == 1) then
		local X,Y,Z;
		X,Y,Z = C_GetPosition(g_CurrentStage.Data.MagmaPrototype[1].Id);
		--- 岩漿下降
		for i = 0,40,1 do
			C_SetPosition(g_CurrentStage.Data.MagmaPrototype[1].Id , X , Y-i , Z);
			Sleep(1);
		end
		--C_DeleteFromWorld(g_CurrentStage.Data.MagmaPrototype[1].Id);
		C_SetTriggerEnable(101,false);
		C_SetCheckPointEnable(106,false);
	end
	g_CurrentStage.Data.BatteryCount = g_CurrentStage.Data.BatteryCount - 1;
--]]	
end

function Stage1LeaveTrigger3()
end
--=============================================================================
-- 砲管升起
function Stage1EnterTrigger3()
--[[
	for K,V in pairs (g_CurrentStage.Data.Battery) do
		C_PlayAnimation(V.Id,30);
	end
	--關閉 Trigger
	C_SetTriggerEnable(102,false);
	C_Msg("砲抬頭");
--]]	
	C_RunServerScript(OwnerID(),TargetID(),"Stage1EnterTrigger3");
end
--=============================================================================
function CreateSight(OId,Id,Pos)
--[[
	local SightId = C_CreateNPC (Id,Pos.X,Pos.Y,Pos.Z);
	C_SetNpcWalk (SightId,1);
	C_AddToWorld(SightId);
	C_SetFightable(SightId , 0);
	C_SetShowHPLabel(SightId , 0);
	C_RunScript(SightId,OId,"Sight_Update");
	return	SightId;
--]]	
end
--=============================================================================
-- 定時更新檢查
function Sight_Update()
--[[
	local OId,TId;
	OId = OwnerID();
	TId = TargetID();
	local LiveTime = math.random(3,5) * 10;
	C_SetFollowTarget(OId,1);
	C_Msg("鎖定玩家");
	Sleep(LiveTime);
	-- 換成快速準星
	C_ChangePxEntity(OId,"MOBS_14");
	C_SetNpcWalk (OId,1);
	LiveTime = math.random(2,4) * 10;
	C_EnableFollowTarget(OId , 0);
	Sleep(5);
	---進行爆炸特效
	C_ChangePxEntity(OId,"MOBS_15");
	C_PlayAnimation(OId,00016);
	C_UseSkill(OId,1001301);
	local X,Y,Z = C_GetPosition(OId);
	--- 產生地面破損NPC
	Sleep(5);
	local GroundId = C_CreateNPC (g_CurrentStage.Data.SightPrototype[1].Id,X,Y,Z);
	C_ChangePxEntity(GroundId,"MOBS_16");
	C_SetNpcWalk (GroundId,1);
	C_AddToWorld(GroundId);
	C_SetFightable(GroundId , 0);
	Sleep(5);

	--Sleep(5);
	--C_ChangePxEntity(OId,"MOBS_16");
	
	for K,V in pairs (g_CurrentStage.Data.Battery) do
		if  V.BulletId == OId then
			V.BulletId = 0;
			break;
		end
	end

	C_DeleteFromWorld(OId);
	C_AddHP(OId,-C_GetHP(OId),0);
	C_AddHP(GroundId,-C_GetHP(GroundId),0);
--]]	
end
--=============================================================================
function MagmaDown()
	local Id = C_GetEntityIdBySpecialId(107);
	local X,Y,Z = C_GetPosition(Id);
	--- 岩漿下降
	for i = 0,50,1 do
		C_SetPosition(Id , X , Y-i , Z);
		Sleep(1);
	end
end