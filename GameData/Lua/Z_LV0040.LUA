-------------------------------------------------------------------------------
-- Client Script
-------------------------------------------------------------------------------
function MissionTalk_040()
	local TalkLIST = { };
	TalkLIST[6] = {8250041,78, 50 ,true,false}
	TalkLIST[401] = {8250042,16, 50 ,true,false}
	TalkLIST[406] = {8250043,16 ,50 ,true,false}
	TalkLIST[4505] = {8260043,79 ,50 ,true,false}
	
	local GroupId = TargetID();
	if TalkLIST[GroupId] == nil then
		return;
	end
	local Msg = C_GetStringFromPreset( TalkLIST[GroupId][1] );
	C_PortraitDialog(TalkLIST[GroupId][2] , TalkLIST[GroupId][3] , TalkLIST[GroupId][4] ,TalkLIST[GroupId][5] , Msg, 100);
	--Sleep(20);
end

--=============================================================================
--動畫 --貓王逃跑
function c_lv0040_movie1 ()
	local tb_Cutscene_Data = {}
	L_DoActionOnScreen_ForMovie( c_lv0040_movie1_Module,
								 nil,
								 tb_Cutscene_Data , true )
	C_AnswerDialog( -1 )
end
function c_lv0040_movie1_Module()
	C_SetMovieAndPlay(18,0,1,0);--要播的Movie PresetId，要播的AlphaMovie PresetId，是否要播出聲音，是否要Repeat
	L_WaitMoviePlaying()
	--C_AnswerDialog( -1 )
end
--=============================================================================