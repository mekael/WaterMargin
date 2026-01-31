--=====以下為共用區============================================================================
function c_MissionTalk_Lock(HeadPic,MessageString,Waitsecond)	--人頭圖對話鎖操作(人頭圖ID , 對話StringID , 不能關掉的秒數)
		C_PortraitDialog(HeadPic , -64 ,false,false,
						C_GetStringFromPreset( MessageString),
						255,true,Waitsecond);
end
function c_MissionTalk_UnLock(HeadPic,MessageString,Waitsecond)	--人頭圖對話不鎖操作(人頭圖ID , 對話StringID , 不能關掉的秒數)
		C_PortraitDialog(HeadPic , -64 ,false,false,
						C_GetStringFromPreset( MessageString),
						255,false,Waitsecond);
end
--===========主線任務過關煙火==========================================================================
function c_Main_Mission_Complate()
	Sleep(30)
	C_RunScript(OwnerID(), -1, "Main_Mission_Fire1")
	C_RunScript(OwnerID(), -1, "Main_Mission_Fire2")
	C_RunScript(OwnerID(), -1, "Main_Mission_Fire3")
	C_RunScript(OwnerID(), -1, "Main_Mission_Fire4")
	C_RunScript(OwnerID(), -1, "Main_Mission_Fire5")
end
function Main_Mission_Fire1()
	C_AddGameEffect(OwnerID(),"SW001",
					24000,50,50,
					2,
					15, 20, 10,
					1 )
	for i = 1, 8 do
		C_PlaySound( 7040001, OwnerID())
		Sleep(30)
	end
end
function Main_Mission_Fire2()
	Sleep(6)
	C_AddGameEffect(OwnerID(),"SW003",
					27000,50,50,
					2,
					0, 20, 0,
					1 )
	for i = 1, 9 do
		C_PlaySound( 7040002, OwnerID())
		Sleep(30)
	end
end
function Main_Mission_Fire3()
	Sleep(11)
	C_AddGameEffect(OwnerID(),"SW006",
					21000,50,50,
					2,
					-20, 20, 5,
					1 )
	for i = 1, 7 do
		C_PlaySound( 7040003, OwnerID())
		Sleep(30)
	end
end
function Main_Mission_Fire4()
	Sleep(260)
	C_AddGameEffect(OwnerID(),"SW005",
					3000,50,50,
					2,
					0, 20, 10,
					1 )
	C_PlaySound( 7040001, OwnerID())
end
function Main_Mission_Fire5()
	Sleep(19)
	C_AddGameEffect(OwnerID(),"SW004",
					21000,50,50,
					2,
					30, 20, 30,
					1 )
	for i = 1, 7 do
		C_PlaySound( 7040002, OwnerID())
		Sleep(30)
	end
end
--=====以上為共用區============================================================================
--=======龜砲車==============================================================================
--下車提醒
function C_Mission_GetOffCar()
	c_MissionTalk_UnLock(126,8250118,5)	--人頭圖對話不鎖操作(人頭圖gfxID , 對話StringID , 不能關掉的秒數)
end
--==========================================================================
--龜砲車一回提示對話
function C_Mission568Start_Talk()
	c_MissionTalk_UnLock(126,8250106,1)	--人頭圖對話不鎖操作(人頭圖gfxID , 對話StringID , 不能關掉的秒數)
end
function C_Mission568_step1()
	c_MissionTalk_UnLock(126,8250102,1)	--人頭圖對話不鎖操作(人頭圖gfxID , 對話StringID , 不能關掉的秒數)
end
function C_Mission568_step2()
	c_MissionTalk_UnLock(126,8250103,1)	--人頭圖對話不鎖操作(人頭圖gfxID , 對話StringID , 不能關掉的秒數)
end
function C_Mission568_step3()
	c_MissionTalk_UnLock(126,8250114,1)	--人頭圖對話不鎖操作(人頭圖gfxID , 對話StringID , 不能關掉的秒數)
end
function C_Mission568_step4()
	c_MissionTalk_UnLock(126,8250107,3)	--人頭圖對話不鎖操作(人頭圖gfxID , 對話StringID , 不能關掉的秒數)
end
function C_Mission568_stepWrong()
	c_MissionTalk_UnLock(126,8250113,3)	--人頭圖對話不鎖操作(人頭圖gfxID , 對話StringID , 不能關掉的秒數)
end
function C_Mission568_talk1()
	c_MissionTalk_UnLock(126,8250104,1)	--人頭圖對話不鎖操作(人頭圖gfxID , 對話StringID , 不能關掉的秒數)
end
function C_Mission568_talk2()
	c_MissionTalk_UnLock(126,8250105,1)	--人頭圖對話不鎖操作(人頭圖gfxID , 對話StringID , 不能關掉的秒數)
end
--==========================================================================
--龜砲車三回提示對話
function C_Mission570_Talk1()
	c_MissionTalk_UnLock(126,8250108,1)	--人頭圖對話不鎖操作(人頭圖gfxID , 對話StringID , 不能關掉的秒數)
end
function C_Mission570_Talk2()
	c_MissionTalk_UnLock(126,8250109,1)	--人頭圖對話不鎖操作(人頭圖gfxID , 對話StringID , 不能關掉的秒數)
end
function C_Mission570_Talk3()
	c_MissionTalk_UnLock(126,8250110,1)	--人頭圖對話不鎖操作(人頭圖gfxID , 對話StringID , 不能關掉的秒數)
end
function C_Mission570_Talk4()
	c_MissionTalk_UnLock(126,8250111,1)	--人頭圖對話不鎖操作(人頭圖gfxID , 對話StringID , 不能關掉的秒數)
end
function C_Mission570_TalkWrong()
	c_MissionTalk_UnLock(126,8250112,1)	--人頭圖對話不鎖操作(人頭圖gfxID , 對話StringID , 不能關掉的秒數)
end
--==========================================================================
--龜砲車四回提示對話
function C_Mission571_Talk1()
	c_MissionTalk_UnLock(126,8250115,1)	--人頭圖對話不鎖操作(人頭圖gfxID , 對話StringID , 不能關掉的秒數)
end
function C_Mission571_Talk2()
	c_MissionTalk_UnLock(126,8250116,1)	--人頭圖對話不鎖操作(人頭圖gfxID , 對話StringID , 不能關掉的秒數)
end
function C_Mission571_Talk3()
	c_MissionTalk_UnLock(126,8250117,1)	--人頭圖對話不鎖操作(人頭圖gfxID , 對話StringID , 不能關掉的秒數)
