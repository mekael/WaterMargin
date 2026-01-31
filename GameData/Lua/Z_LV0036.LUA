--=============================================================================
--動畫 --鑽出地面
function c_lv0036_movie1 ()
	local tb_Cutscene_Data = {}
	L_DoActionOnScreen_ForMovie( c_lv0036_movie1_Module,
								 nil,
								 tb_Cutscene_Data , true )
	C_AnswerDialog( -1 )
end
function c_lv0036_movie1_Module()
	C_SetMovieAndPlay(16,0,1,0);--要播的Movie PresetId，要播的AlphaMovie PresetId，是否要播出聲音，是否要Repeat
	L_WaitMoviePlaying()
	--C_AnswerDialog( -1 )
end
--=============================================================================
--動畫 --鑽入地面
function c_lv0036_movie2 ()
	local tb_Cutscene_Data = {}
	L_DoActionOnScreen_ForMovie( c_lv0036_movie2_Module,
								 nil,
								 tb_Cutscene_Data , true )
	C_AnswerDialog( -1 )
end
function c_lv0036_movie2_Module()
	C_SetMovieAndPlay(17,0,1,0);--要播的Movie PresetId，要播的AlphaMovie PresetId，是否要播出聲音，是否要Repeat
	L_WaitMoviePlaying()
	--C_AnswerDialog( -1 )
end
--=============================================================================