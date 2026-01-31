--目前系統時間
G_System_Current_Time = 0;
--
G_System_TaskPool = {};

--

function L_UpdateTaskPool( CurrentTime)
	local RemoveTask = {};
	--local nCount =0;
	--C_Msg ("Run L_UpdateTaskPool");
	for I,V  in pairs (G_System_TaskPool) do
		--C_Msg ("G_System_TaskPool For Loop");
		if (V.Time < CurrentTime) then
			--C_Msg ("執行時間到"..V.Time);
			--for J , K in pairs (V.Task) do
				if V.DoSomeThing ~= nil then
					V.DoSomeThing( V.Data , CurrentTime )
				else
					C_Msg ("V.Task.DoSomeThing = nil("..I..")");
				end
			--end
			--table.insert ( RemoveTask , I );
			--C_Msg ("RemoveTask Add ("..nCount..")");
			V.Remove  = true;
		end
		--nCount = nCount + 1;
	end
	
	--[[
	if nCount > 0 then
		C_Msg ("For Loop Count "..nCount);
	end
	--]]
	
	for I,V in pairs ( G_System_TaskPool ) do
		if V.Remove == true then
			--C_Msg ("table.remove ("..I..")");
			--table.remove ( G_System_TaskPool , I );
			G_System_TaskPool[I] = nil;
		end
	end
end
-- 建立新的工作項目
-- ExeTime 何時執行
-- DoFunction 做什麼事
-- InData 而外傳入的參數
function L_CreateTask( ExeTime , DoWhat , InData)
	local OnTime = G_System_Current_Time + ExeTime;
	
	
	-- 新增一筆工作項目
	local NewTask =		{	Time = OnTime ,
							DoSomeThing = DoWhat[1] ,
							Data = InData ,
							Remove = false
						}
	
	table.insert(G_System_TaskPool,NewTask);
	
end
-- 遊戲使用的MainLoop
function Default_Client_Lua_Script()
	G_System_TaskPool = {};
	Client_Initialize_Script()
	while true do
		L_UpdateTaskPool( G_System_Current_Time );
		Sleep(1);
		G_System_Current_Time = G_System_Current_Time + 1;
	end
end

--任務成功的底圖
function DisplaySuccessPic()
	local picd01 = C_ShowAutoScalePicAnmByUV  ( 4043 , 
												0.5  , 0.31,
												0 ,
												0 ,
												2 , 
												1 , 
												0 , 
												0.5  , 0.31,
												0.5 , 0.3 , true);
	Sleep(60);
	
	C_ClosePic(picd01)
end
--
--任務失敗的底圖
function DisplayFailPic()
	local picd01 = C_ShowAutoScalePicAnmByUV  ( 4044 , 
												0.5  , 0.31,
												0 ,
												0 ,
												2 , 
												1 , 
												0 , 
												0.5  , 0.31,
												0.5 , 0.3 , true);
	Sleep(60);
	
	C_ClosePic(picd01)
end			
-- 等在影片播完
function L_WaitMoviePlaying()
	while C_IsMoviePlaying() == true do
		Sleep(1)
	end
end
-------------------------------------------------------------------------------
-- 當玩家升級時發動
function Default_Client_LevelUp_Lua_Script()
	local Level = TargetID()
	DoLevelUpNotify( Level )
end