end
--=======新手看圖和故事==============================================================================
function lv1003_firstplayersee_1()
	C_PortraitDialog(9 , -64 ,false,false,
					C_GetStringFromPreset( 8200027),
					255,true,1);
	local PicId2 = C_ShowPicAnm( 90001 , 480 , 400 , 0 , 400 , 0 , 1 , 0 , 500 , 380 , 3 , 1 , 3 , 3,true);
			C_PortraitDialog(9 , -64 ,false,false,
							C_GetStringFromPreset( 8200028),
							255,true,1);
			C_ClosePic( PicId2 );
	local PicId3 = C_ShowPicAnm( 90002 , 480 , 400 , 0 , 400 , 0 , 1 , 0 , 500 , 380 , 3 , 1 , 3 , 3,true);
		C_PortraitDialog(8 , -64 ,false,false,
						C_GetStringFromPreset( 8200029),
						255,true,1);
		C_ClosePic( PicId3 );
	local PicId4 = C_ShowPicAnm( 90003 , 480 , 400 , 0 , 400 , 0 , 1 , 0 , 500 , 380 , 3 , 1 , 3 , 3,true);
		C_PortraitDialog(8 , -64 ,false,false,
						C_GetStringFromPreset( 8200030),
						255,true,1);
		C_ClosePic( PicId4 );
	local PicId5 = C_ShowPicAnm( 90004 , 480 , 400 , 0 , 400 , 0 , 1 , 0 , 500 , 380 , 3 , 1 , 3 , 3,true);
		C_PortraitDialog(45 , -64 ,false,false,
						C_GetStringFromPreset( 8200031),
						255,true,1);
		C_ClosePic( PicId5 );
	local PicId6 = C_ShowPicAnm( 90008 , 480 , 400 , 0 , 400 , 0 , 1 , 0 , 500 , 380 , 3 , 1 , 3 , 3,true);
		C_PortraitDialog(45 , -64 ,false,false,
						C_GetStringFromPreset( 8200032),
						255,true,1);
		C_ClosePic( PicId6 );
end
--=====================================================================================
function MissionTalk_860()
	local PicId1 = C_ShowPicAnm( 90012 , 480 , 400 , 0 , 400 , 0 , 1 , 0 , 500 , 380 , 3 , 1 , 3 , 3,true);
	C_PortraitDialog(126 , -64 ,false,false,C_GetStringFromPreset( 8250132),255,false,3);
	Sleep(30)
	C_ClosePic( PicId1 );
end
--=====================================================================================
function MissionTalk_863()
	C_PortraitDialog(8 , -64 ,false,false,C_GetStringFromPreset( 8025000),255,false,3);
end
--=====================================================================================
function MissionTalk_864()
	C_PortraitDialog(8 , -64 ,false,false,C_GetStringFromPreset( 8025003),255,false,3);
end
--=====================================================================================
function MissionTalk_865()
	C_PortraitDialog(110 , -64 ,false,false,C_GetStringFromPreset( 8025006),255,false,3);
end
--=====================================================================================
function MissionTalk_866()
	C_PortraitDialog(110 , -64 ,false,false,C_GetStringFromPreset( 8025009),255,false,3);
end
--=====================================================================================
function MissionTalk_867()
	C_PortraitDialog(109 , -64 ,false,false,C_GetStringFromPreset( 8025012),255,false,3);
end
--=====================================================================================
function MissionTalk_868()
	C_PortraitDialog(93 , -64 ,false,false,C_GetStringFromPreset( 8250146),255,false,3);
end
function MissionTalk_868_1()
	C_PortraitDialog(101 , -64 ,false,false,C_GetStringFromPreset( 8025015),255,false,3);
end
--=====================================================================================
function MissionTalk_869()
	C_PortraitDialog(101 , -64 ,false,false,C_GetStringFromPreset( 8025018),255,false,3);
end
--=====================================================================================
function MissionTalk_870()
	C_PortraitDialog(9 , -64 ,false,false,C_GetStringFromPreset( 8025021),255,false,3);
end
function MissionTalk_870_1()
	C_PortraitDialog(9 , -64 ,false,false,C_GetStringFromPreset( 8025197),255,false,3);
end
--=====================================================================================
function MissionTalk_871()
	C_PortraitDialog(93 , -64 ,false,false,C_GetStringFromPreset( 8250147),255,false,3);
end
function MissionTalk_871_1()
	C_PortraitDialog(101 , -64 ,false,false,C_GetStringFromPreset( 8025024),255,false,3);
end
--踢人兔
function c_Mission868_871_KickPeople()
	local Bunny = C_CreateClientNPC (40163 , 723 , 0, 1788 , 5)
	while true do
		Sleep(30)
		C_PlayAnimation ( Bunny , 06010 )
	end
end
function c_Mission871_StopKick()
	C_StopScript(OwnerID(), "c_Mission868_871_KickPeople")
end
--=====================================================================================
function MissionTalk_872()
	C_PortraitDialog(103 , -64 ,false,false,C_GetStringFromPreset( 8025027),255,false,3);
end
function MissionTalk_873()
	C_PortraitDialog(21 , -64 ,false,false,C_GetStringFromPreset( 8025030),255,false,3);
end
function MissionTalk_874()
	C_PortraitDialog(111 , -64 ,false,false,C_GetStringFromPreset( 8025033),255,false,3);
end
function MissionTalk_875()
	C_PortraitDialog(103, -64 ,false,false,C_GetStringFromPreset( 8025036),255,false,3);
end
function MissionTalk_876()
	C_PortraitDialog(45 , -64 ,false,false,C_GetStringFromPreset( 8250148),255,false,3);
end
function MissionTalk_876_1()
	C_PortraitDialog(101 , -64 ,false,false,C_GetStringFromPreset( 8025039),255,false,5);
end
function MissionTalk_877()
	C_PortraitDialog(45 , -64 ,false,false,C_GetStringFromPreset( 8025042),255,false,3);
end
function MissionTalk_878()
	C_PortraitDialog(45 , -64 ,false,false,C_GetStringFromPreset( 8025045),255,false,3);
end
function MissionTalk_879()
	C_PortraitDialog(15 , -64 ,false,false,C_GetStringFromPreset( 8025048),255,false,3);
end
function MissionTalk_880()
	C_PortraitDialog(18 , -64 ,false,false,C_GetStringFromPreset( 8025050),255,false,3);
end
function MissionTalk_881()
	C_PortraitDialog(18 , -64 ,false,false,C_GetStringFromPreset( 8025053),255,false,3);
end
function MissionTalk_882()
	C_PortraitDialog(110 , -64 ,false,false,C_GetStringFromPreset( 8025056),255,false,3);
end
function MissionTalk_883()
	C_PortraitDialog(15 , -64 ,false,false,C_GetStringFromPreset( 8025059),255,false,3);
end
function MissionTalk_884()
	C_PortraitDialog(15 , -64 ,false,false,C_GetStringFromPreset( 8025062),255,false,3);
end
function MissionTalk_885()
	C_PortraitDialog(15 , -64 ,false,false,C_GetStringFromPreset( 8025065),255,false,3);
end
function MissionTalk_886()
	C_PortraitDialog(108 , -64 ,false,false,C_GetStringFromPreset( 8025068),255,false,3);
end
function MissionTalk_887()
	C_PortraitDialog(108 , -64 ,false,false,C_GetStringFromPreset( 8025071),255,false,3);
