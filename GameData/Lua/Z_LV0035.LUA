function c_lv0035_boss1_anm()	--播Boss的2D圖片
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
-------------------------------------------------------------------------------
-- Client Script
-------------------------------------------------------------------------------

function MissionTalk_0035()
    local TalkLIST = { };
	--TalkLIST[40024] = {8253131,15, 50 ,true,false}	--	TalkLIST[NPC群組ID] = {stringID,GFX人頭圖,底圖,方向,方向}
	TalkLIST[400241] = {8253135,15, 50 ,true,false}
	local GroupId = TargetID();
	if TalkLIST[GroupId] == nil then
		return;
	end
	local Msg = C_GetStringFromPreset( TalkLIST[GroupId][1] );
	C_PortraitDialog(TalkLIST[GroupId][2] , TalkLIST[GroupId][3] , TalkLIST[GroupId][4] ,TalkLIST[GroupId][5] , Msg, 100);
	Sleep(20);
end
function lv0035_cutscene()
	local tb_Cutscene_Data = {}
	L_DoActionOnScreen1( lv0035_cutscene_Module,
						 lv0035_cutscene_Module2,
						 tb_Cutscene_Data,true)
	C_AnswerDialog( -1 )
end

function lv0035_cutscene_Module2( tb_Cutscene_Data )

	tb_Cutscene_Data.npc_Id = C_CreateClientNPC (40024, 16600 , 0, 1400 , 6)
	tb_Cutscene_Data.boss_Id = C_CreateClientNPC (4003, 16800 , 0, 1400 , 6)
	C_SetCameraStepData(0.284622, 0.000000, -0.958644, 0.000000 ,0.030442,0.999506,0.009038,0.000000,0.958168,-0.031756,0.284480,0.000000,16080.303711,136.913574,1248.941284,1.000000,
						45 , 0 , 0);
	C_SetPlayCutScene(1);
end	

function lv0035_cutscene_Module( tb_Cutscene_Data )
	Sleep(10);
	C_PlayAnimation ( tb_Cutscene_Data.boss_Id, 6010 );
	Sleep(7);
	C_PlayAnimation ( tb_Cutscene_Data.npc_Id, 0050 );
	Sleep(10);
	
	C_Move ( tb_Cutscene_Data.boss_Id , 17151,0,1407 , true )
	Sleep(20)
	C_SetPlayCutScene(0);
	C_DestroyClientObj ( tb_Cutscene_Data.npc_Id )
	C_DestroyClientObj ( tb_Cutscene_Data.boss_Id )
	C_PortraitDialog(91 , 50 ,true,false,
					"<h2><font color=black>"..C_GetStringFromPreset( 8253134) .."</font></h2>",--想把東西拿回去，沒那麼容易。
					100,true,2);
end

function lv0035_cutscene_star()
	local tb_Cutscene_Data = {}
	L_DoActionOnScreen1( lv0035_cutscene_star1,
						 lv0035_cutscene_star2,
						 tb_Cutscene_Data,true)
	C_AnswerDialog( -1 )
end

function lv0035_cutscene_star2( tb_Cutscene_Data )
	tb_Cutscene_Data.npc_Id = C_CreateClientNPC (40024, 220 , 0, 7 , 3)
	C_SetCameraStepData(0.935537, 0.000000, -0.353270, 0.000000 ,0.056847,0.986997,0.150544,0.000000,0.348671,-0.160921,0.923357,0.000000,219.899918,65.779472,-213.673874,1.000000,
						45 , 0 , 0);
	C_SetPlayCutScene(1);
end	

function lv0035_cutscene_star1( tb_Cutscene_Data )
	Sleep(10);
	C_PlayAnimation ( tb_Cutscene_Data.npc_Id, 0012 );
	C_PortraitDialog(15 , 50 ,true,false,
					C_GetStringFromPreset( 8253131),--開頭任務宣告。
					100,true,2);
	Sleep(20)
	C_SetPlayCutScene(0);
	C_DestroyClientObj ( tb_Cutscene_Data.npc_Id )
end



function lv0035_PortraitDialog()
	C_PortraitDialog(15 , 50 ,true,false,
					C_GetStringFromPreset( 8253133) ,
					100);

end
function lv0035_PortraitDialog1()
	C_PortraitDialog(15 , 50 ,true,false,
					C_GetStringFromPreset( 8253132),
					100);

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


--=============================================================================