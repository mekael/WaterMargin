
function Stage3_Initialize(Stage_Data)
--------------------------
----------------初始化資料
--------------------------
Stage_Data.allRabbitDie = 0;---判斷是不是所有的兔子都死了
Stage_Data.Stage3_DoorChange = 0; -----判斷是不是換門了
Stage_Data.Stage3_FightRabbitSoldier = {};----所以戰鬥用兔子的記錄
------ 下面用來記錄出生地
Stage_Data.Stage3_RabbitSoldierInPostion = {};
Stage_Data.Stage3_RabbitSoldierInPostion[1]= {};
Stage_Data.Stage3_RabbitSoldierInPostion[1].x= 3159;
Stage_Data.Stage3_RabbitSoldierInPostion[1].y= 18;
Stage_Data.Stage3_RabbitSoldierInPostion[1].z= 138;

Stage_Data.Stage3_RabbitSoldierInPostion[2]= {};
Stage_Data.Stage3_RabbitSoldierInPostion[2].x= 3273;
Stage_Data.Stage3_RabbitSoldierInPostion[2].y= 29;
Stage_Data.Stage3_RabbitSoldierInPostion[2].z= 223;

Stage_Data.Stage3_RabbitSoldierInPostion[3]= {};
Stage_Data.Stage3_RabbitSoldierInPostion[3].x= 3396;
Stage_Data.Stage3_RabbitSoldierInPostion[3].y= 18;
Stage_Data.Stage3_RabbitSoldierInPostion[3].z= 156;

Stage_Data.Stage3_RabbitSoldierInPostion[4]= {};
Stage_Data.Stage3_RabbitSoldierInPostion[4].x= 2829;
Stage_Data.Stage3_RabbitSoldierInPostion[4].y= 0;
Stage_Data.Stage3_RabbitSoldierInPostion[4].z= 364;


Stage_Data.Stage3_RabbitSoldierInPostion[5]= {};
Stage_Data.Stage3_RabbitSoldierInPostion[5].x= 2893;
Stage_Data.Stage3_RabbitSoldierInPostion[5].y= -3;
Stage_Data.Stage3_RabbitSoldierInPostion[5].z= 370;

Stage_Data.Stage3_RabbitSoldierInPostion[6]= {};
Stage_Data.Stage3_RabbitSoldierInPostion[6].x= 2978;
Stage_Data.Stage3_RabbitSoldierInPostion[6].y= 6;
Stage_Data.Stage3_RabbitSoldierInPostion[6].z= 351;

Stage_Data.Stage3_RabbitSoldierInPostion[7]= {};
Stage_Data.Stage3_RabbitSoldierInPostion[7].x= 2684;
Stage_Data.Stage3_RabbitSoldierInPostion[7].y= 6;
Stage_Data.Stage3_RabbitSoldierInPostion[7].z= -27;

Stage_Data.Stage3_RabbitSoldierInPostion[8]= {};
Stage_Data.Stage3_RabbitSoldierInPostion[8].x= 2658;
Stage_Data.Stage3_RabbitSoldierInPostion[8].y= 6;
Stage_Data.Stage3_RabbitSoldierInPostion[8].z= -103;


Stage_Data.Stage3_RabbitSoldierInPostion[9]= {};
Stage_Data.Stage3_RabbitSoldierInPostion[9].x= 2708;
Stage_Data.Stage3_RabbitSoldierInPostion[9].y= 6;
Stage_Data.Stage3_RabbitSoldierInPostion[9].z= -170;

Stage_Data.Stage3_RabbitSoldierInPostion[10]= {};
Stage_Data.Stage3_RabbitSoldierInPostion[10].x= 2973;
Stage_Data.Stage3_RabbitSoldierInPostion[10].y= 1;
Stage_Data.Stage3_RabbitSoldierInPostion[10].z= -78;

Stage_Data.Stage3_RabbitSoldierInPostion[11]= {};
Stage_Data.Stage3_RabbitSoldierInPostion[11].x= 2995;
Stage_Data.Stage3_RabbitSoldierInPostion[11].y= 1;
Stage_Data.Stage3_RabbitSoldierInPostion[11].z= -182;


Stage_Data.Stage3_RabbitSoldierInPostion[12]= {};
Stage_Data.Stage3_RabbitSoldierInPostion[12].x= 2935;
Stage_Data.Stage3_RabbitSoldierInPostion[12].y= 1;
Stage_Data.Stage3_RabbitSoldierInPostion[12].z= -128;



-------下面用來記錄要走到哪

