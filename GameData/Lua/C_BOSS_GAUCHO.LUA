G_Client_gaucho_ObjId = 0

function gaucho_Position1()     
	G_Client_gaucho_ObjId = TargetID()--接收由sever傳來的判克物件編號
	C_RunScript (-1 , -1, "gaucho_Position_Check")
end
function gaucho_Position_Check()
	while true do
		--C_HUDMessage ("高球機器人 = "..G_Client_gaucho_ObjId)
		--local GId = TargetID();
		--C_HUDMessage ("高球機器人2 = "..GId)
		local gaucho_x1 , gaucho_y1 , gaucho_z1 = C_GetPosition(G_Client_gaucho_ObjId)	
		if gaucho_x1 ~= nil then 
			Sleep(1)
			local gaucho_x2 , gaucho_y2 , gaucho_z2 = C_GetPosition(G_Client_gaucho_ObjId)
			if gaucho_x2 ~= nil then 
				Sleep(1)
				local gaucho_Position_x = (gaucho_x1-gaucho_x2)*(gaucho_x1-gaucho_x2) 
				local gaucho_Position_y = (gaucho_y1-gaucho_y2)*(gaucho_y1-gaucho_y2) 
				local gaucho_Position_z = (gaucho_z1-gaucho_z2)*(gaucho_z1-gaucho_z2) 
				--C_HUDMessage ("高球機器人移動  x = "..gaucho_Position_x.." y = "..gaucho_Position_y.." z = "..gaucho_Position_z)
				if ((gaucho_Position_x > 0) or (gaucho_Position_y > 0) or (gaucho_Position_z > 0)) then 
					C_RunScript (-1 , -1, "SkillCamShock_run")
					--print ("高球機器人走路震動")
				end
				
				if ((gaucho_Position_x == 0) and (gaucho_Position_y == 0) and (gaucho_Position_z == 0)) then 
					C_RunScript (OwnerID() , TargetID(), "SkillCamShock_stop")
					--print ("高球機器人停止震動")
				end
			end 
		end 
		Sleep(1)
	end
end
function gaucho_cutscene()
	local gaucho_Id = C_CreateClientNPC (50316, 0,0,0 , 4);
	C_LockUserControl( true );--把玩家鎖定
	C_SetCameraStepData(0.982763, 0.000000, -0.184952, 0.000000 ,-0.015100,0.996681,-0.080238,0.000000,0.184335,0.081646,0.979485,0.000000,-205.235840,45.623650,-1154.803223,1.000000,
						45 , 0 , 0);
	C_SetPlayCutScene(1);
	Sleep(10);
	C_PlayAnimation ( gaucho_Id, 8010 );
	Sleep(20);
	C_SetPlayCutScene(0);
	C_DestroyClientObj ( gaucho_Id )
	C_LockUserControl( false );--把玩家解開
	local gaucho_Message = C_GetStringFromPreset( 8260001 )--魔王停止攻擊30秒
	C_HUDMessage (gaucho_Message )
	Sleep(200)
	local gaucho_Message = C_GetStringFromPreset( 8260002 )--魔王停止攻擊10秒
	C_HUDMessage (gaucho_Message )
	Sleep(10)
	local gaucho_Message = C_GetStringFromPreset( 8260003 )--魔王停止攻擊10秒
	C_HUDMessage (gaucho_Message )
	Sleep(10)
	local gaucho_Message = C_GetStringFromPreset( 8260004 )--魔王停止攻擊10秒
	C_HUDMessage (gaucho_Message )
	Sleep(10)
	local gaucho_Message = C_GetStringFromPreset( 8260005 )--魔王停止攻擊10秒
	C_HUDMessage (gaucho_Message )
	Sleep(10)
	local gaucho_Message = C_GetStringFromPreset( 8260006 )--魔王停止攻擊10秒
	C_HUDMessage (gaucho_Message )
	Sleep(10)
	local gaucho_Message = C_GetStringFromPreset( 8260007 )--魔王停止攻擊10秒
	C_HUDMessage (gaucho_Message )
	Sleep(10)
	local gaucho_Message = C_GetStringFromPreset( 8260008 )--魔王停止攻擊10秒
	C_HUDMessage (gaucho_Message )
	Sleep(10)
	local gaucho_Message = C_GetStringFromPreset( 8260009 )--魔王停止攻擊10秒
	C_HUDMessage (gaucho_Message )
	Sleep(10)
	local gaucho_Message = C_GetStringFromPreset( 8260010 )--魔王停止攻擊10秒
	C_HUDMessage (gaucho_Message )
	Sleep(10)
	local gaucho_Message = C_GetStringFromPreset( 8260011 )--魔王停止攻擊10秒
	C_HUDMessage (gaucho_Message )
end
function c_gaucho_error()     
	C_HUDMessage (C_GetStringFromPreset(8257015) )--很抱歉!!
end
function c_gaucho_right()     
	C_HUDMessage (C_GetStringFromPreset(8257016) )--非常好!!
end
