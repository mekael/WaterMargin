function c_lv0007_boss1_anm ()
	local tb_Cutscene_Data = {}
	L_DoActionOnScreen1( c_lv0007_boss1_anm_Module,
						 c_lv0007_boss1_anm_Module2,
						 tb_Cutscene_Data , true )
	C_AnswerDialog( -1 )
end

function c_lv0007_boss1_anm_Module2(tb_Cutscene_Data)
	tb_Cutscene_Data.boss = C_CreateClientNPC (41 , 190,-49,-1900 , 0)
	C_SetCameraStepData(-0.999345, 0.000000, 0.038022, 0.000000 ,0.015892,0.908561,0.417689,0.000000,-0.034543,0.417991,-0.907903,0.000000,184.163315,-23.218597,-1795.735107,1.000000,
						85 , 0 , 0);
	C_SetPlayCutScene(1);

end

function c_lv0007_boss1_anm_Module(tb_Cutscene_Data)
	--C_LockUserControl( true );
--[[	local height,width,Rate;
	Rate = 1;
	height = 256 *  Rate
	width = 800 * Rate
	local PicId = C_ShowPicAnmByUV ( 4009 , width  , height ,
                                0 , 700 , 1 , 2 , 
                                0 , width, height ,
                                0.5 , 0.2 ,true);]]
	Sleep(30);
	C_SetPlayCutScene(0);
	C_DestroyClientObj ( tb_Cutscene_Data.boss )
--	C_ClosePic( PicId )
	--C_AnswerDialog( -1 )
end	
-- Client Script
-------------------------------------------------------------------------------
function MissionTalk_007()
	local TalkLIST = { };
	TalkLIST[6] = {8250005,45, 50 ,true,false}
	
	local GroupId = TargetID();
	if TalkLIST[GroupId] == nil then
		return;
	end
	local Msg = C_GetStringFromPreset( TalkLIST[GroupId][1] );
	C_PortraitDialog(TalkLIST[GroupId][2] , TalkLIST[GroupId][3] , TalkLIST[GroupId][4] ,TalkLIST[GroupId][5] , Msg, 100);
	--Sleep(20);
end

--=============================================================================
--動畫 宋江被抓
function c_lv0007_movie_SonJan ()
	local tb_Cutscene_Data = {}
	L_DoActionOnScreen_ForMovie( c_lv0007_movie_SonJan_Module,
								 nil,
								 tb_Cutscene_Data , true )
	C_AnswerDialog( -1 )
end
function c_lv0007_movie_SonJan_Module()
	C_PlayMusic(41);
	C_SetMovieAndPlay(3,0,1,0);--要播的Movie PresetId，要播的AlphaMovie PresetId，是否要播出聲音，是否要Repeat
	L_WaitMoviePlaying()
	--C_AnswerDialog( -1 )
	local defaultMusicId = C_GetLevelDesignDefaultMusicId()
	C_PlayMusic(defaultMusicId)
end
--=============================================================================