Stage_Data.Stage3_RabbitSoldierOutPostion = {};
Stage_Data.Stage3_RabbitSoldierOutPostion[1]= {};
Stage_Data.Stage3_RabbitSoldierOutPostion[1].x= 3338;
Stage_Data.Stage3_RabbitSoldierOutPostion[1].y= 4;
Stage_Data.Stage3_RabbitSoldierOutPostion[1].z= -141;

Stage_Data.Stage3_RabbitSoldierOutPostion[2]= {};
Stage_Data.Stage3_RabbitSoldierOutPostion[2].x= 3238;
Stage_Data.Stage3_RabbitSoldierOutPostion[2].y= 4;
Stage_Data.Stage3_RabbitSoldierOutPostion[2].z= -108;

Stage_Data.Stage3_RabbitSoldierOutPostion[3]= {};
Stage_Data.Stage3_RabbitSoldierOutPostion[3].x= 3404;
Stage_Data.Stage3_RabbitSoldierOutPostion[3].y= 4;
Stage_Data.Stage3_RabbitSoldierOutPostion[3].z= -118;



Stage_Data.Stage3_RabbitSoldierOutPostion[4]= {};
Stage_Data.Stage3_RabbitSoldierOutPostion[4].x= 2887;
Stage_Data.Stage3_RabbitSoldierOutPostion[4].y= 4;
Stage_Data.Stage3_RabbitSoldierOutPostion[4].z= -64;


Stage_Data.Stage3_RabbitSoldierOutPostion[5]= {};
Stage_Data.Stage3_RabbitSoldierOutPostion[5].x= 2935;
Stage_Data.Stage3_RabbitSoldierOutPostion[5].y= 4;
Stage_Data.Stage3_RabbitSoldierOutPostion[5].z= -64;

Stage_Data.Stage3_RabbitSoldierOutPostion[6]= {};
Stage_Data.Stage3_RabbitSoldierOutPostion[6].x= 2874;
Stage_Data.Stage3_RabbitSoldierOutPostion[6].y= 4;
Stage_Data.Stage3_RabbitSoldierOutPostion[6].z= -64;

Stage_Data.Stage3_RabbitSoldierOutPostion[7]= {};
Stage_Data.Stage3_RabbitSoldierOutPostion[7].x= 2874;
Stage_Data.Stage3_RabbitSoldierOutPostion[7].y= 4;
Stage_Data.Stage3_RabbitSoldierOutPostion[7].z= -113;

Stage_Data.Stage3_RabbitSoldierOutPostion[8]= {};
Stage_Data.Stage3_RabbitSoldierOutPostion[8].x= 2946;
Stage_Data.Stage3_RabbitSoldierOutPostion[8].y= 4;
Stage_Data.Stage3_RabbitSoldierOutPostion[8].z= -113;

Stage_Data.Stage3_RabbitSoldierOutPostion[9]= {};
Stage_Data.Stage3_RabbitSoldierOutPostion[9].x= 3163;
Stage_Data.Stage3_RabbitSoldierOutPostion[9].y= 4;
Stage_Data.Stage3_RabbitSoldierOutPostion[9].z= -78;

Stage_Data.Stage3_RabbitSoldierOutPostion[10]= {};
Stage_Data.Stage3_RabbitSoldierOutPostion[10].x= 3241;
Stage_Data.Stage3_RabbitSoldierOutPostion[10].y= 4;
Stage_Data.Stage3_RabbitSoldierOutPostion[10].z= -141;

Stage_Data.Stage3_RabbitSoldierOutPostion[11]= {};
Stage_Data.Stage3_RabbitSoldierOutPostion[11].x= 3148;
Stage_Data.Stage3_RabbitSoldierOutPostion[11].y= 4;
Stage_Data.Stage3_RabbitSoldierOutPostion[11].z= -182;


Stage_Data.Stage3_RabbitSoldierOutPostion[12]= {};
Stage_Data.Stage3_RabbitSoldierOutPostion[12].x= 3080;
Stage_Data.Stage3_RabbitSoldierOutPostion[12].y= 4;
Stage_Data.Stage3_RabbitSoldierOutPostion[12].z= -140;


Stage_Data.bFirstHit = 0;
Stage_Data.nBossState = 0;
Stage_Data.bEnterTri = 0;
----------------------------
--------上面是用來初始化資料
----------------------------



	Stage_Data.allRabbitDie = 0;---判斷是不是所有的兔子都死了
	Stage_Data.Stage3_DoorChange = 0; -----判斷是不是換門了
	Stage_Data.bFirstHit = 0;
	Stage_Data.nBossState = 0;
	local Stage3_RabbitSoldier = {};
	
	Stage_Data.Stage3_Door = C_CreateNPC(9,3690,34,-118,1);			---城門
	C_SetNpcWalk(Stage_Data.Stage3_Door,0);
	C_AddToWorld(Stage_Data.Stage3_Door);
	
	C_SetShowNpc(Stage_Data.Stage3_Door,0);
	C_SetFightable(Stage_Data.Stage3_Door,0);
