--=============================================================================
-- Client 端 Script 測試使用
--=============================================================================
function FirstMove()
  Sleep(50);		---停5秒鐘
  local Id = OwnerID();
  local x,y,z;
  TestMove();
end
--=============================================================================
function TestMove()
  local Id = OwnerID();
  local x,y,z;
  x,y,z = C_Position(Id);
  local direction;
  local Distance;
  local SleepTime;
  local NowState;
  while true do
	  direction = math.random(0,3);
	  SleepTime = math.random(1,3) * 10;
	  Distance = math.random(50,100);
	  -- Idle時才移動
	  NowState = C_GetState(Id);
	  	
	  if NowState == 0 then 
	 	  if direction == 0 then
		  	C_Move(Id,x+Distance,0,z);
		  elseif direction == 1 then
		  	C_Move(Id,x-Distance,0,z);
		  elseif direction == 2 then
		  	C_Move(Id,x,0,z+Distance);
		  elseif direction == 3 then
		  	C_Move(Id,x,0,z-Distance);
		  end
	  end
	  Sleep(SleepTime);
  end
end
--=============================================================================
function FollowMe()
  local OId = OwnerID();
  local TId = TargetID();

	
  local x,y,z;

  while true do
	  x,y,z = C_Position(OId);
	  C_Move(TId,x,y,z);
	  Sleep(10);
  end
	
end
--=============================================================================
function InitialMap()
	local ObjCount;
	ObjCount = C_GetAllEntityId();
	for K,V in pairs (ObjCount) do
		C_RunScript(V,V,"TestMove");
		C_RunScript(V,V,"TestJump");
	end
end
--=============================================================================
function TestDirectMove()
  local OId = OwnerID();
	C_SetNpcWalk(OId,0);
	C_SetPosition(OId,0,0,300);
	C_DirectMove(OId,0,0,-80,0,0,1);
	C_SetNpcWalk(OId,1);
	C_Msg("Direct Move Finish!!");
end
--=============================================================================
function TestJump()
  local OId = OwnerID();
	C_PlayAnimation(OId,4);
	C_Jump(OId);
end
--=============================================================================
function TestChangePxEntity()
	local OId = OwnerID();
	Sleep(50);
	C_ChangePxEntity(OId, "MOBS_3");
end
--=============================================================================
function TestDeleteFromWorld()
	local OId = OwnerID();
	C_ChangePxEntity(OId, "MOBS_3");
	Sleep(50);
	C_DeleteFromWorld(OId);
end
--=============================================================================
function TestDirectJump()
	local OId = OwnerID();
	local X,Y,Z;
	C_SetNpcWalk(OId,0);
	X,Y,Z = C_GetPosition(OId);
	C_DirectJump(OId,X-50,Y,Z,5,1)
	C_Msg("123455");
end 
--=============================================================================
function TestScale()
	local OId = OwnerID();
	C_SetScale(OId,0.5,30);
	Sleep(300)
	C_SetScale(OId,2.0,30);
end
--=============================================================================
function TestPlayAnm()
	local OId = OwnerID();
	C_PlayAnimation(OId,29);
	Sleep(30);
	C_PlayAnimation(OId,30);
end
--=============================================================================
function TestShowPicAnm()
	local PicId 
	-- = C_ShowPic( 1001 , 128 , 128 , 1001 , 512 , 512 , 3 , 3 , 3 , 3 );
	--Sleep(50);
	--C_ClosePic( PicId );

	PicId = C_ShowPicAnm( 2001 , 128 , 128 , 0 , 100 , 1 ,4 , 1 , 512 , 512 , 3 , 3 , 3 , 3 ,true);
	Sleep(50);
	C_ClosePic( PicId );
	
--[[
	for i = 1,3,1 do
		for j = 1,3,1 do
			C_ShowPicAnm( 2001 , 128 , 128 , 0 , 100 , 1 ,4 , 1001 , 512 , 512 , i , j , 3 , 3,true );
			Sleep(50);
			C_ClosePic();
		end
	end
--]]	
end
--=============================================================================
function Test()
	local InputTest={1,2,4,8,16,32};
	for i=1,6,1 do
		C_WaitingInputState( InputTest[i] ,100);
		local bInput = C_GetInputState();
		if bInput == true then
			C_Msg ( "輸入完成"..i ); 
		end
	end
end
--=============================================================================
function TestCreatePlayer()
	local Pos ={}
	Pos[1],Pos[2],Pos[3] = C_GetPosition(OwnerID());
	local EQ = {0,0,0,0,0,0,0,0};
	local PlayerId = C_CreateClientPlayer ( 1 , Pos[1],Pos[2],Pos[3], 4 , "Test" , 3.0 ,unpack(EQ));
	Sleep(50);
	C_DestroyClientObj( PlayerId );
end
--=============================================================================
function TestPortraitDialog()
	C_PortraitDialog(100 , -64 ,false,false,"<H3>Hello !!</H3>");
	C_PortraitDialog(101 , -64 ,false,true,"<H3>How Are You ?</H3>");
	C_PortraitDialog(100 , -64 ,false,false,"<H3>Fine !</H3>");
end
--=============================================================================
function TestHUDMessage()
	C_HUDMessage("<H3>Hello !!</H3>");
end
--=============================================================================
function TestLuaTask ()
	--local f = {fun=TestHUDMessage};
	--f.fun();
	L_CreateTask(50 , {TestHUDMessage} , 111);
end
--=============================================================================
--測試NPC對話盒
function TestNPCDialog ()
	for i= 1,3 do
		C_OpenOptionUIDialog(OwnerID(),"抬頭字串","內文字串"..i,"選項1","選項2","選項3","選項4","選項5")
		
		local AnswerId = C_GetOptionUIDialogResult()
		
		if (AnswerId < 0) then
			C_HUDMessage ("取消選擇")
		else
			C_HUDMessage ("選擇第"..AnswerId.."項")
		end
	end