end
function MissionTalk_888()
	C_PortraitDialog(94 , -64 ,false,false,C_GetStringFromPreset( 8025074),255,false,3);
end
function MissionTalk_889()
	C_PortraitDialog(94 , -64 ,false,false,C_GetStringFromPreset( 8025077),255,false,3);
end
function MissionTalk_890()
	C_PortraitDialog(95 , -64 ,false,false,C_GetStringFromPreset( 8025080),255,false,3);
end
function MissionTalk_891()
	C_PortraitDialog(95 , -64 ,false,false,C_GetStringFromPreset( 8025083),255,false,3);
end
function MissionTalk_892()
	C_PortraitDialog(95 , -64 ,false,false,C_GetStringFromPreset( 8025086),255,false,3);
end
function MissionTalk_893()
	C_PortraitDialog(95 , -64 ,false,false,C_GetStringFromPreset( 8025089),255,false,3);
end
function MissionTalk_894()
	C_PortraitDialog(95 , -64 ,false,false,C_GetStringFromPreset( 8025092),255,false,3);
end
--=====================================================================================
--打倒兔子大軍
function MissionTalk_895()
	C_PortraitDialog(95 , -64 ,false,false,C_GetStringFromPreset( 8025095),255,false,3);
end
function MissionTalk_895_10()
	C_PortraitDialog(95 , -64 ,false,false,C_GetStringFromPreset( 8250160),255,false,3);
end
function MissionTalk_895_11()
	C_PortraitDialog(95 , -64 ,false,false,C_GetStringFromPreset( 8250161),255,false,3);
end
function MissionTalk_895_12()
	C_PortraitDialog(95 , -64 ,false,false,C_GetStringFromPreset( 8250162),255,false,3);
end
function MissionTalk_895_21()
	C_PortraitDialog(95 , -64 ,false,false,C_GetStringFromPreset( 8250163),	255,false,3);
end
function MissionTalk_895_22()
	C_PortraitDialog(95 , -64 ,false,false,C_GetStringFromPreset( 8250164),255,false,3);
end
function MissionTalk_895_31()
	C_PortraitDialog(94 , -64 ,false,false,C_GetStringFromPreset( 8250165),255,false,3);
end
function MissionTalk_895_41()
	C_PortraitDialog(34 , -64 ,false,false,C_GetStringFromPreset( 8250166),255,false,3);
end
function C_Mission895_Tank1()
	local Tank = C_CreateClientNPC (3803 , 4984 , 1, 195 , 6)
	C_Move ( Tank , 4697,0,1249 , true )
	while true do
		Sleep((math.random(20,30)))
		C_PlayAnimation ( Tank , 06010 )
	end
end
function C_Mission895_Tank2()
	local Tank = C_CreateClientNPC (3803 , 5560 , 1, 195 , 6)
	C_Move ( Tank , 5112,0,-86 , true )
	while true do
		Sleep((math.random(20,30)))
		C_PlayAnimation ( Tank , 06010 )
	end
end
function C_Mission895_Tank3()
	local Tank = C_CreateClientNPC (3803 , 3287 , 1, 531 , 6)
	C_Move ( Tank , 4011,0,-70 , true )
	while true do
		Sleep((math.random(20,30)))
		C_PlayAnimation ( Tank , 06010 )
	end
end
function C_Mission895_Tank4()
	local Tank = C_CreateClientNPC (3803 , 4565 , 1, 556 , 6)
	C_Move ( Tank , 3756,0,549 , true )
	while true do
		Sleep((math.random(20,30)))
		C_PlayAnimation ( Tank , 06010 )
	end
end
function C_Mission895_Tank5()
	local Tank = C_CreateClientNPC (3803 , 2200 , 1, -1099 , 6)
	C_Move ( Tank , 3049,0,-236 , true )
	while true do
		Sleep((math.random(20,30)))
		C_PlayAnimation ( Tank , 06010 )
	end
end
function C_Mission895_Tank6()
	local Tank = C_CreateClientNPC (3803 , 1461 , 5, 1340 , 6)
	C_Move ( Tank , 2046,0,131, true )
	while true do
		Sleep((math.random(20,30)))
		C_PlayAnimation ( Tank , 06010 )
	end
end
--=====================================================================================
function MissionTalk_896()
	C_PortraitDialog(95 , -64 ,false,false,C_GetStringFromPreset( 8025098),255,false,3);
end
function MissionTalk_897()
	C_PortraitDialog(95 , -64 ,false,false,C_GetStringFromPreset( 8025101),255,false,3);
end
function MissionTalk_898()
	C_PortraitDialog(114 , -64 ,false,false,C_GetStringFromPreset( 8025104),255,false,3);
end
function MissionTalk_899()
	C_PortraitDialog(114 , -64 ,false,false,C_GetStringFromPreset( 8025107),255,false,3);
end
function MissionTalk_900()
	C_PortraitDialog(115 , -64 ,false,false,C_GetStringFromPreset( 8025110),255,false,3);
end
function MissionTalk_901()
	C_PortraitDialog(115 , -64 ,false,false,C_GetStringFromPreset( 8025113),255,false,3);
end
--=================================================================================
function MissionTalk_902()
	C_PortraitDialog(114 , -64 ,false,false,C_GetStringFromPreset( 8025116),255,false,3);
end
--矮小兔長大
function c_Mission902End()
	C_SetScale ( TargetID() , 6, 10)
end
--=================================================================================
function MissionTalk_903()
	C_PortraitDialog(114 , -64 ,false,false,
					C_GetStringFromPreset( 8025119),
					255,false,3);
end
--=================================================================================
function MissionTalk_904()
	C_PortraitDialog(114 , -64 ,false,false,
					C_GetStringFromPreset( 8025122),
					255,false,3);
end
--=================================================================================
function MissionTalk_905_1()
	C_PortraitDialog(116 , -64 ,false,false,C_GetStringFromPreset( 8025199),255,false,3);
end
function MissionTalk_905()
	C_PortraitDialog(116 , -64 ,false,false,C_GetStringFromPreset( 8025125),255,false,3);
end
--看的誠意秀圖
function c_Missionshowpic_905_1()
	Sleep(5)
	local PicId1 = C_ShowPicAnm(  90005, 480 , 400 , 0 , 40000 , 0 , 1 , 0 , 500 , 700 , 3 , 1 , 3 , 3,true);
	Sleep(20)
	C_ClosePic( PicId1 );
end
function c_Missionshowpic_905_2()
	Sleep(5)
	local PicId12 = C_ShowPicAnm( 90006 , 480 , 400 , 0 , 400 , 0 , 1 , 0 , 500 , 380 , 3 , 1 , 3 , 3,true);
	Sleep(20)
	C_ClosePic( PicId12 );
end
function c_Missionshowpic_905_3()
	Sleep(5)
	local PicId13 = C_ShowPicAnm( 90007 , 480 , 400 , 0 , 400 , 0 , 1 , 0 , 500 , 380 , 3 , 1 , 3 , 3,true);
	Sleep(20)
	C_ClosePic( PicId13 );
