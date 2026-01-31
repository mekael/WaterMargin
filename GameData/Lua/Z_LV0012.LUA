function c_lv0012_boss1_anm()
	local height,width,Rate;
	Rate = 1;
	height = 256 *  Rate
	width = 800 * Rate
	local PicId = C_ShowPicAnmByUV ( 4007 , width  , height ,
                                0 , 700 , 1 , 2 , 
                                0 , width, height ,
                                0.5 , 0.2 ,true);
	C_SaveNowFogData ();
    C_ModifySceneFog (500,1000,0.6,0.6,0.6);
		
	C_SaveNowAmbiLightColorData ();
	C_ModifyAmbiLightColor (0.2,0.2,0.2);
		
	C_SaveNowMainLightColorData ();
	C_ModifyMainLightColor (0.0,0.0,0.0);					
									
	Sleep(30);
		
	C_ReturnDefFog ();
	C_ReturnDefAmbiLightColor ();
	C_ReturnDefMainLightColor ();	
	C_ClosePic( PicId )
	C_AnswerDialog( -1 )
end	

-- Client Script
-------------------------------------------------------------------------------


function MissionTalk_012()
local G_TalkLIST = { };
	G_TalkLIST[1] = {8250006,45, 50 ,true,false}
	local GroupId = TargetID();
	if G_TalkLIST[GroupId] == nil then
		return;
	end
	local Msg = C_GetStringFromPreset( G_TalkLIST[GroupId][1] );
	C_PortraitDialog(G_TalkLIST[GroupId][2] , G_TalkLIST[GroupId][3] , G_TalkLIST[GroupId][4] ,G_TalkLIST[GroupId][5] , Msg, 100);
	--Sleep(20);
end
--=============================================================================
function lv0012_camShock()
    Sleep(3)
	C_CameraShockStart(5,15,5,
						15,5,15,
						15,0.5,false)
	--C_Msg ("震動")
end	
-------------------------------------------------------------------------------

function CreateRabbitBoss ()
	local X,Y,Z = -90 , 0 , -5 ;--C_GetPosition( OwnerID() );
	local NPCId = C_CreateClientNPC (53 , X,Y,Z , 4);
	C_SetScale(NPCId , 0.5 , 0);
	
	C_RunScript( NPCId , NPCId , "RabbitBossCutScene" );
	
	
	--C_SetScale(NPCId , 1.5 , 0.5);
	Sleep(70);