end
--=============================================================================
EQArray = {
			{
				Hat = 	{1,9 ,25,41,61,77,93},
				Torso = {2,10,26,42,62,78,94},
				Pelvis ={3,11,27,43,63,79,95},
				Weapon ={4,12,28,44,64,80,96}
			},
			{
				Hat = 	{329,337,353,369,389,405,421},
				Torso = {330,338,354,370,390,406,422},
				Pelvis ={331,339,355,371,391,407,423},
				Weapon ={332,340,356,372,392,408,424}
			},
			{
				Hat =	{657,665,681,697,717,733,749},
				Torso = {658,666,682,698,718,734,750},
				Pelvis ={659,667,683,699,719,735,751},
				Weapon ={660,668,684,700,720,736,752}
			},
			{
				Hat =	{985,993,1009,1025,1045,1061,1077},
				Torso = {986,994,1010,1026,1046,1062,1078},
				Pelvis ={987,995,1011,1027,1047,1063,1079},
				Weapon ={988,996,1012,1028,1048,1064,1080}
			},
			{
				Hat =	{1666,1674,1690,1706,1726,1742,1758},
				Torso = {1667,1675,1691,1707,1727,1743,1759},
				Pelvis ={1668,1676,1692,1708,1728,1744,1760},
				Weapon ={1669,1677,1693,1709,1729,1745,1761}
			},
			{
				Hat =	{1994,2002,2018,2034,2054,2070,2086},
				Torso = {1995,2003,2019,2035,2055,2071,2087},
				Pelvis ={1996,2004,2020,2036,2056,2072,2088},
				Weapon ={1997,2005,2021,2037,2057,2073,2089}
			},
			{
				Hat =	{2322,2330,2346,2362,2382,2398,2414},
				Torso = {2323,2331,2347,2363,2383,2399,2415},
				Pelvis ={2324,2332,2348,2364,2384,2400,2416},
				Weapon ={2325,2333,2349,2365,2385,2401,2417}
			},
			{	
				Hat =	{2650,2658,2674,2690,2710,2726,2742},
				Torso = {2651,2659,2675,2691,2711,2727,2743},
				Pelvis ={2652,2660,2676,2692,2712,2728,2744},
				Weapon ={2653,2661,2677,2693,2713,2729,2745}
			}
		}

--=============================================================================
function TestPlayerDemo()
	local Pos ={5890,0,630}
	--Pos[1],Pos[2],Pos[3] = C_GetPosition(OwnerID());
	local Direction = C_GetDirection( OwnerID() );
	local distanceX = 100
	local distanceZ = 80
	local TotalPlayer = {}
	local offset = 0
	for i,EQData in pairs ( EQArray ) do
		if (i > 0) then
			TotalPlayer[i]= {}
			if (EQData ~= nil ) then
				if offset == 0 then
					offset = distanceX / 2
				else
					offset = 0
				end
			
				local MaxCount = 0

				if MaxCount < table.getn(EQData.Hat) then
					MaxCount = table.getn(EQData.Hat)
				end

				if MaxCount < table.getn(EQData.Torso) then
					MaxCount = table.getn(EQData.Torso)
				end

				if MaxCount < table.getn(EQData.Pelvis) then
					MaxCount = table.getn(EQData.Pelvis)
				end

				if MaxCount < table.getn(EQData.Weapon) then
					MaxCount = table.getn(EQData.Weapon)
				end
				
				for j = 1 , MaxCount , 1 do
					local Hat,Torso,Pelvis,Weapon;
					if EQData.Hat[j] ~= nil then
						Hat = EQData.Hat[j]
					else
						Hat = 0
					end
					if EQData.Torso[j] ~= nil then
						Torso = EQData.Torso[j]
					else
						Torso = 0
					end
					if EQData.Pelvis[j] ~= nil then
						Pelvis = EQData.Pelvis[j]
					else
						Pelvis = 0
					end
					if EQData.Weapon[j] ~= nil then
						Weapon = EQData.Weapon[j]
					else
						Weapon = 0
					end
					
					local newPlayer = C_CreateClientPlayer ( i , 
											offset +Pos[1] + distanceX * (j-1) , Pos[2] , Pos[3] + distanceZ * (i-1), 4 ,
											"" ,
											0.8 ,
											Hat,
											Torso,
											Pelvis,
											Weapon
											)
					table.insert( TotalPlayer[i] , newPlayer )
				end
										
			end
		--Sleep(5);
		end
	end

	local animations = { 8030 ,8040}
	for k = 1 ,50 ,1 do
		for i, v in pairs ( TotalPlayer ) do
			local rId = math.random(1,2)
			for j , ObjId in pairs ( v ) do
				C_PlayAnimation ( ObjId , animations[rId] )
			end
			Sleep(8)
		end
	end
	
	Sleep(10*30);
	--Sleep(100);
	for i , v in pairs ( TotalPlayer ) do
		for j , vv in pairs ( v ) do
			C_DestroyClientObj( vv )
		end
	end
end
--=============================================================================
function TestPlayerDemo1()
	local x,y,z = C_GetPosition(OwnerID())
	local dir = C_GetDirection(OwnerID())
	local CharacterId = TargetID()
	local Hat = 0
	local Torso = 0
	local Pelvis = 0
	local Weapon = 0
	
	C_CreateClientPlayer ( CharacterId , 
							x,y,z ,dir ,
							"" ,
							1.0 ,
							EQArray[CharacterId].Hat[1],
							EQArray[CharacterId].Torso[1],
							EQArray[CharacterId].Pelvis[1],
							EQArray[CharacterId].Weapon[1]
							)	
end