end
--=====================================================================================
function MissionTalk_906()
	C_PortraitDialog(114 , -64 ,false,false,C_GetStringFromPreset( 8025128),255,false,3);
end
--=================================================================================
function MissionTalk_907_1()
	C_PortraitDialog(115 , -64 ,false,false,C_GetStringFromPreset( 8025200),255,false,3);
end
function MissionTalk_907()
	C_PortraitDialog(115 , -64 ,false,false,C_GetStringFromPreset( 8025131),255,false,3);
end
--=====================================================================================
function MissionTalk_908_1()
	C_PortraitDialog(114 , -64 ,false,false,
					C_GetStringFromPreset( 8025134),
					255,false,3);
end
function MissionTalk_908()
	C_PlaySound(7040008,OwnerID())
	local Ran = (math.random(1,5))
	local HUDList = {8250150 , 8250151 , 8250152 , 8250153 , 8250154}
	C_PortraitDialog(34, -64 ,false,false,C_GetStringFromPreset( HUDList[Ran]),255,false,3);
end
function MissionTalk_908die()
	C_PortraitDialog(34 , -64 ,false,false,C_GetStringFromPreset( 8250155),255,false,3);
end
--=====================================================================================
function MissionTalk_910()
	C_PortraitDialog(114 , -64 ,false,false,C_GetStringFromPreset( 8025137),255,false,3);
end
function MissionTalk_911()
	C_PortraitDialog(114 , -64 ,false,false,C_GetStringFromPreset( 8025140),255,false,3);
end
function MissionTalk_912()
	C_PortraitDialog(33 , -64 ,false,false,C_GetStringFromPreset( 8025143),255,false,3);
end
function MissionTalk_913()
	C_PortraitDialog(104 , -64 ,false,false,C_GetStringFromPreset( 8025146),255,false,3);
end
function MissionTalk_915()
	C_PortraitDialog(104 , -64 ,false,false,C_GetStringFromPreset( 8025149),255,false,3);
end
function MissionTalk_916()
	C_PortraitDialog(114 , -64 ,false,false,C_GetStringFromPreset( 8025152),255,false,3);
end
function MissionTalk_917()
	C_PortraitDialog(114 , -64 ,false,false,C_GetStringFromPreset( 8025155),255,false,3);
end
function MissionTalk_918()
	C_PortraitDialog(104 , -64 ,false,false,C_GetStringFromPreset( 8025158),255,false,3);
end
function MissionTalk_918_1()
	C_PortraitDialog(104 , -64 ,false,false,C_GetStringFromPreset( 8025201),255,false,3);
end
function MissionTalk_919()
	C_PortraitDialog(33 , -64 ,false,false,C_GetStringFromPreset( 8025161),255,false,3);
end
function MissionTalk_920()
	C_PortraitDialog(105 , -64 ,false,false,C_GetStringFromPreset( 8025164),255,false,3);
end
function MissionTalk_921()
	C_PortraitDialog(105 , -64 ,false,false,C_GetStringFromPreset( 8025167),255,false,3);
end
function MissionTalk_922()
	C_PortraitDialog(105 , -64 ,false,false,C_GetStringFromPreset( 8025170),255,false,3);
end
--=================================================================================
--花開花
function c_Mission923End()
	C_PlayAnimation ( TargetID(), 00050)
end
--=================================================================================
function MissionTalk_925()
	C_PortraitDialog(105 , -64 ,false,false,C_GetStringFromPreset( 8025179),255,false,3);
end
--臭氣變泡泡
function Mission925_ClineTriggerOn1()
	C_SetTriggerVisible(7,false)--trigger顯示
	C_SetTriggerVisible(71,true)
end
function Mission925_ClineTriggerOn2()
	C_SetTriggerVisible(8,false)--trigger顯示
	C_SetTriggerVisible(81,true)
end
function Mission925_ClineTriggerOn3()
	C_SetTriggerVisible(9,false)--trigger顯示
	C_SetTriggerVisible(91,true)
end
--=================================================================================
function MissionTalk_926()
	C_PortraitDialog(105 , -64 ,false,false,C_GetStringFromPreset( 8025194),255,false,3);
end
function MissionTalk_926_1()
	C_PortraitDialog(105 , -64 ,false,false,C_GetStringFromPreset( 8025202),255,false,3);
end
--=================================================================================
function MissionTalk_927()
	C_PortraitDialog(30 , -64 ,false,false,C_GetStringFromPreset( 8025182),255,false,3);
end
function MissionTalk_928()
	C_PortraitDialog(114 , -64 ,false,false,C_GetStringFromPreset( 8025185),255,false,3);
end
--==========================================================================
function MissionTalk_929()
	C_PortraitDialog(30 , -64 ,false,false,C_GetStringFromPreset( 8025188),255,false,3);
end
--跳跳比賽跳繩說話
function MissionTalk_929_1()
	C_PortraitDialog(30 , -64 ,false,false,C_GetStringFromPreset( 8250122),255,false,1);
end
function MissionTalk_929_2()
	C_PortraitDialog(30 , -64 ,false,false,C_GetStringFromPreset( 8250123),255,false,1);
end
function MissionTalk_929_3()
	C_PortraitDialog(30 , -64 ,false,false,C_GetStringFromPreset( 8250124),255,false,1);
end
function MissionTalk_929_4()
	C_PortraitDialog(32 , -64 ,false,false,C_GetStringFromPreset( 8250125),255,false,1);
end
function MissionTalk_929_5()
	C_PortraitDialog(29 , -64 ,false,false,C_GetStringFromPreset( 8250126),255,false,1);
end
function MissionTalk_929_7()
	C_PortraitDialog(32 , -64 ,false,false,C_GetStringFromPreset( 8250121),255,false,1);
end
function MissionTalk_929_8()
	C_PortraitDialog(30 , -64 ,false,false,C_GetStringFromPreset( 8250136),255,false,1);
end
--跳跳比賽跳繩
function c_Mission929_StartMusic()	--放音樂
	 C_PlayMusic( 39, false )
end
function c_Mission929_EndMusic()	--停音樂
	 C_PlayMusic( 112, true )
end
function c_Mission929_Sound()	--放音效
	C_PlaySound( 7040007, OwnerID())
end
function c_Mission929_ClineTriggerOn()	--Trigger反彈作用
	C_SetTriggerEnable(40159 , true )
end
function c_Mission929_ClineTriggerOff()	--Trigger反彈不作用
	C_SetTriggerEnable(40159 , false )
end
function c_Mission929_ItemSkill()	--使用跳繩動作、特效
	C_PlayAnimation (OwnerID() , "00040")
	C_AddGameEffect(OwnerID(),	--特效要貼附在場景中的哪個物件身上
					"SEF20023",	--特效物件的樣板名稱
					700,		--特效要出現多久毫秒）
					0,			--要花多久的時間進行淡入
					0,			--要花多久的時間進行淡出
					1,			--要讓特效貼附在owner的哪個部位
					0, 0, 0,	--XYZ軸篇移量
					0.7 )		--縮放
	C_RunScript(OwnerID(), -1, "c_Mission929_ItemSkillStop")