end
--=============================================================================
G_NPC_SonJenId = 0;
G_NPC_BoxId = 0;
function RabbitBossCutScene ()
	C_LockUserControl( true );
	
	local height,width,Rate;
	Rate = 1;
	height = 768 *  Rate / 768
	width = 1048 * Rate / 1024
	local Pic01 = C_ShowAutoScalePicAnmByUV  ( 4041 , width  , height , 0 , 100 , 0 , 3 , 0 , width, height , 0.5 , 0.5 ,true);--跳跳的標題出現
	
	local X,Y,Z = 1076 , 0 , 4 ;
	G_NPC_SonJenId = C_CreateClientNPC (40021 , X , Y , Z , 6);	
	C_RunScript( G_NPC_SonJenId ,G_NPC_SonJenId , "SonJenIdPlayAnimation" );
	--C_Msg ("宋江")
	X,Y,Z = 1070 , 0 , 4 ;
	G_NPC_BoxId = C_CreateClientNPC ( 30060 , X , Y , Z , 4);	
	-- 設定Cut 0
	C_SetCameraStepData(-0.029464, 0.000000, -0.999581, 0.000000 ,
						0.528733,0.848669,-0.015585,0.000000,
						0.848302,-0.528964,-0.025005,0.000000,
						731.591431,233.505493,-21.354153,1.000000,
						45 , 0 , 0);
	C_SetPlayCutScene(1);					
	Sleep(10);					
	-- 設定Cut 1
	C_SetCameraStepData(0.747846	, 0.000000	, 0.663946	,0.000000,
						0.011257	,0.999922	,-0.012679	,0.000000,
						-0.663863	,0.016956	,0.747754	,0.000000,
						245.769089	,70.722878	,-343.204834,1.000000,
						45 , 2000 , 1);
	
	C_SetPlayCutScene(1);
	--local X,Y,Z = 90 , 0 , -5;
	local Pos = {{x=90 , y=0 , z=-5},
				{x=90 , y=0 , z=-120},
				{x=90 , y=0 , z=0},
				{x=510 , y=0 , z=0},
				{x=510 , y=0 , z=-5},
				{x=358 , y=150 , z=-166}
				};
	local NPCId = OwnerID();

	Sleep(5);
	--往第一個點移動
	C_DirectMove(NPCId , Pos[1].x,Pos[1].y,Pos[1].z , true);
	--往第二個點移動
	C_DirectMove(NPCId , Pos[2].x,Pos[2].y,Pos[2].z , true);
	
	--C_SetScale(RadishId , 0.1 , 1);
	--Sleep(10);
	--C_DestroyClientNPC( RadishId );

	C_PlayAnimation(NPCId,12);
	Sleep(9);
	--local RadishId = C_CreateClientNPC (33 , Pos[2].x,Pos[2].y,Pos[2].z - 50, 4);
	C_PlayAnimation(NPCId,11);
	Sleep(9);

	--[[
	for i =0,2,1 do
		local Rate = math.random(10,20) / 10 ;
		C_SetScale(NPCId , Rate , 0.1);
		Sleep(1);
		local Rate = math.random(1,10) / 10 ;
		C_SetScale(NPCId , Rate , 0.1);
		Sleep(1);
	end
	--]]
	
	--Sleep(5);
	C_PlayAnimation(NPCId,6020);
	Sleep(2);
	C_SetScale(NPCId , 1 , 0.2);
	Sleep(14);
	
	C_DirectMove(NPCId , Pos[3].x,Pos[3].y,Pos[3].z , true);

	--[[
	C_SetCameraStepData(0.386135	, 0.000000	, 0.922518	, 0.000000 	,
						-0.339027	,0.930111	,0.141905	,0.000000	,
						-0.857986	,-0.367528	,0.359125	,0.000000	,
						676.406494	,182.607986	,-127.020210,1.000000	,
						45,0,0);
	--]]						
	
	-- 設定Cut 2
	C_SetCameraStepData(-0.096008, 0.000000, 0.995517, 0.000000 ,-0.190732,0.981641,-0.018394,0.000000,-0.977111,-0.191617,-0.094231,0.000000,729.694092,92.230721,-2.655109,1.000000,45,0,0);
	C_DirectMove(NPCId , Pos[4].x,Pos[4].y,Pos[4].z , true);

	C_DirectMove(NPCId , Pos[5].x,Pos[5].y,Pos[5].z , true);

	Sleep(1);

	-- 設定Cut 3
	C_SetCameraStepData(0.599216, 0.000000, -0.800841, 0.000000 ,0.567281,0.706067,0.424459,0.000000,0.565336,-0.708502,0.423001,0.000000,182.497314,385.442413,-329.813934,1.000000,45,0,0);
	C_DirectJump( NPCId ,Pos[6].x,Pos[6].y,Pos[6].z , 0.5 , true , false );
	c_lv0012_boss1_anm();
	--Sleep(10);
	C_DestroyClientObj( NPCId );
	--C_DestroyClientObj(G_NPC_SonJenId );
	--C_DestroyClientObj(G_NPC_BoxId );

	C_ClosePic( Pic01 );		
	C_SetPlayCutScene(0);
	C_LockUserControl( false );
	C_AnswerDialog( -1 )
end
function SonJenIdPlayAnimation() 
	--C_Msg ("宋江2")
	while true do
		C_PlayAnimation(OwnerID(), 8040)
		Sleep(20)
	end
end

--=============================================================================
function clv0012_sonjen_anm ()
    local height,width,Rate;
	Rate = 1;
	height = 768 *  Rate / 768
	width = 1048 * Rate / 1024
	local Pic01 = C_ShowAutoScalePicAnmByUV  ( 4041 , width  , height , 0 , 100 , 0 , 3 , 0 , width, height , 0.5 , 0.5 ,true);
	
	C_SetCameraStepData(0.243125, 0.000000, -0.970047, 0.000000 ,
						0.053084,0.998570,0.013305,0.000000,
						0.968610,-0.054726,0.242764,0.000000,
						842.032349,44.892029,-46.695980,1.000000,
						45 , 0 , 0);
	C_SetPlayCutScene(1);					
	Sleep(1);

	C_DestroyClientObj(G_NPC_BoxId );
	C_StopScript(G_NPC_SonJenId , "SonJenIdPlayAnimation"); 
	Sleep(20)
	
	C_PlayAnimation(G_NPC_SonJenId, 08030)
	Sleep(20)
	C_PlayAnimation(G_NPC_SonJenId, 08030)
	Sleep(20)
	C_PlayAnimation(G_NPC_SonJenId, 08030)
	
	Sleep(100);
	C_ClosePic( Pic01 );	
	C_SetPlayCutScene(0);
	C_DestroyClientObj(G_NPC_SonJenId );
end
--=============================================================================
--動畫 宋江跟跳跳
function c_lv0012_movie_SonJan ()
	local tb_Cutscene_Data = {}
	L_DoActionOnScreen_ForMovie( c_lv0012_movie_SonJan_Module,
								 nil,
								 tb_Cutscene_Data , true )
	C_AnswerDialog( -1 )
end

function c_lv0012_movie_SonJan_Module()
	C_PlayMusic(44);
	C_SetMovieAndPlay(5,0,1,0);
	L_WaitMoviePlaying()
	--C_AnswerDialog( -1 )
	C_PlayMusic(35);
end
--=============================================================================
