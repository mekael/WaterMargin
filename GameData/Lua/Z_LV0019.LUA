function c_lv0019_boss1_anm()--魔王宣告匾額
	local height,width,Rate;
	Rate = 1;
	height = 256 *  Rate
	width = 800 * Rate
	local PicId = C_ShowPicAnmByUV ( 4009 , width  , height ,---圖號,width,height
                                0 , 700 , 1 , 2 , 
                                0 , width, height ,
                                0.5 , 0.5 ,true);
	Sleep(30);
	C_ClosePic( PicId )
end	
-- Client Script
-------------------------------------------------------------------------------

function MissionTalk_0019()
	local G_TalkLIST = { };
	G_TalkLIST[1] = {8251901,15, 50 ,true,false}--對話編號,頭像編號,顯示秒數
	G_TalkLIST[13] = {8251902,50, 50 ,true,false} 
	G_TalkLIST[11] = {8251903,50, 50 ,true,false} 
	G_TalkLIST[19] = {8251904,50, 50 ,true,false}
	G_TalkLIST[20] = {8251905,50, 50 ,true,false}
	
	local GroupId = TargetID();
	if G_TalkLIST[GroupId] == nil then
		return;
	end
	local Msg = C_GetStringFromPreset( G_TalkLIST[GroupId][1] );
	C_PortraitDialog(G_TalkLIST[GroupId][2] , G_TalkLIST[GroupId][3] , G_TalkLIST[GroupId][4] ,G_TalkLIST[GroupId][5] , Msg, 100);
	Sleep(20);
end
--=============================================================================
function c_lv0017_SpecialEvent()
	C_PortraitDialog(16 ,
					50 , 	
					true ,
					false ,
					C_GetStringFromPreset(8251703),
					100)
end

--老蜥蜴王出場動畫
function c_lv0019_biganime_1 ()
	local tb_Cutscene_Data = {}
	L_DoActionOnScreen_ForMovie( c_lv0019_biganime_1_Module,
								 nil,
								 tb_Cutscene_Data , true )
	C_AnswerDialog( -1 )
end
function c_lv0019_biganime_1_Module()
	C_PlayMusic(49);
	C_SetMovieAndPlay(10,0,1,0);
	L_WaitMoviePlaying()
	--C_AnswerDialog( -1 )
	C_PlayMusic(35);
end