end

function Stage3_DoorFight()	
	if g_CurrentStage.Data.bFirstHit == 0 then
		C_SetFightable(g_CurrentStage.Data.Stage3_Door,0); -----打了第一下之後，開始劇情
		--C_SetTriggerEnable(300,true);
		g_CurrentStage.Data.bFirstHit = 1; 
		C_PlayMusic(2);
		
	end
	
	if g_CurrentStage.Data.Stage3_DoorChange == 0 then	 				---城門變身
		
	 	if C_GetHP(g_CurrentStage.Data.Stage3_Door) < (C_GetMaxHP(g_CurrentStage.Data.Stage3_Door)/2) then 
		 	C_ChangePxEntity(g_CurrentStage.Data.Stage3_Door, "MOBS_10");
			g_CurrentStage.Data.Stage3_DoorChange = 1;
		end 
	end 	
end 

function Stage3_Start(Stage_Data)
	C_PlayMusic(1);
	local Stage3_state = 0;
	C_SetFightable(Stage_Data.Stage3_Door,1); ------門一開始是可以打的
	C_SetShowNpc(Stage_Data.Stage3_Door,1);
	C_SetFightable(Stage_Data.Stage3_Door,1);
	
	C_Msg("Stage3_Start!!!");
	C_SetReSpawnPoint(0,2757,2,-145);
	while true do
		if Stage_Data.bFirstHit == 1 then 
			
			if Stage3_state == 0 then ----準備生出快樂的無雙小兔子
				C_Msg("Stage3_SpawnFightRabbit!!!");
				Stage3_SpawnFightRabbit();
				Stage3_state = 1;	
			end
			
			
			if Stage3_state == 1 then 
				Stage3_CheckAllRabbitDie();
				if Stage_Data.allRabbitDie == 1 then 
					C_Msg("兔子死光了!!!");
					C_SetFightable(Stage_Data.Stage3_Door,1);
					--C_SetTriggerEnable(300,false);
					Sleep(100);
					C_SetFightable(Stage_Data.Stage3_Door,0);
					--C_SetTriggerEnable(300,true);
					Stage3_state = 0;
				end 
			end 
			if C_GetIsDie(Stage_Data.Stage3_Door) == 1 then 
				--C_SetTriggerEnable(300,false);
				Stage3_state = 2;
				break; 
			end 
			
		end
		Sleep(10); 
	
	end 
end 
function Stage3_CheckAllRabbitDie()
	g_CurrentStage.Data.allRabbitDie = 1;
	for i = 1,9 do 
		if C_GetIsDie(g_CurrentStage.Data.Stage3_FightRabbitSoldier[i]) == 0 then 
			g_CurrentStage.Data.allRabbitDie = 0;
			C_Msg("兔子沒死光吆!!!");
			break; 
		end 
		
	end 
end 

function Stage3_SpawnFightRabbit()
	local Stage3_RabbitSoldier = {};
	Stage3_RabbitSoldier[1] = 91;		---白兔
	Stage3_RabbitSoldier[2] = 92;		---黃兔
	Stage3_RabbitSoldier[3] = 93;		---粉紅兔
	for  i = 1 ,9 do 
		g_CurrentStage.Data.Stage3_FightRabbitSoldier[i]= C_CreateNPC(Stage3_RabbitSoldier[math.random(1,3)],g_CurrentStage.Data.Stage3_RabbitSoldierInPostion[i].x,g_CurrentStage.Data.Stage3_RabbitSoldierInPostion[i].y,g_CurrentStage.Data.Stage3_RabbitSoldierInPostion[i].z,1);
		C_SetFightable(g_CurrentStage.Data.Stage3_FightRabbitSoldier[i],0);
		C_SetNpcWalk(g_CurrentStage.Data.Stage3_FightRabbitSoldier[i],0);
		C_AddToWorld(g_CurrentStage.Data.Stage3_FightRabbitSoldier[i]);
		C_SetShowNpc(g_CurrentStage.Data.Stage3_FightRabbitSoldier[i],1);
	end 
	
	Sleep(10);
	for  i = 1 ,9 do 
		--C_DirectMove(g_CurrentStage.Data.Stage3_FightRabbitSoldier[i],g_CurrentStage.Data.Stage3_RabbitSoldierOutPostion[i].x,g_CurrentStage.Data.Stage3_RabbitSoldierOutPostion[i].y,g_CurrentStage.Data.Stage3_RabbitSoldierOutPostion[i].z,0,0);
		C_RunScript(g_CurrentStage.Data.Stage3_FightRabbitSoldier[i],g_CurrentStage.Data.Stage3_FightRabbitSoldier[i],"Stage3_FightRabbitMove");
	end
