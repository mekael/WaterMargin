-------------------------------------------------------------------------------
-- Client Script
-------------------------------------------------------------------------------

--任務對話頭像=============================================================================
function MissionTalk_0034()
    local TalkLIST = { };
	TalkLIST[1011] = {8253401,13, 50 ,true,false }		--TalkLIST[NPC群組ID] = {stringID,GFX人頭圖,底圖,方向,方向}
	TalkLIST[2011] = {8253402,52, 50 ,true,false } 
	TalkLIST[1051] = {8253403,13, 50 ,true,false } 
	TalkLIST[2051] = {8253404,90, 50 ,true,false } 
	TalkLIST[3904] = {8253405,90, 50 ,true,false }
			local GroupId = TargetID();
	if TalkLIST[GroupId] == nil then
		return;
	end
	local Msg = C_GetStringFromPreset( TalkLIST[GroupId][1] );
	if Msg ~= nil then
		C_PortraitDialog(TalkLIST[GroupId][2] , TalkLIST[GroupId][3] , TalkLIST[GroupId][4] ,TalkLIST[GroupId][5] , Msg, 2000);
	else
		print("字串編號找不到～～"..TalkLIST[GroupId][1])
	end
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


--CutScence設定=============================================================================
--宋江被籠子關CutScence表演
function lv_0034_CutScene_SonJanBeCatch_1 ()
	local tb_Cutscene_Data = {}
	L_DoActionOnScreen1(	lv_0034_CutScene_NPCShow1_Module,
										lv_0034_CutScene_NPCShow1_Module2,
										tb_Cutscene_Data , true )
	C_AnswerDialog( -1 )
end
function lv_0034_CutScene_NPCShow1_Module2 (tb_Cutscene_Data)
	tb_Cutscene_Data.SonJan_Id = C_CreateClientNPC (3904 , 5100,57,100 , 4);			--建立宋江
	C_SetCameraStepData(	0.812174, 0.000000, -0.583593, 0.000000 ,-0.024406,0.999306,-0.033965,0.000000,0.583138,0.041827,0.811542,0.000000,4869.574219,107.184387,-307.998718,1.000000,																													--設定鏡頭位置(LTM值直接由SceneEditor取得)
										45 , 0 , 0);																		--鏡頭的Fov值，直接由SceneEditor取得；從開始轉由Script接管後，在第幾個MS會變成這個情況；變化方法（ 0：時間到直接切換過去；1：由上一個狀態線性切換過去）
	C_SetPlayCutScene(1);																							--設定是否改由Script控制鏡頭
end
function lv_0034_CutScene_NPCShow1_Module (tb_Cutscene_Data)
	tb_Cutscene_Data.Coop_Id = C_CreateClientNPC (30120 , 5100,57,100 , 0);			--建立電光牢籠
	Sleep(25);

	C_DestroyClientObj ( tb_Cutscene_Data.SonJan_Id );									--刪除宋江
	C_DestroyClientObj ( tb_Cutscene_Data.Coop_Id );									--刪除電光牢籠
	Sleep(1);
	C_SetPlayCutScene(0);																							--結束
	--C_LockUserControl( false );																					--解除玩家鎖定
	--C_AnswerDialog( -1 )
end


--BOSS出場CutScence表演
function lv_0034_CutScene_BossShow_1 ()
	local tb_Cutscene_Data = {}
	L_DoActionOnScreen1(	lv_0034_CutScene_BOSSShow_Module,
										lv_0034_CutScene_BOSSShow_Module2,
										tb_Cutscene_Data , true )
	C_AnswerDialog( -1 )
end
function lv_0034_CutScene_BOSSShow_Module2 (tb_Cutscene_Data)
	tb_Cutscene_Data.Boss01_Id = C_CreateClientNPC (3905 , 4100,36,300 , 4);			--建立金獅庄-左
	tb_Cutscene_Data.Boss02_Id = C_CreateClientNPC (3905 , 4400,0,300 , 4);			--建立金獅庄-右
	C_SetCameraStepData(	0.762755, 0.000000, 0.646960, 0.000000 ,0.159609,0.969282,-0.188177,0.000000,-0.626985,0.246754,0.739202,0.000000,4482.961914,21.227051,39.940674,1.000000,																													--設定鏡頭位置(LTM值直接由SceneEditor取得)
										45 , 0 , 0);																		--鏡頭的Fov值，直接由SceneEditor取得；從開始轉由Script接管後，在第幾個MS會變成這個情況；變化方法（ 0：時間到直接切換過去；1：由上一個狀態線性切換過去）
	C_SetPlayCutScene(1);																							--設定是否改由Script控制鏡頭
end
function lv_0034_CutScene_BOSSShow_Module (tb_Cutscene_Data)
	Sleep(5);
	C_PlayAnimation ( tb_Cutscene_Data.Boss01_Id, 0050 );										--金獅庄-左播動作
	C_PlayAnimation ( tb_Cutscene_Data.Boss02_Id, 0050 );										--金獅庄-右播動作
	Sleep(5);
	C_PlayAnimation ( tb_Cutscene_Data.Boss01_Id, 8030 );										--金獅庄-左播動作
	C_PlayAnimation ( tb_Cutscene_Data.Boss02_Id, 8030 );										--金獅庄-右播動作
	Sleep(15);
	C_PlayAnimation ( tb_Cutscene_Data.Boss01_Id, 0031 );										--金獅庄-左播動作
	C_PlayAnimation ( tb_Cutscene_Data.Boss02_Id, 0031 );										--金獅庄-右播動作
	Sleep(20);
	--C_PlayAnimation ( tb_Cutscene_Data.Boss01_Id, 0020 );										--金獅庄-左播動作
	--C_PlayAnimation ( tb_Cutscene_Data.Boss02_Id, 0020 );										--金獅庄-右播動作
	--Sleep(15);

	C_DestroyClientObj ( tb_Cutscene_Data.Boss01_Id );									--刪除金獅庄-左
	C_DestroyClientObj ( tb_Cutscene_Data.Boss02_Id );									--刪除金獅庄-右
	Sleep(1);

	C_SetPlayCutScene(0);																							--結束
	--C_LockUserControl( false );																					--解除玩家鎖定
	--C_AnswerDialog( -1 )
end


--BOSS出場表演=============================================================================
function c_lv0034_boss1_anm()	--播Boss的2D圖片
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

--動畫 BOSS出現

function c_lv0034_movie_boss ()
	local tb_Cutscene_Data = {}
	L_DoActionOnScreen_ForMovie( c_lv0034_movie_boss_Module,
								 nil,
								 tb_Cutscene_Data , true )
	C_AnswerDialog( -1 )
end

function c_lv0034_movie_boss_Module()
	C_SetMovieAndPlay(6,0,1,0);
	L_WaitMoviePlaying()
end
