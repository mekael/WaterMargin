G_Client_Pank_ObjId = 0

function pank_Position1()     
	G_Client_Pank_ObjId = TargetID()--±µ¦¬¥Ñsever¶Ç¨Óªº§P§Jª«¥ó½s¸¹
	C_RunScript (-1 , -1, "pank_Position_Check")
end
function pank_Position_Check()
	while true do
		--C_HUDMessage ("«q§J = "..G_Client_Pank_ObjId)
		--local GId = TargetID();
		--C_HUDMessage ("«q§J2 = "..GId)
		local pank_x1 , pank_y1 , pank_z1 = C_GetPosition(G_Client_Pank_ObjId)	
		if pank_x1 ~= nil then 
			Sleep(1)
			local pank_x2 , pank_y2 , pank_z2 = C_GetPosition(G_Client_Pank_ObjId)
			if pank_x2 ~= nil then 
				Sleep(1)
				local pank_Position_x = (pank_x1-pank_x2)*(pank_x1-pank_x2) 
				local pank_Position_y = (pank_y1-pank_y2)*(pank_y1-pank_y2) 
				local pank_Position_z = (pank_z1-pank_z2)*(pank_z1-pank_z2) 
				--C_HUDMessage ("«q§J²¾°Ê  x = "..pank_Position_x.." y = "..pank_Position_y.." z = "..pank_Position_z)
				if ((pank_Position_x > 0) or (pank_Position_y > 0) or (pank_Position_z > 0)) then 
					C_RunScript (-1 , -1, "SkillCamShock_run")
					--print ("«q§J¨«¸ô¾_°Ê")
				end
				
				if ((pank_Position_x == 0) and (pank_Position_y == 0) and (pank_Position_z == 0)) then 
					C_RunScript (OwnerID() , TargetID(), "SkillCamShock_stop")
					--print ("«q§J°±¤î¾_°Ê")
				end
			end 
		end 
		Sleep(1)
	end
end
function pank_cutscene()
	local pank_Id = C_CreateClientNPC (50315, 0,0,0 , 4);
	C_LockUserControl( true );--§âª±®aÂê©w
	C_SetCameraStepData(0.982763, 0.000000, -0.184952, 0.000000 ,-0.015100,0.996681,-0.080238,0.000000,0.184335,0.081646,0.979485,0.000000,-205.235840,45.623650,-1154.803223,1.000000,
						45 , 0 , 0);
	C_SetPlayCutScene(1);
	Sleep(10);
	C_PlayAnimation ( pank_Id, 8010 );
	Sleep(20);
	C_SetPlayCutScene(0);
	C_DestroyClientObj ( pank_Id )
	C_LockUserControl( false );--§âª±®a¸Ñ¶}
	local pank_Message = C_GetStringFromPreset( 8260001 )--Å]¤ý°±¤î§ðÀ»30¬í
	C_HUDMessage (pank_Message )
	Sleep(200)
	local pank_Message = C_GetStringFromPreset( 8260002 )--Å]¤ý°±¤î§ðÀ»10¬í
	C_HUDMessage (pank_Message )
	Sleep(10)
	local pank_Message = C_GetStringFromPreset( 8260003 )--Å]¤ý°±¤î§ðÀ»10¬í
	C_HUDMessage (pank_Message )
	Sleep(10)
	local pank_Message = C_GetStringFromPreset( 8260004 )--Å]¤ý°±¤î§ðÀ»10¬í
	C_HUDMessage (pank_Message )
	Sleep(10)
	local pank_Message = C_GetStringFromPreset( 8260005 )--Å]¤ý°±¤î§ðÀ»10¬í
	C_HUDMessage (pank_Message )
	Sleep(10)
	local pank_Message = C_GetStringFromPreset( 8260006 )--Å]¤ý°±¤î§ðÀ»10¬í
	C_HUDMessage (pank_Message )
	Sleep(10)
	local pank_Message = C_GetStringFromPreset( 8260007 )--Å]¤ý°±¤î§ðÀ»10¬í
	C_HUDMessage (pank_Message )
	Sleep(10)
	local pank_Message = C_GetStringFromPreset( 8260008 )--Å]¤ý°±¤î§ðÀ»10¬í
	C_HUDMessage (pank_Message )
	Sleep(10)
	local pank_Message = C_GetStringFromPreset( 8260009 )--Å]¤ý°±¤î§ðÀ»10¬í
	C_HUDMessage (pank_Message )
	Sleep(10)
	local pank_Message = C_GetStringFromPreset( 8260010 )--Å]¤ý°±¤î§ðÀ»10¬í
	C_HUDMessage (pank_Message )
	Sleep(10)
	local pank_Message = C_GetStringFromPreset( 8260011 )--Å]¤ý°±¤î§ðÀ»10¬í
	C_HUDMessage (pank_Message )
end
function number_wrong()     
	local pank_Message = C_GetStringFromPreset( 8260012 )--¼Æ¦r¾÷±K½X¿ù»~
	C_HUDMessage (pank_Message )
end
function number_right()     
	local pank_Message = C_GetStringFromPreset( 8260013 )--¼Æ¦r¾÷±K½X­«¸m
	C_HUDMessage (pank_Message )
end
function number1_right()     
	local pank_Message = C_GetStringFromPreset( 8260013 )--¼Æ¦r¾÷±K½X­«¸m
	C_HUDMessage ("No.1 "..pank_Message )
end
function number2_right()     
	local pank_Message = C_GetStringFromPreset( 8260013 )--¼Æ¦r¾÷±K½X­«¸m
	C_HUDMessage ("No.2 "..pank_Message )
end
function number3_right()     
	local pank_Message = C_GetStringFromPreset( 8260013 )--¼Æ¦r¾÷±K½X­«¸m
	C_HUDMessage ("No.3 "..pank_Message )
end
function number_reset()     
	local pank_Message = C_GetStringFromPreset( 8260014 )--¼Æ¦r¾÷±K½X­«¸m
	C_HUDMessage (pank_Message )
end
