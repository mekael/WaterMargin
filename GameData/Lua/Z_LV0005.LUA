function c_lv0005_boss1_anm ()
	local tb_Cutscene_Data = {}
	L_DoActionOnScreen1( c_lv0005_boss1_anm_Module,
						 nil,
						 tb_Cutscene_Data,true)
	C_AnswerDialog( -1 )
end

function c_lv0005_boss1_anm_Module()
	local boss = C_CreateClientNPC (17 , -908,0,5395 , 6)
	C_LockUserControl( true );
	C_SetCameraStepData(-0.796304, 0.000000, -0.604958, 0.000000 ,-0.221425,0.930657,0.291460,0.000000,0.562989,0.366031,-0.741060,0.000000,-974.859436,25.151554,5445.723145,1.000000,
						85 , 0 , 0);
	C_SetPlayCutScene(1);
	local height,width,Rate;
	Rate = 1;
	height = 256 *  Rate
	width = 800 * Rate
--[[	local PicId = C_ShowPicAnmByUV ( 4009 , width  , height ,
                                0 , 700 , 1 , 2 , 
                                0 , width, height ,
                                0.5 , 0.2 ,true);]]
	Sleep(30);
	
	C_SetPlayCutScene(0);
	C_LockUserControl( false );
	C_DestroyClientObj ( boss )
--	C_ClosePic( PicId )
end	
-------------------------------------------------------------------------------
-- Client Script
-------------------------------------------------------------------------------


function MissionTalk_005()
	local TalkLIST = { };
	TalkLIST[1] = {8250001,45, 50 ,true,false}
	
	local GroupId = TargetID();
	if TalkLIST[GroupId] == nil then
		return;
	end
	local Msg = C_GetStringFromPreset( TalkLIST[GroupId][1] );
	C_PortraitDialog(TalkLIST[GroupId][2] , TalkLIST[GroupId][3] , TalkLIST[GroupId][4] ,TalkLIST[GroupId][5] , Msg, 100);
	Sleep(20);
end
--=============================================================================