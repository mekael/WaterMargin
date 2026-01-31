-------------------------------------------------------------------------------
-- Client Script
-------------------------------------------------------------------------------

function MissionTalk_042()
	local TalkLIST = { };
	TalkLIST[99] = {8254001,17, 50 ,true,false}	--	TalkLIST[NPC群組ID] = {stringID,GFX人頭圖,底圖,方向,方向}
	local GroupId = TargetID();
	
	if TalkLIST[GroupId] == nil then
		return;
	end
	local Msg = C_GetStringFromPreset( TalkLIST[GroupId][1] );
	C_PortraitDialog(TalkLIST[GroupId][2] , TalkLIST[GroupId][3] , TalkLIST[GroupId][4] ,TalkLIST[GroupId][5] , Msg, 100);
	Sleep(20);
end