end 


function Stage3_FightRabbitMove()

  	local OId = OwnerID();
	for i = 1,3 do 
		if OId == g_CurrentStage.Data.Stage3_FightRabbitSoldier[i] then 
			----C_PlayAnimation(OId,4);
			Sleep(math.random(1,10));
			C_DirectJump(OId,g_CurrentStage.Data.Stage3_RabbitSoldierOutPostion[i].x,g_CurrentStage.Data.Stage3_RabbitSoldierOutPostion[i].y,g_CurrentStage.Data.Stage3_RabbitSoldierOutPostion[i].z,(math.random(5,10)*0.1),1);
		end 
	end 
  	for i = 4,9 do 
		if OId == g_CurrentStage.Data.Stage3_FightRabbitSoldier[i] then 
			C_DirectMove(OId,g_CurrentStage.Data.Stage3_RabbitSoldierOutPostion[i].x,g_CurrentStage.Data.Stage3_RabbitSoldierOutPostion[i].y,g_CurrentStage.Data.Stage3_RabbitSoldierOutPostion[i].z,0,0,1);
			break; 
		end 
	end 
	
	C_SetNpcWalk(OId,1);
	C_SetFightable(OId,1);
	local Getid = C_GetPlayerIdByRandom( OId )
	C_SetFightTarget(OId,Getid);
	C_SetFollowTarget(OId,Getid);	
	
	
	
end

function Stage3_BossComing()
	--Sleep(15);		---Boss毒氣兔兵
	C_PlayMusic(3);
	local Stage3_NowBoss = C_CreateNPC(5,3826,5,-131,1);
	C_SetNpcWalk( Stage3_NowBoss,0);
	C_SetFightable(Stage3_NowBoss,0);
	C_AddToWorld( Stage3_NowBoss );
	Sleep(5);
	---C_DirectMove(Stage3_NowBoss,Stage3_RabbitSoldierOutPostion[1].x,Stage3_RabbitSoldierOutPostion[1].y,Stage3_RabbitSoldierOutPostion[1].z,0,0,1);
	--C_SetNpcWalk(Stage3_NowBoss,1);
	--C_SetFightTarget(Stage3_NowBoss,0);
	--C_SetFollowTarget(Stage3_NowBoss,0);
	C_RunScript(Stage3_NowBoss,Stage3_NowBoss,"Stage3_CallBossRun");
	C_RunScript(Stage3_NowBoss,Stage3_NowBoss,"Stage3_CheckBossStage");
end 
function Stage3_CallBossRun()
	local OId = OwnerID();
	C_Msg("胖子該走囉!!!");
	C_DirectMove(OId,3238,1,-108,0,0,1);
	C_Msg("胖子走完了!!!");
	C_SetNpcWalk(OId,1);
	C_SetFightable(OId,1);
	local Getid = C_GetPlayerIdByRandom( OId )
	C_SetFightTarget(OId,Getid);
	C_SetFollowTarget(OId,Getid);
	
		
	
	