end
function c_Mission929_ItemSkillStop()	--技能動作停止、觸發效果停止
	local OID = OwnerID()
	Sleep(7)
	C_PlayAnimation (OID, "00010")
	C_RunServerScript(OID , OID, "Mission929_UseItemOver")
end
--==========================================================================
function MissionTalk_930()
	C_PortraitDialog(31 , -64 ,false,false,C_GetStringFromPreset( 8025191),255,false,3);
end
function MissionTalk_931()
	C_PortraitDialog(45 , -64 ,false,false,C_GetStringFromPreset( 8025203),255,false,3);
end
function MissionTalk_932()
	C_PortraitDialog(45 , -64 ,false,false,C_GetStringFromPreset( 8025206),255,false,3);
end
function MissionTalk_933()
	C_PortraitDialog(45 , -64 ,false,false,C_GetStringFromPreset( 8025209),255,false,3);
end
--=====================================================================================
--象城主線任務
--=====================================================================================
function MissionTalk_934()
	C_PortraitDialog(45 , -64 ,false,false,C_GetStringFromPreset( 8025212),255,false,3);
end
function MissionTalk_935()
	C_PortraitDialog(121 , -64 ,false,false,C_GetStringFromPreset( 8025215),255,false,3);
end
function MissionTalk_936()
	C_PortraitDialog(20 , -64 ,false,false,C_GetStringFromPreset( 8025218),255,false,3);
end
--=====================================================================================
function MissionTalk_937()
	C_PortraitDialog(20 , -64 ,false,false,C_GetStringFromPreset( 8025221),255,false,3);
end
function MissionTalk_937_1()
	C_PlaySound( 7040013, TargetID())
	c_MissionTalk_UnLock(110, 8252914, 1)
end
--=====================================================================================
function MissionTalk_938()
	C_PortraitDialog(110 , -64 ,false,false,C_GetStringFromPreset( 8025224),255,false,3);
end
--=====================================================================================
function MissionTalk_939()
	c_MissionTalk_UnLock(109, 8025227, 3)
	C_RunScript(OwnerID(), -1, "MissionTalk_939_PlaySound")
	Sleep(10)
	c_MissionTalk_UnLock(14, 8252918, 3)
	Sleep(5)
	C_StopScript(OwnerID(), "MissionTalk_939_PlaySound")
	c_MissionTalk_UnLock(109, 8252919, 3)
end
function MissionTalk_939_PlaySound()
	while true do
		C_PlaySound( 7040009, OwnerID())
		Sleep(13)
	end
end
--=====================================================================================
function MissionTalk_940()
	C_PortraitDialog(122 , -64 ,false,false,C_GetStringFromPreset( 8025230),255,false,3);
end
function MissionTalk_941()
	C_PortraitDialog(122 , -64 ,false,false,C_GetStringFromPreset( 8025233),255,false,3);
end
function MissionTalk_942()
	C_PortraitDialog(123 , -64 ,false,false,C_GetStringFromPreset( 8025236),255,false,3);
end
function MissionTalk_943()
	C_PortraitDialog(123 , -64 ,false,false,C_GetStringFromPreset( 8025239),255,false,3);
end
function MissionTalk_944()
	C_PortraitDialog(123 , -64 ,false,false,C_GetStringFromPreset( 8025242),255,false,3);
end
function MissionTalk_945()
	C_PortraitDialog(123 , -64 ,false,false,C_GetStringFromPreset( 8025245),255,false,3);
end
function MissionTalk_946()
	C_PortraitDialog(125 , -64 ,false,false,C_GetStringFromPreset( 8025248),255,false,3);
end
--================================================================================
function MissionTalk_947()
	C_PortraitDialog(125 , -64 ,false,false,C_GetStringFromPreset( 8025251),255,false,3);
end
--髒水變清水
function Mission947_ClineTriggerOn()
	C_SetTriggerVisible(94703,true)
	Sleep(20)
	C_SetTriggerVisible(94702,true)--trigger顯示
	C_SetTriggerVisible(94701,false)
end
--=================================================================================
function MissionTalk_948()
	C_PortraitDialog(125 , -64 ,false,false,C_GetStringFromPreset( 8025254),255,false,3);
end
function MissionTalk_949()
	C_PortraitDialog(124 , -64 ,false,false,C_GetStringFromPreset( 8025257),255,false,3);
end
function MissionTalk_950()
	C_PortraitDialog(123 , -64 ,false,false,C_GetStringFromPreset( 8025260),255,false,3);
end
function MissionTalk_951()
	C_PortraitDialog(53 , -64 ,false,false,C_GetStringFromPreset( 8025263),255,false,3);
end
--=====================================================================================
function MissionTalk_952()
	C_PortraitDialog(9 , -64 ,false,false,
					C_GetStringFromPreset( 8025266),
					255,false,3);
end
function c_MissionTalk_952_1()	--象王說話+表演攻擊
	local OID , TID = OwnerID() , TargetID()
	c_MissionTalk_Lock(54, 8252916, 3)	--象說話
	Sleep(1)
	C_PlayAnimation ( TID, 06010)	--象打人
	C_SetTriggerEnable(95201 , true )
	Sleep(5)
	C_PlaySound( 4010, OID)
	C_AddGameEffect(OID,"EF0001",	--特效
				2000,0,0,
				1,
				0, 0, 0,
				2 )
	C_PlayAnimation ( OID, 04013)	--人跌到
	Sleep(10)
	C_RunServerScript(OID , OID, "Mission952_Teleport")
end
function c_Mission952_turn95201off()
	C_SetTriggerEnable(95201 , false )
end
--=====================================================================================
function MissionTalk_953()
	C_PortraitDialog(123 , -64 ,false,false,
					C_GetStringFromPreset( 8025270),
					255,false,3);
end
function MissionTalk_954()
	C_PortraitDialog(21 , -64 ,false,false,
					C_GetStringFromPreset( 8025273),
					255,false,3);
end
--=====================================================================================
function MissionTalk_955()
	C_PortraitDialog(21 , -64 ,false,false,
					C_GetStringFromPreset( 8025276),
					255,false,3);
end
--955點火堆事件
function c_MatchGirl(Pic, MessageString)
	local PicId = C_ShowPicAnm( Pic , 480 , 400 , 0 , 400 , 0 , 1 , 0 , 500 , 380 , 3 , 1 , 3 , 3,true);
		c_MissionTalk_Lock(126, MessageString, 2)
		C_ClosePic( PicId );
end
function c_MatchGirl3()
	c_MatchGirl(90011, 8252929) --大餐
end
function c_MatchGirl2()
	c_MatchGirl(90010, 8252928) --玩具
end
function c_MatchGirl1()
	c_MatchGirl(90009,8252927 )	--(圖ID,文字ID)--阿嬤
end
function c_WoodFired_0()
	for i = 0 , 2 do
		C_SetTriggerVisible(95501 + i, true)
		C_SetTriggerVisible(95511 + i, false)
	end
