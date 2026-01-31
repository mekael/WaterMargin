function c_lv0033_boss1_anm()	--播Boss的2D圖片
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

function MissionTalk_0033()
    local TalkLIST = { };
	TalkLIST[1] = {8253111,92, 50 ,true,false}	--	TalkLIST[NPC群組ID] = {stringID,GFX人頭圖,底圖,方向,方向}
	local GroupId = TargetID();
	if TalkLIST[GroupId] == nil then
		return;
	end
	local Msg = C_GetStringFromPreset( TalkLIST[GroupId][1] );
	C_PortraitDialog(TalkLIST[GroupId][2] , TalkLIST[GroupId][3] , TalkLIST[GroupId][4] ,TalkLIST[GroupId][5] , Msg, 100);
	Sleep(20);
end
function MissionTalk_0033_1()
    Sleep(30);
	local TalkLIST = { };
	TalkLIST[1] = {8253112,17, 50 ,true,false}	--	TalkLIST[NPC群組ID] = {stringID,GFX人頭圖,底圖,方向,方向}
	
	local GroupId = TargetID();
	if TalkLIST[GroupId] == nil then
		return;
	end
	local Msg = C_GetStringFromPreset( TalkLIST[GroupId][1] );
	C_PortraitDialog(TalkLIST[GroupId][2] , TalkLIST[GroupId][3] , TalkLIST[GroupId][4] ,TalkLIST[GroupId][5] ,Msg, 100);
	Sleep(20);
end

function lv_0033_cutscene()
	local tb_Cutscene_Data = {}
	L_DoActionOnScreen1( lv0033_cutscene_Module,
						 lv0033_cutscene_Module2,
						 tb_Cutscene_Data,true)
	C_AnswerDialog( -1 )
end

function lv0033_cutscene_Module2( tb_Cutscene_Data )

	tb_Cutscene_Data.tank_Id = C_CreateClientNPC (3803, 724 , -35, 453 , 4)
	C_SetCameraStepData(0.630471, 0.000000, 0.776230, 0.000000 ,0.081965,0.994433,-0.066574,0.000000,-0.771902,0.105597,0.626958,0.000000,954.130798,-5.071758,217.337296,1.000000,
						45 , 0 , 0);
	C_SetPlayCutScene(1);
end	

function lv0033_cutscene_Module( tb_Cutscene_Data )
	Sleep(10);
	C_PlayAnimation ( tb_Cutscene_Data.tank_Id, 0050 );
	Sleep(90);
	C_SetPlayCutScene(0);
	C_DestroyClientObj ( tb_Cutscene_Data.tank_Id )
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