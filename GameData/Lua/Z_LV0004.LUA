-- Client Script
-------------------------------------------------------------------------------

function MissionTalk_004()
    local TalkLIST = { };
	TalkLIST[101] = {8250167,101, 50 ,true,false}
	TalkLIST[102] = {8250168,118, 50 ,true,false}
	TalkLIST[103] = {8250169,119, 50 ,true,false }
	TalkLIST[104] = {8250170,120, 50 ,true,false }
	local GroupId = TargetID();
	if TalkLIST[GroupId] == nil then
		return;
	end
	local Msg = C_GetStringFromPreset( TalkLIST[GroupId][1] );
	if Msg ~= nil then
		C_PortraitDialog(TalkLIST[GroupId][2] , TalkLIST[GroupId][3] , TalkLIST[GroupId][4] ,TalkLIST[GroupId][5] , Msg, 100);
	end
end
function MissionTalk_004_1()
	C_PortraitDialog(101 , -64 ,false,false,
					C_GetStringFromPreset( 8250167),--活閃婆：還好有你!我被兔子們困在這很久了，還有幾位同伴也被困住了。
					255,false,2);
end
function MissionTalk_004_2()
	C_PortraitDialog(118 , -64 ,false,false,
					C_GetStringFromPreset( 8250168),--空軍隊長：終於有人來幫我了，快!我們還要去搭救幾位同伴。
					255,false,2);
end
function MissionTalk_004_3()
	C_PortraitDialog(119 , -64 ,false,false,
					C_GetStringFromPreset( 8250169),--武松：這些獅仔真是難纏，可以幫幫我嗎？
					255,false,2);
end
function MissionTalk_004_4()
	C_PortraitDialog(120 , -64 ,false,false,
					C_GetStringFromPreset( 8250170),--將軍關勝：我掃!我掃!我掃掃掃!!怎麼就是掃不完哪？
					255,false,1);
	Sleep(40)
	C_PortraitDialog(133 , -64 ,false,false,
					C_GetStringFromPreset( 8250171),--高球：動物們!耗盡敵人的戰力就是最好的作戰策略。
					255,false,1);				
end
function MissionTalk_004_5()
	C_PortraitDialog(132 , -64 ,false,false,
					C_GetStringFromPreset( 8250172),--高球：別得意!欺負小貓小狗算什麼好漢，後面還有得瞧。
					255,false,1);
end
function MissionTalk_004_6()
	C_PortraitDialog(133 , -64 ,false,false,
					C_GetStringFromPreset( 8250173),--高球：動物們別客氣，打贏的有糖葫蘆可以吃。
					255,false,0.5);
end
function MissionTalk_004_7()
	C_PortraitDialog(134 , -64 ,false,false,
					C_GetStringFromPreset( 8250174),--高球：對了，我想起我還有些事，先走一步，不用等我回來。
					255,false,2);
end
function MissionTalk_004_8()
	C_PortraitDialog(135 , -64 ,false,false,
					C_GetStringFromPreset( 8250175),--高球：你現在還太嫩，是傷不了我的。但是別打我的臉!
					255,false,0.5);
end
function MissionTalk_004_9()
	C_PortraitDialog(103 , -64 ,false,false,
					C_GetStringFromPreset( 8250176),--活閃婆：這是鷹族們最強大的武器，大家得小心一點。
					255,false,3);
end
function MissionTalk_004_10()
	C_PortraitDialog(118 , -64 ,false,false,
					C_GetStringFromPreset( 8250177),--空軍隊長：鷹族最強大的武器終於現身，快!我們得讓他們知道我們的厲害。
					255,false,3);
end