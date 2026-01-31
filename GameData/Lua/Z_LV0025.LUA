function c_lv0025_boss1_anm()--魔王宣告匾額
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
--人頭圖對話1
function MissionTalk_0025()
	local G_TalkLIST = { };
	G_TalkLIST[3301] = {8252501,54, 50 ,true,false}--對話編號,頭像編號,顯示秒數
	--G_TalkLIST[30271] = {8252502,53, 50 ,true,false } 
	--G_TalkLIST[30272] = {8252503,53, 50 ,true,false } 

	local GroupId = TargetID();
	if G_TalkLIST[GroupId] == nil then
		return;
	end
	local Msg = C_GetStringFromPreset( G_TalkLIST[GroupId][1] );
	C_PortraitDialog(G_TalkLIST[GroupId][2] , G_TalkLIST[GroupId][3] , G_TalkLIST[GroupId][4] ,G_TalkLIST[GroupId][5] , Msg, 100);
	Sleep(20);
end

--=============================================================================
function c_lv0025_cam()
	C_LockUserControl( true )
	C_SetCamera_ScreenCenterArea_WidthPercent( 0)
	Sleep(30);
	C_SetCamera_ScreenCenterArea_WidthPercent(5000)
	C_LockUserControl( false )
end	
--=============================================================================
--動畫 捲笛象王出場
function c_lv0025_movie_Start ()
	local tb_Cutscene_Data = {}
	L_DoActionOnScreen_ForMovie( c_lv0025_movie_Start_Module,
								 nil,
								 tb_Cutscene_Data , true )
	C_AnswerDialog( -1 )
end
function c_lv0025_movie_Start_Module()
	C_PlayMusic(53);
	C_SetMovieAndPlay(14,0,1,0);					--C_SetMovieAndPlay ( 要播的Movie PresetId, 要播的AlphaMovie PresetId, 是否要播出聲音[0/1], 是否要Repeat[0/1] )
	L_WaitMoviePlaying()
	local defaultMusicId = C_GetLevelDesignDefaultMusicId()
	C_PlayMusic(defaultMusicId)
end

--捲笛象王死亡CutScene
function C_lv0025_bossdead_anm_1()
	--[[C_LockUserControl( true );
		
	-- 設定Cut 0
	C_SetCameraStepData(0.999451, 0.000000, -0.034055, 
						0.000000 ,0.002404,0.997549,0.070567,
						0.000000,0.033970,-0.070607,0.996971,
						0.000000,372.508362,191.944427,-57.930538,1.000000,
						45 , 1000 , 1);
	C_SetPlayCutScene(1);]]
	
	--人頭圖對話2			
	C_PortraitDialog(53 ,     --頭像Gfx ID
					50 ,      --偏移值
					true ,
					false ,
					C_GetStringFromPreset(8252502),
					100)	

	--[[Sleep(30);
		
	C_SetPlayCutScene(0);
	C_LockUserControl( false );]]
end