end 
function Stage3_CheckBossStage()
	g_CurrentStage.Data.nBossState = 0;
	local OId = OwnerID();
	local x,y,z;
	while true do
		if  g_CurrentStage.Data.nBossState == 1 then 	
			C_SetNpcWalk(OId,0);	
			C_EnableFightEnemy(OId,0);
			C_EnableSearchEnemy(OId,0);
			C_EnableFollowTarget(OId,0);
			C_EnableRandomMove(OId,0);
			local nRandomSkill = math.random(1,2);
			C_SetFightable(OId,0);
			C_Msg("胖子不可以打!!!");
			Sleep(10);
			if nRandomSkill == 1 then 
				----for i = 1,4 do 
					local Getid = C_GetPlayerIdByRandom( OId )
					x,y,z = C_GetPositionOnGround(Getid);
					C_SetDirectionByTarget( OId, Getid );
					C_UseSkillToTarget(OId,x,y,z,1000504);
					--C_UseSkill(OId,1000504);
					Sleep(12);
					--C_DeleteFromWorld(OId);
					C_SetShowNpc(OId,0);
					
					
					C_SetPosition(OId,x,y,z);
					Sleep(8);
					--C_AddToWorld(OId);
					C_SetShowNpc(OId,1);
					
					---Sleep(10);
					C_PlayAnimation( OId, 01006 );
					Sleep(12);				
				-------end 
			end 
			if nRandomSkill == 2 then 
				local Getid2 = C_GetPlayerIdByRandom( OId )
				C_SetDirectionByTarget( OId, Getid2 );
				x,y,z = C_GetPositionOnGround(Getid2);
				C_UseSkill(OId,1000503);
				---C_UseSkillToTarget(OId,x,y,z,1000503);
				Sleep(32);
				
			end 
			C_SetFightable(OId,1);
			C_Msg("胖子可以打!!!");
			----C_EnableFightEnemy(OId,1);
			---C_EnableSearchEnemy(OId,1);
			---C_EnableFollowTarget(OId,1);
			---C_EnableRandomMove(OId,1);
			
			
			if C_GetIsDie(OId) == 1 then 
				break; 
			end 			
		end 
		
		Sleep(25);
	end 
end 
function Stage3_CheckBossBold()
	local OId = OwnerID();
	if C_GetHP(OId) < (C_GetMaxHP(OId)/2) then 
		Sleep(10)
		g_CurrentStage.Data.nBossState = 1;
	end 
	
end 
function Stage3_BossDead()
	g_CurrentStage.Data.nBossState = 999;
	local OId = OwnerID();
	C_SetScale(OId,0.5,5);
end 

function Stage3_Update(Stage_Data)
	if Stage_Data.nBossState == 999 then 
		return 0;
	else  
		return 1;
	end   
end 
function Stage3_End(Stage_Data)
	Stage_Data.Stage3_RabbitSoldierOutPostion = {};
	Stage_Data.Stage3_RabbitSoldierInPostion = {};
	Stage_Data.Stage3_FightRabbitSoldier = {};
end



-- 對指定編號的 Game Object 扣減血量，並且定時重複扣血。
local function HurtPeriodicallyForever( nOwnerId, nIntervalTime, nDeltaHP )
	while true do
		C_AddHP( nOwnerId, nDeltaHP, 1 );
		Sleep( nIntervalTime );
	end
end

------------------------------------------------------------
-- 進入電網區後，會啟動這個持續扣血的劇情。
function Stage3_HurtPeriodicallyForever()
	local nOwnerId = OwnerID();
	HurtPeriodicallyForever( nOwnerId, 5, -500 );		-- 開始定時扣血。
end

------------------------------------------------------------
-- 進入電網區時，這個函式會被呼叫。
function Stage3EnterTri()
	------local nOwnerId = OwnerID();
	-------C_RunScript( nOwnerId, nil, "Stage3_HurtPeriodicallyForever" );
end

-- 離開電網區時，這個函式會被呼叫。
function Stage3LeaveTri()
	------local nOwnerId = OwnerID();
	-------C_StopScript( nOwnerId, "Stage3_HurtPeriodicallyForever" );		-- 停止定時扣血。
end
function TestCutSceneServer()
	local nOwnerId = OwnerID();
	C_RunAllClientScript( nOwnerId,nOwnerId,"TestCutSceneClient");
	Sleep(150);
end 
function TestCutSceneClient()
	C_SetCameraStepData(0.249561, 0.000000, 0.968376, 0.000000 ,-0.317515,0.944738,0.081826,0.000000,-0.914848,-0.327887,0.235766,0.000000,341.357971,259.819397,-62.354614,1.000000,45,0,0);
	C_SetPlayCutScene(1);
	C_Msg("第一次!!!");
	
	C_SetCameraStepData(0.772574, 0.000000, -0.634994, 0.000000 ,0.395996,0.781774,0.481795,0.000000,0.496402,-0.623649,0.603955,0.000000,824.485779,596.685608,-304.744476,1.000000,70,5000,1);	
	Sleep(50);

	
	
	C_Msg("第二次");
	
	C_SetCameraStepData(0.509212, 0.000000, -0.860701, 0.000000 ,0.381894,0.896238,0.225938,0.000000,0.771356,-0.443723,0.456354,0.000000,1954.130005,347.368408,-110.219559,1.000000,45,15000,1);
	Sleep(100);
	
	
	C_Msg("第三次");
	Sleep(50);

	C_SetPlayCutScene(0);
end 
function TestCutSceneClose()
	C_SetPlayCutScene(0);
end 