end
function c_WoodFired_1()
	C_SetTriggerVisible(95511,true)	--火顯示
	C_SetTriggerVisible(95501,false)	--木堆消失
end
function c_WoodFired_2()
	C_SetTriggerVisible(95512,true)
	C_SetTriggerVisible(95502,false)
end
function c_WoodFired_3()
	C_SetTriggerVisible(95513,true)
	C_SetTriggerVisible(95503,false)
end
--=====================================================================================
function MissionTalk_956()
	C_PortraitDialog(21 , -64 ,false,false,C_GetStringFromPreset( 8025279),255,false,3);
end
function MissionTalk_957()
	C_PortraitDialog(123 , -64 ,false,false,C_GetStringFromPreset( 8025282),255,false,3);
end
function MissionTalk_958()
	C_PortraitDialog(112 , -64 ,false,false,C_GetStringFromPreset( 8025285),255,false,3);
end
function MissionTalk_959()
	C_PortraitDialog(112 , -64 ,false,false,C_GetStringFromPreset( 8025288),255,false,3);
end
--=====================================================================================
function MissionTalk_960()
	c_MissionTalk_UnLock(54, 8025291, 3)
end
function c_Mission_960_ElephonShock()
	Sleep(10)
	c_MissionTalk_UnLock(117, 8252917, 3)
	C_PlaySound( 7040010, OwnerID())
	C_PlayAnimation ( TargetID(), 00050)
end
--=====================================================================================
function MissionTalk_961()
	C_PlaySound( 7040010, OwnerID())
	c_MissionTalk_UnLock(117, 8025294, 3)
	C_SetTriggerEnable(9901,true)--trigger啟動
	C_SetTriggerVisible(9902,true)--trigger顯示
end
function c_Mission_961_ElephonShocked()
	C_PlayAnimation ( TargetID(), 00050)
end
function c_Mission_961_ElephonGetup()
	Sleep(10)
	C_PlayAnimation ( TargetID(), 00012)
end
--=======拯救象王事件==============================================================================
function MissionTalk_961_1()
	Sleep(10)
	C_PlaySound( 7040012, OwnerID())
	local PicId1 = C_ShowPicAnm( 4049 , 440 , 110 , 0 , 900 , 0 , 3 , 0 , 480 , 261 , 1 , 1 , 3 , 3,true)
	C_PortraitDialog(117 , -64 ,false,false,C_GetStringFromPreset( 8252933),255,false,1);
	C_ClosePic( PicId1 )
end
function MissionTalk_961_2()
	Sleep(10)
	C_PlaySound( 7040010, OwnerID())
	local PicId2 = C_ShowPicAnm( 4049 , 440 , 110 , 0 , 450 , 0 , 1 , 0 , 480 , 261 , 1 , 1 , 3 , 3,true)
	C_PortraitDialog(117 , -64 ,false,false,C_GetStringFromPreset( 8252934),255,false,1);
	C_ClosePic( PicId2 )
end
function MissionTalk_961_3()
	Sleep(10)
	local PicId3 = C_ShowPicAnm( 4049 , 440 , 110 , 0 , 350 , 0 , 4 , 0 , 480 , 261 , 1 , 1 , 3 , 3,true)
	C_RunScript(OwnerID(), -1, "MissionTalk_961_3_PlaySound")
	C_PortraitDialog(117 , -64 ,false,false,C_GetStringFromPreset( 8252935),255,false,5);
	C_ClosePic( PicId3 )
	C_SetTriggerEnable(9901,false)--trigger啟動
	C_SetTriggerVisible(9902,false)--trigger顯示
end
function MissionTalk_961_3_PlaySound()
	for i=0,5 do
		Sleep(10)
		C_PlaySound( 7040012, OwnerID())
	end
end
--=====================================================================================
function MissionTalk_962()
	c_MissionTalk_UnLock(113, 8025298, 3)
end
function MissionTalk_963()
	c_MissionTalk_UnLock(53, 8025301, 3)
end
--=====================================================================================
function MissionTalk_964()
	c_MissionTalk_UnLock(99, 8025304, 3)
end
function MissionTalk_964_1()
	c_MissionTalk_UnLock(99, 8200033, 3)
end
function c_Mission964_AlchemyFailed_Boom()
	C_AddGameEffect(OwnerID(),"EF0201",
					2000,0,0,
					1,
					0, 0, 0,
					3 )
	C_PlaySound( 5166020, OwnerID())
end
--=====================================================================================
--彪城主線任務
--=====================================================================================
function MissionTalk_965()
	C_PortraitDialog(129 , -64 ,false,false,C_GetStringFromPreset( 8025307),255,false,3);
end
function MissionTalk_966()
	C_PortraitDialog(129 , -64 ,false,false,C_GetStringFromPreset( 8025310),255,false,3);
end
function MissionTalk_967()
	C_PortraitDialog(94 , -64 ,false,false,C_GetStringFromPreset( 8025313),255,false,3);
end
function MissionTalk_968()
	C_PortraitDialog(94 , -64 ,false,false,C_GetStringFromPreset( 8025316),255,false,3);
end
function MissionTalk_969()
	C_PortraitDialog(129 , -64 ,false,false,C_GetStringFromPreset( 8025319),255,false,3);
end
function MissionTalk_970()
	C_PortraitDialog(129 , -64 ,false,false,C_GetStringFromPreset( 8025322),255,false,3);
end
function MissionTalk_971()
	C_PortraitDialog(96 , -64 ,false,false,C_GetStringFromPreset( 8025326),255,false,3);
end
function MissionTalk_972()
	C_PortraitDialog(96 , -64 ,false,false,C_GetStringFromPreset( 8025329),255,false,3);
end
function MissionTalk_973()
	C_PortraitDialog(139 , -64 ,false,false,C_GetStringFromPreset( 8025332),255,false,3);
end
function MissionTalk_974()
	C_PortraitDialog(139 , -64 ,false,false,C_GetStringFromPreset( 8025335),255,false,3);
end
--=================================================================================
function MissionTalk_975()
	C_PortraitDialog(95 , -64 ,false,false,C_GetStringFromPreset( 8025339),255,false,3);
end
--冒煙處消失
function Mission975_ClineTriggerOn1()
	C_SetTriggerVisible(7,false)--trigger顯示
end
function Mission975_ClineTriggerOn2()
	C_SetTriggerVisible(8,false)--trigger顯示
end
function Mission975_ClineTriggerOn3()
	C_SetTriggerVisible(9,false)--trigger顯示
end
function Mission975_open()
	C_SetTriggerVisible(7,true)--trigger顯示
	C_SetTriggerVisible(8,true)--trigger顯示
	C_SetTriggerVisible(9,true)--trigger顯示
end
--=================================================================================
function MissionTalk_976()
	C_PortraitDialog(95 , -64 ,false,false,C_GetStringFromPreset( 8025342),255,false,3);
