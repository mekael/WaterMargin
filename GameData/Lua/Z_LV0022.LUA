function c_lv0022_boss1_anm()	--播Boss的2D圖片
--[[	local height,width,Rate;
	Rate = 1;
	height = 256 *  Rate
	width = 800 * Rate
	local PicId = C_ShowPicAnmByUV ( 4009 , width  , height ,
                                0 , 700 , 1 , 2 , 
                                0 , width, height ,
                                0.5 , 0.5 ,true);
	Sleep(30);
	C_ClosePic( PicId )]]
end	
-------------------------------------------------------------------------------
-- Client Script
-------------------------------------------------------------------------------

function MissionTalk_0022()
    local TalkLIST = { };
	TalkLIST[1011] = {8252201,52, 50 ,true,false}	--	TalkLIST[NPC群組ID] = {stringID,GFX人頭圖,底圖,方向,方向}
	TalkLIST[1021] = {8252202,52, 50 ,true,false } 
	TalkLIST[1031] = {8252203,52, 50 ,true,false } 
	TalkLIST[1041] = {8252204,52, 50 ,true,false } 
	TalkLIST[1051] = {8252205,52, 50 ,true,false } 
		local GroupId = TargetID();
	if TalkLIST[GroupId] == nil then
		return;
	end
	local Msg = C_GetStringFromPreset( TalkLIST[GroupId][1] );
	C_PortraitDialog(TalkLIST[GroupId][2] , TalkLIST[GroupId][3] , TalkLIST[GroupId][4] ,TalkLIST[GroupId][5] , Msg, 100);
	Sleep(20);
end

--動畫 BOSS出現
function c_lv0022_movie_boss ()
	local tb_Cutscene_Data = {}
	L_DoActionOnScreen_ForMovie( c_lv0022_movie_boss_Module,
								 nil,
								 tb_Cutscene_Data , true )
	C_AnswerDialog( -1 )
end
function c_lv0022_movie_boss_Module()
	C_PlayMusic(46);          --CutScene音樂
	C_SetMovieAndPlay(7,0,1,0);
	L_WaitMoviePlaying()
	C_PlayMusic(35);          --BOSS戰鬥音樂
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