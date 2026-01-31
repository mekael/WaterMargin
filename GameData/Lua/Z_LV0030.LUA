function c_lv0030_boss1_anm()	--播Boss的2D圖片
	local height,width,Rate;
	Rate = 1;
	height = 256 *  Rate
	width = 800 * Rate
	local PicId = C_ShowPicAnmByUV ( 4009 , width  , height ,
                                0 , 700 , 1 , 2 , 
                                0 , width, height ,
                                0.5 , 0.5 ,true);
	Sleep(30);
	C_ClosePic( PicId )
end	
-------------------------------------------------------------------------------
-- Client Script
-------------------------------------------------------------------------------

function MissionTalk_0030()
    local TalkLIST = { };
	TalkLIST[1] = {8253001,140, 50 ,true,false}	--	TalkLIST[NPC群組ID] = {stringID,GFX人頭圖,底圖,方向,方向}
	TalkLIST[2] = {8253002,19, 50 ,true,false } 
	TalkLIST[10] = {8253003,19, 50 ,true,false } 
	local GroupId = TargetID();
	if TalkLIST[GroupId] == nil then
		return;
	end
	local Msg = C_GetStringFromPreset( TalkLIST[GroupId][1] );
	C_PortraitDialog(TalkLIST[GroupId][2] , TalkLIST[GroupId][3] , TalkLIST[GroupId][4] ,TalkLIST[GroupId][5] , Msg, 100);
	Sleep(20);
end
function lv_0030_cutscene()
	C_LockUserControl( true );--把玩家鎖定
	local door_Id = C_CreateClientNPC (31305, 3080 , 47.252197, 8000 , 4)
	C_SetCameraStepData(0.994370, 0.000000, 0.106387, 0.000000 ,-0.019598,0.982963,0.183182,0.000000,-0.104569,-0.184228,0.977386,0.000000,3236.717041,214.946991,6584.765625,1.000000,
						45 , 0 , 0);
	C_SetPlayCutScene(1);
	Sleep(10);
	C_PlayAnimation ( door_Id, 0050 );
	Sleep(20);
	C_SetPlayCutScene(0);
	C_DestroyClientObj ( door_Id )
	C_LockUserControl( false );--把玩家解開
end

--[[
void C_PortraitDialog ( nPortraitId,  Offset, RightAlign ,UpAligh , Message , AlphaValue , NeedLock , WaitTime)
說明：產生一個頭像式的對話框
輸入參數：	nPortraitId   頭像圖的gfxPresetId
				Offset        頭像圖與對話框之前的偏移值(+-整數)
				RightAlign        對話框出現在上面(true/false)
				UpAligh       對話框出現在上面(true/false)
				Message       對話內容
				AlphaValue        底圖透明度(0~255)
				NeedLock      是否鎖住操作(true/false)
				WaitTime      每次對話等待多久才可以接受訊號(秒)
]]


--=============================================================================
--=============================================================================
--動畫 宋江被抓
function c_lv0030_movie_SonJan ()
	local tb_Cutscene_Data = {}
	L_DoActionOnScreen_ForMovie( c_lv0030_movie_SonJan_Module,
								 nil,
								 tb_Cutscene_Data , true )
	C_AnswerDialog( -1 )
end
function c_lv0030_movie_SonJan_Module()
	C_SetMovieAndPlay(15,0,1,0);--要播的Movie PresetId，要播的AlphaMovie PresetId，是否要播出聲音，是否要Repeat
	L_WaitMoviePlaying()
	--C_AnswerDialog( -1 )
end
--=============================================================================