end
function MissionTalk_977()
	C_PortraitDialog(94 , -64 ,false,false,C_GetStringFromPreset( 8025345),255,false,3);
end
function MissionTalk_978()
	C_PortraitDialog(129 , -64 ,false,false,C_GetStringFromPreset( 8025348),255,false,3);
end
--=====================================================================================
function MissionTalk_979()
	C_PortraitDialog(55 , -64 ,false,false,
					C_GetStringFromPreset( 8025351),
					255,false,3);
end
--彪眼鏡
Mission979to986_createNPC_Monkey = 0	--記錄生出的宋江編號
Mission979to986_createNPC_Cannon = 0	--記錄生出的砲車編號
function c_Mission979_to_986_TriggerIN()	--刪除舊的，召喚新的宋江砲車
	C_DestroyClientObj ( Mission979to986_createNPC_Monkey )
	C_DestroyClientObj ( Mission979to986_createNPC_Cannon )
	Mission979to986_createNPC_Monkey = C_CreateClientNPC (40160 , 4770,3,68 , 1)
	Mission979to986_createNPC_Cannon = C_CreateClientNPC (3803 , 4600,3,200 , 3)
end
function c_Mission986GlassBreak()	--打破彪王眼鏡
	local Liger_1 = C_CreateClientNPC (40174 , 5800,3,-208 , 6)
	local Liger_2 = C_CreateClientNPC (40174 , 5900,3,-228 , 6)
	local Liger_3 = C_CreateClientNPC (40174 , 5850,3,-248 , 6)
	local Liger_4 = C_CreateClientNPC (40174 , 5750,3,-188 , 6)
	local Liger_List = { Liger_1, Liger_2, Liger_3, Liger_4}
	C_PortraitDialog(56 , -64 ,false,false,C_GetStringFromPreset( 8253456),255,false,1)
	C_PortraitDialog(14 , -64 ,false,false,C_GetStringFromPreset( 8253442),255,false,1)
	C_Move ( Liger_1 , 4770,3,70 , true )
	C_Move ( Liger_2 , 4700,3,70 , true )
	C_Move ( Liger_3 , 4630,3,70 , true )
	C_Move ( Liger_4 , 4770,3,140 , true )
	C_PortraitDialog(56 , -64 ,false,false,C_GetStringFromPreset( 8253435),255,false,3)
	Sleep(5)
	for j = 1 , 3 do
		for i = 1 , 4 do
			C_PlayAnimation ( Liger_List[i] , 06010 )
			Sleep(2)
			C_PlaySound( 4010, OwnerID())
		end
	end
	C_PlayAnimation ( Mission979to986_createNPC_Cannon , 00050 )
	C_PortraitDialog(14 , -64 ,false,false,C_GetStringFromPreset( 8253436),255,false,1)
	for i = 1 , 4 do
	C_Move ( Liger_List[i] , 6291+i,6,1426+10*i , true )
	end
	C_Move ( Mission979to986_createNPC_Monkey , 6291,6,1416 , true )
	Sleep(80)
	for i = 1 , 4 do
	C_DestroyClientObj ( Liger_List[i] )
	end
	C_DestroyClientObj ( Mission979to986_createNPC_Monkey )
	C_DestroyClientObj ( Mission979to986_createNPC_Cannon )
end
--=====================================================================================
function MissionTalk_980()
	C_PortraitDialog(55 , -64 ,false,false,C_GetStringFromPreset( 8025354),255,false,3);
end
function MissionTalk_981()
	C_PortraitDialog(142 , -64 ,false,false,C_GetStringFromPreset( 8025357),255,false,3);
end
function MissionTalk_982()
	C_PortraitDialog(127 , -64 ,false,false,C_GetStringFromPreset( 8025360),255,false,3);
end
function MissionTalk_983()
	C_PortraitDialog(120 , -64 ,false,false,C_GetStringFromPreset( 8025363),255,false,3);
end
--=====================================================================================
function MissionTalk_984()
	C_PortraitDialog(120 , -64 ,false,false,C_GetStringFromPreset( 8025366),255,false,3);
end
function MissionTalk_984_1()
	C_PortraitDialog(121 , -64 ,false,false,C_GetStringFromPreset( 8253412),255,false,1);
	C_PortraitDialog(127 , -64 ,false,false,C_GetStringFromPreset( 8253413),255,false,1);
end
--=====================================================================================
--彪王真面目
function MissionTalk_985()
	C_PortraitDialog(127 , -64 ,false,false,C_GetStringFromPreset( 8025370),255,false,3);
end
function MissionTalk_985_1()
	local PicId1 = C_ShowPicAnm( 90013 , 480 , 400 , 0 , 400 , 0 , 1 , 0 , 500 , 380 , 3 , 1 , 3 , 3,true)
	C_PortraitDialog(126 , -64 ,false,false,C_GetStringFromPreset( 8253428),255,false,1);
	C_ClosePic( PicId1 )
end
function MissionTalk_985_2()
	local PicId2 = C_ShowPicAnm( 90014 , 480 , 400 , 0 , 400 , 0 , 1 , 0 , 500 , 380 , 3 , 1 , 3 , 3,true)
	C_PortraitDialog(126 , -64 ,false,false,C_GetStringFromPreset( 8253429),255,false,1);
	C_ClosePic( PicId2 )
end
function MissionTalk_985_3()
	C_PortraitDialog(126 , -64 ,false,false,C_GetStringFromPreset( 8253430),255,false,1);
end

--=====================================================================================
function MissionTalk_986()
	C_PortraitDialog(127 , -64 ,false,false,C_GetStringFromPreset( 8025373),255,false,3);
end
function MissionTalk_987()
	C_PortraitDialog(127 , -64 ,false,false,C_GetStringFromPreset( 8025376),255,false,3);
end
function MissionTalk_988()
	C_PortraitDialog(127 , -64 ,false,false,C_GetStringFromPreset( 8025379),255,false,3);
end
function MissionTalk_989()
	C_PortraitDialog(94 , -64 ,false,false,C_GetStringFromPreset( 8025382),255,false,3);
end
function MissionTalk_990()
	C_PortraitDialog(94 , -64 ,false,false,C_GetStringFromPreset( 8025385),255,false,3);
end
function MissionTalk_991()
	C_PortraitDialog(128 , -64 ,false,false,C_GetStringFromPreset( 8025388),255,false,3);
end
function MissionTalk_992()
	C_PortraitDialog(90 , -64 ,false,false,C_GetStringFromPreset( 8025391),255,false,3);
end
function MissionTalk_993()
	C_PortraitDialog(128 ,-64 ,false,false,C_GetStringFromPreset( 8025394),255,false,3);
end
function MissionTalk_994()
	C_PortraitDialog(137 , -64 ,false,false,C_GetStringFromPreset( 8025397),255,false,3);
end
--=====================================================================================
--金獅石像講話
function MissionTalk_995()
	C_PortraitDialog(137 , -64 ,false,false,C_GetStringFromPreset( 8025400),255,false,3);
