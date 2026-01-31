--[[function c_lv0031_boss1_anm()--魔王宣告匾額
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
end]]	

--================================================
--人頭圖對話1
function MissionTalk_0031()
	local G_TalkLIST = { };
	--G_TalkLIST[91] = {8253101,55, 50 ,true,false}--對話編號,頭像編號,顯示秒數
	G_TalkLIST[93] = {8253104,140, 50 ,true,false }--對話編號,頭像編號,顯示秒數 
	G_TalkLIST[95] = {8253105,140, 50 ,true,false } 

	local GroupId = TargetID();
	if G_TalkLIST[GroupId] == nil then
		return;
	end
	local Msg = C_GetStringFromPreset( G_TalkLIST[GroupId][1] );
	C_PortraitDialog(G_TalkLIST[GroupId][2] , G_TalkLIST[GroupId][3] , G_TalkLIST[GroupId][4] ,G_TalkLIST[GroupId][5] , Msg, 100);
	Sleep(20);
end
--人頭圖對話2	
function C_lv0031_bosstalk(StringIndex)
	local stringtable = {8253101,8253102,8253103}

	if stringtable[StringIndex] ~= nil then
		C_PortraitDialog(140 ,     --頭像Gfx ID
						50 ,      --偏移值
						true ,
						false ,
						C_GetStringFromPreset(stringtable[StringIndex]),
						100)
	end
end

--==================================================

--電梯開門動畫
function c_lv0031_begin_1()
	C_SetMovieAndPlay(12,0,1,0);
	L_WaitMoviePlaying()
	C_AnswerDialog( -1 )
end


function c_lv0031_Boss_Flee_CutScene()
	local NpcGroupId = TargetID() - 90
	local CutSceneData = {}
	CutSceneData.NpcGroupId = NpcGroupId
	L_DoActionOnScreen1 ( c_lv0031_Boss_Flee_CutScene_1 ,c_lv0031_Boss_Flee_CutScene_0 , CutSceneData ,true)
	C_lv0031_bosstalk(NpcGroupId)
end

function c_lv0031_Boss_Flee_CutScene_0( UserData )
	local CameraLTM = { {0.999292, 0.000000, 0.043892, 0.000000 ,-0.022019,0.865339,0.501294,0.000000,-0.037973,-0.501780,0.864519,0.000000,3691.303467,508.143433,-539.836609,1.000000,45 , 0 , 0},
						{0.320748, 0.000000, -0.947287, 0.000000 ,0.209849,0.975281,0.071054,0.000000,0.923772,-0.221552,0.312787,0.000000,1600.268799,228.366653,572.784363,1.000000,45 , 0 , 0},
						{0.508309, 0.000000, -0.861281, 0.000000 ,0.518705,0.798456,0.306130,0.000000,0.687639,-0.602303,0.405831,0.000000,-284.616516,524.152588,-339.994873,1.000000,45 , 0 , 0},
						{0.658094, 0.000000, -0.753114, 0.000000 ,0.484093,0.766262,0.423018,0.000000,0.577008,-0.642876,0.504209,0.000000,5218.456055,428.176910,-768.548279,1.000000,45 , 0 , 0}
	
	}
	C_SetCameraStepData(unpack(CameraLTM[UserData.NpcGroupId]))

	local StartPosition = {	{3457,48,190,2},
							{2150,1,650,0},
							{240,41,2,6},
							{5738,16,-424,6}}

	local Mob01Id = C_CreateClientNPC (	3604 ,
										StartPosition[UserData.NpcGroupId][1],
										StartPosition[UserData.NpcGroupId][2],
										StartPosition[UserData.NpcGroupId][3],
										StartPosition[UserData.NpcGroupId][4]
										)
							
	UserData.NPCObjId = Mob01Id
	C_SetPlayCutScene(1)
end

function c_lv0031_Boss_Flee_CutScene_1( UserData )
	local NpcGroupId = UserData.NpcGroupId
	local EndPosition = {	{3857,2,190},
							{2150,2,980},
							{-2,2,2},
							{5438,2,-424}}
							
	--C_HUDMessage(NpcGroupId.."("..StartPosition[NpcGroupId][1].."--"..StartPosition[NpcGroupId][2].."--"..StartPosition[NpcGroupId][3]..")")
	--C_HUDMessage(Mob01Id)
	local Mob01Id = UserData.NPCObjId
	Sleep(5)
	local x,y,z = C_GetPosition(Mob01Id)
	C_DirectJump(	Mob01Id,
					EndPosition[NpcGroupId][1],
					y,
					EndPosition[NpcGroupId][3],
					1.0,
					false,
					0)										
	Sleep(2)				
	C_SetScale(Mob01Id,0.5,0.8)
	Sleep(8)
	C_SetPlayCutScene(0)
	C_DestroyClientObj(Mob01Id)
	C_AnswerDialog( -1 )
end
