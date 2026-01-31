function c_lv0024_boss1_anm()--魔王宣告匾額
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

--[[function MissionTalk_0024()
	local G_TalkLIST = { };
	G_TalkLIST[1] = {8250084,15, 50 ,true,false}--對話編號,頭像編號,顯示秒數
	G_TalkLIST[2] = {8250085,12, 50 ,true,false } 
	G_TalkLIST[3] = {8250086,13, 50 ,true,false } 
	G_TalkLIST[4] = {8250087,12, 50 ,true,false }

	local GroupId = TargetID();
	if G_TalkLIST[GroupId] == nil then
		return;
	end
	local Msg = C_GetStringFromPreset( G_TalkLIST[GroupId][1] );
	C_PortraitDialog(G_TalkLIST[GroupId][2] , G_TalkLIST[GroupId][3] , G_TalkLIST[GroupId][4] ,G_TalkLIST[GroupId][5] ,"<h2><font color=black>"..Msg .."</font></h2>", 100);
	Sleep(20);
end
--=============================================================================
]]--

--象王出場動畫
function c_lv0024_biganime_1 ()
	local tb_Cutscene_Data = {}
	L_DoActionOnScreen_ForMovie( c_lv0024_biganime_1_Module,
								 nil,
								 tb_Cutscene_Data , true )
	C_AnswerDialog( -1 )
end

function c_lv0024_biganime_1_Module()
	C_PlayMusic(51);
	C_SetMovieAndPlay(12,0,1,0);
	L_WaitMoviePlaying()
	C_PlayMusic(35);
end