end
function MissionTalk_995_0()
	C_PortraitDialog(131 , -64 ,false,false,C_GetStringFromPreset( 8253457),255,false,1);
end
function MissionTalk_995_1()
	C_PortraitDialog(131 , -64 ,false,false,C_GetStringFromPreset( 8253416),255,false,1);
end
function MissionTalk_995_2()
	C_PortraitDialog(90 , -64 ,false,false,C_GetStringFromPreset( 8253417),255,false,1);
end
function MissionTalk_995_3()
	C_PortraitDialog(90 , -64 ,false,false,C_GetStringFromPreset( 8253418),255,false,1);
end
function MissionTalk_995_4()
	C_PortraitDialog(90 , -64 ,false,false,C_GetStringFromPreset( 8253419),255,false,1);
end
--=====================================================================================

function MissionTalk_996()
	C_PortraitDialog(128 , -64 ,false,false,C_GetStringFromPreset( 8025404),255,false,3);
end
function MissionTalk_997()
	C_PortraitDialog(95 , -64,false,false,C_GetStringFromPreset( 8025407),255,false,3);
end
function MissionTalk_998()
	C_PortraitDialog(95 , -64,false,false,C_GetStringFromPreset( 8025410),255,false,3);
end
function MissionTalk_999()
	C_PortraitDialog(95 , -64 ,false,false,C_GetStringFromPreset( 8025413),255,false,3);
end
function MissionTalk_1000()
	C_PortraitDialog(95 , -64 ,false,false,C_GetStringFromPreset( 8025416),255,false,3);
end
function MissionTalk_1001()
	C_PortraitDialog(137 , -64 ,false,false,C_GetStringFromPreset( 8025419),255,false,3);
end
--======================================================================================
--腳印表演
function MissionTalk_1002()
	C_PortraitDialog(137, -64 ,false,false,C_GetStringFromPreset( 8025422),255,false,3);
	local L_point = { 6,6,7 ,7,6,6,6,4,4,4 }
	local L_pointX = { 2483 ,2874 ,3189,3621,4466,5053,5725,5959,6050,6254 }
	local L_pointZ = {  974 , 887,561,106,-75,-174,-185,242,779,1048}
	local T_point = { 6,6,7 ,7,6,6,6,4,7,7 }
	local T_pointX = { 2483 ,2835 ,3113,3733,4379,4906,5864,6183,6482,6600 }
	local T_pointZ = {  974 , 811,386,84,-160,-266,-141,-111,-294,-594 }

	for i=1,10 do
	local Liger = C_CreateClientNPC (30130 , L_pointX[i] , 10, L_pointZ[i] , L_point[i])
	local Tiger = C_CreateClientNPC (30131 , T_pointX[i] , 10, T_pointZ[i] , T_point[i])
	end
end
function Mission1002_Footprint()
	local L_point = { 6,6,7 ,7,6,6,6,4,4,4 }
	local L_pointX = { 2483 ,2874 ,3189,3621,4466,5053,5725,5959,6050,6254 }
	local L_pointZ = {  974 , 887,561,106,-75,-174,-185,242,779,1048}
	local T_point = { 6,6,7 ,7,6,6,6,4,7,7 }
	local T_pointX = { 2483 ,2835 ,3113,3733,4379,4906,5864,6183,6482,6600 }
	local T_pointZ = {  974 , 811,386,84,-160,-266,-141,-111,-294,-594 }

	for i=1,10 do
	local Liger = C_CreateClientNPC (30130 , L_pointX[i] , 6, L_pointZ[i] , L_point[i])
	local Tiger = C_CreateClientNPC (30131 , T_pointX[i] , 6, T_pointZ[i] , T_point[i])
	end
end
--======================================================================================
function MissionTalk_1003()
	C_PortraitDialog(138 , -64 ,false,false,C_GetStringFromPreset( 8025425),255,false,3);
end
function MissionTalk_1004()
	C_PortraitDialog(138 , -64 ,false,false,C_GetStringFromPreset( 8025428),255,false,3);
end
function MissionTalk_1005()
	C_PortraitDialog(130 , -64 ,false,false,C_GetStringFromPreset( 8025431),255,false,3);
end
--=================================================================
function MissionTalk_1006()
	C_PortraitDialog(130 , -64 ,false,false, C_GetStringFromPreset( 8025434), 255, false, 3);
end
function MissionTalk_1006_1()
	c_MissionTalk_UnLock(130, 8253446, 1)
end
function MissionTalk_1006_2()
	c_MissionTalk_UnLock(130, 8253447, 1)
end
function c_Mission1006_sound()
	C_PlaySound( 7040016, OwnerID())
end
--=================================================================
function MissionTalk_1007()
	C_PortraitDialog(130 , -64 ,false,false,C_GetStringFromPreset( 8025437),255,false,3);
end
--============呼叫阮小七=====================================================
function MissionTalk_1008()
	C_PortraitDialog(119 , -64 ,false,false,C_GetStringFromPreset( 8025440),255,false,3);
end
function Mission1008_call()
	C_AddGameEffect(OwnerID(),"SW011",
					3000,50,50,
					2,
					15, 20, 10,
					1 )
	C_PlaySound( 7040001, OwnerID())
	Sleep(20)
	C_PortraitDialog(129 , -64 ,false,false,C_GetStringFromPreset( 8253441),255,false,3);

	local Guy07=C_CreateClientNPC (40050 , 1134,0,1465 , 4)
	C_Move ( Guy07 , 2325,0,873 , true )
	Sleep(60)
	C_PortraitDialog(129 , -64 ,false,false,C_GetStringFromPreset( 8253431),255,false,3);
	C_PortraitDialog(129 , -64 ,false,false,C_GetStringFromPreset( 8253437),255,false,3);	
	C_RunServerScript(OwnerID(), -1, "Mission1008")
	--C_Move ( Guy07 , 2742,0,2644 , false )
	Sleep(60)
	C_Move ( Guy07 , 1134,0,1465 , false )
	Sleep(60)
	C_DestroyClientObj ( Guy07 )
end
function Mission1008_firework()
	C_AddGameEffect(OwnerID(),"SW010",
					3000,50,50,
					2,
					15, 20, 10,
					1 )
	C_PlaySound( 7036010, OwnerID())
end
--===========================================================================
function MissionTalk_1009()
	C_PortraitDialog(137 , -64 ,false,false,
					C_GetStringFromPreset( 8025443),
					255,false,3);
end
function MissionTalk_1009_1()
	c_MissionTalk_UnLock(56, 8253448, 1)
end
function MissionTalk_1009_2()
	c_MissionTalk_UnLock(56, 8253449, 1)
end
function c_Mission1009_sound()
	C_PlaySound( 7040017, OwnerID())
end
--===========================================================================
function MissionTalk_1010()
	C_PortraitDialog(56 , -64 ,false,false,C_GetStringFromPreset( 8025447),255,false,3);
end
function MissionTalk_1011()
	C_PortraitDialog(129 , -64 ,false,false,C_GetStringFromPreset( 8025450),255,false,3);
end
