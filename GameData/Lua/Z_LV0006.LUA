--[[function C_SonJan_lv0006()
	C_LockUserControl( true );
	local height,width,Rate;
	Rate = 1;
	height = 768 *  Rate / 768
	width = 1048 * Rate / 1024
	local Pic01 = C_ShowAutoScalePicAnmByUV  ( 4041 , width  , height , 0 , 100 , 0 , 3 , 0 , width, height , 0.5 , 0.5 ,true);
	local X,Y,Z = 6100 , 0 , 0 ;
	local NPC_SonJenId, NPC_BoxId;
	NPC_SonJenId = C_CreateClientNPC (40021 , X , Y , Z , 6);		
	
	X,Y,Z = 6090 , 0 , 360 ;
	local NPC_Rabbit01Id = C_CreateClientNPC (4 , X , Y , Z , 4);	
	X,Y,Z = 6000 , 0 , 360 ;
	local NPC_Rabbit02Id = C_CreateClientNPC (12 , X , Y , Z , 4);	
	
	-- 設定Cut 0
	C_SetCameraStepData(0.179893, 0.000000, -0.983748, 0.000000 ,
						0.426261,0.901320,0.077948,0.000000,
						0.886620,-0.433328,0.162131,0.000000,
						5673.294922,203.179794,-71.480804,1.000000,
						45 , 0 , 0);
	C_SetPlayCutScene(1);
	
	C_Move (NPC_Rabbit01Id , 6160 , 0, 150, false)
	
	C_Move (NPC_Rabbit02Id , 6050 , 0, 134, false)

	Sleep(30);
	
	C_PlayAnimation (NPC_Rabbit01Id,6020);
	C_PlayAnimation (NPC_Rabbit02Id,6020);
	
	Sleep(5);
	X,Y,Z = 6100 , 0 , 0 ;
	local NPC_BoxId = C_CreateClientNPC (30060 , X , Y , Z , 6);
	Sleep(5);
	C_PlayAnimation (NPC_SonJenId,8040);
					
	
	C_PortraitDialog(13 , -64 ,false,false,"<H2><font color=black>啊！鐵牢~我中計了！！ </font></H2>\n<H2><font color=black>求救、求救！</font></H2>\n<H2><font color=black>英雄們快來救我啊~</font></H2>");

	C_DestroyClientObj( NPC_SonJenId );
	C_DestroyClientObj( NPC_Rabbit01Id );
	C_DestroyClientObj( NPC_Rabbit02Id );
	C_DestroyClientObj( NPC_BoxId );

	C_ClosePic( Pic01 );		
	C_SetPlayCutScene(0);
	C_LockUserControl( false );
end]]
-------------------------------------------------------------------------------
--BOSS出現字卡
function c_lv0006_boss1_anm()
	local height,width,Rate;
	Rate = 1;
	height = 256 *  Rate
	width = 800 * Rate
	local PicId = C_ShowPicAnmByUV ( 4009 , width  , height ,
                                0 , 700 , 1 , 2 , 
                                0 , width, height ,
                                0.5 , 0.2 ,true);
	Sleep(30);
	C_ClosePic( PicId )
	C_AnswerDialog( -1 )
end

-- Client Script
-------------------------------------------------------------------------------

function MissionTalk_006()
	local TalkLIST = { };
	TalkLIST[1] = {8250003,13, 50 ,true,false}
	TalkLIST[80] = {8250004,45, 50 ,true,false}
	local GroupId = TargetID();
	if TalkLIST[GroupId] == nil then
		return;
	end
	local Msg = C_GetStringFromPreset( TalkLIST[GroupId][1] );
	C_PortraitDialog(TalkLIST[GroupId][2] , TalkLIST[GroupId][3] , TalkLIST[GroupId][4] ,TalkLIST[GroupId][5] , Msg, 100);
end

--[[function c_lv0006_CarEvent()
	C_PortraitDialog(14 ,
					50 ,
					true ,
					false ,
					"<h2><font color=black>"..C_GetStringFromPreset(8250004).."</font></h2>",
					100)
end]]
--=============================================================================
--動畫 宋江被抓
function c_lv0006_movie_SonJan ()
	local tb_Cutscene_Data = {}
	L_DoActionOnScreen_ForMovie( c_lv0006_movie_SonJan_Module,
								 nil,
								 tb_Cutscene_Data , true )
	C_AnswerDialog( -1 )
end

function c_lv0006_movie_SonJan_Module()
	C_PlayMusic(42);
	C_SetMovieAndPlay(1,0,1,0);
	L_WaitMoviePlaying()
	local defaultMusicId = C_GetLevelDesignDefaultMusicId()
	C_PlayMusic(defaultMusicId)
end
--=============================================================================
--動畫 BOSS出現
function c_lv0006_movie_boss ()
	local tb_Cutscene_Data = {}
	L_DoActionOnScreen_ForMovie( c_lv0006_movie_boss_Module,
								 nil,
								 tb_Cutscene_Data , true )
	C_AnswerDialog( -1 )
end
function c_lv0006_movie_boss_Module()
	C_PlayMusic(43);
	C_SetMovieAndPlay(2,0,1,0);
	L_WaitMoviePlaying()
	C_PlayMusic(35);
end
