-------------------------------------------------------------------------------
-- Client Script
-------------------------------------------------------------------------------

--=============================================================================
function lv_0018_CutScene_NPCShow1 ()
	local tb_Cutscene_Data = {}
	L_DoActionOnScreen1( lv_0018_CutScene_NPCShow1_Module,
						 lv_0018_CutScene_NPCShow1_Module2,
						 tb_Cutscene_Data , true )
	C_AnswerDialog( -1 )
end

function lv_0018_CutScene_NPCShow1_Module2 (tb_Cutscene_Data)
	tb_Cutscene_Data.Brother01Id = C_CreateClientNPC (40022 , 6000,0,-200 , 5);			--建立斑馬兄弟-黑
	tb_Cutscene_Data.Brother02Id = C_CreateClientNPC (40023 , 5900,0,-130 , 4);			--建立斑馬兄弟-白
	C_SetCameraStepData( 0.828108, 0.000000, -0.560802, 0.000000 ,0.104400,0.982671,0.154162,0.000000,0.551014,-0.186189,0.813653,0.000000,5594.458008,167.566833,-805.237061,1.000000,
												45 , 0 , 0);																			--設定鏡頭位置(LTM值直接由SceneEditor取得)
	C_SetPlayCutScene(1);																							--設定是否改由Script控制鏡頭

end

function lv_0018_CutScene_NPCShow1_Module (tb_Cutscene_Data)
	
	Sleep(10);
	
	C_PlayAnimation ( tb_Cutscene_Data.Brother01Id, 6030 );																--斑馬兄弟-黑播動作
	Sleep(5);
	C_PlayAnimation ( tb_Cutscene_Data.Brother02Id, 6030 );																--斑馬兄弟-白播動作
	Sleep(10);
	
	local Mob01Id = C_CreateClientNPC (2403 , 5400,0,50, 3);					--建立手下
	local Mob02Id = C_CreateClientNPC (2408 , 6000,0,50 , 5);					--建立手下
	local Mob03Id = C_CreateClientNPC (2406 , 5400,0,-480 , 1);					--建立手下
	local Mob04Id = C_CreateClientNPC (2407 , 6000,0,-480 , 6);					--建立手下
	C_SetTriggerEnable (3005 , false );																		--關閉柵欄阻擋trrigger
	C_Move ( tb_Cutscene_Data.Brother01Id, 6800 ,0 ,-100 ,true );														--黑斑馬移到至指定座標
	Sleep(5);
	C_Move ( tb_Cutscene_Data.Brother02Id, 6800 ,0 ,-100 ,true );														--白斑馬移到至指定座標
	Sleep(20);
	
	local FenceId = C_CreateClientNPC (30211 , 6400,0,-100 , 0);					--建立柵欄
	C_SetTriggerEnable (3005 , true );																		--開啟柵欄阻擋trrigger
	Sleep(5);
	C_DestroyClientObj ( tb_Cutscene_Data.Brother01Id );																		--刪除黑斑馬
	C_DestroyClientObj ( tb_Cutscene_Data.Brother02Id );																		--刪除白斑馬
	Sleep(4);
	C_DestroyClientObj ( FenceId );																				--刪除手下
	C_DestroyClientObj ( Mob01Id );																			--刪除手下
	C_DestroyClientObj ( Mob02Id );																			--刪除手下
	C_DestroyClientObj ( Mob03Id );																			--刪除手下
	C_DestroyClientObj ( Mob04Id );																			--刪除手下
	Sleep(1);
	C_SetPlayCutScene(0);																							--結束
	--C_LockUserControl( false );																					--解除玩家鎖定
	--C_AnswerDialog( -1 )
end

--任務對話頭像=============================================================================
function MissionTalk_0018()
    local TalkLIST = { };
	TalkLIST[1011] = {8251801,10, 50 ,true,false }		--TalkLIST[NPC群組ID] = {stringID,GFX人頭圖,底圖,方向,方向}
	TalkLIST[7001] = {8251802,10, 50 ,true,false } 
	TalkLIST[5001] = {8251803,51, 50 ,true,false } 
	TalkLIST[5002] = {8251804,51, 50 ,true,false } 
	TalkLIST[2061] = {8251805,51, 50 ,true,false } 
			local GroupId = TargetID();
	if TalkLIST[GroupId] == nil then
		return;
	end
	local Msg = C_GetStringFromPreset( TalkLIST[GroupId][1] );
	C_PortraitDialog(TalkLIST[GroupId][2] , TalkLIST[GroupId][3] , TalkLIST[GroupId][4] ,TalkLIST[GroupId][5] , Msg, 2000);
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

--BOSS出場表演=============================================================================
function c_lv0018_boss1_anm()	--播Boss的2D圖片
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

function c_lv0018_movie_boss ()
	local tb_Cutscene_Data = {}
	L_DoActionOnScreen_ForMovie( c_lv0018_movie_boss_Module,
								 nil,
								 tb_Cutscene_Data , true )
	C_AnswerDialog( -1 )
end

function c_lv0018_movie_boss_Module()
	C_PlayMusic(45);
	C_SetMovieAndPlay(6,0,1,0);
	L_WaitMoviePlaying()
	C_PlayMusic(35);
end
