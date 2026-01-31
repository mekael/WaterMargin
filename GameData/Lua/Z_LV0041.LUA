-------------------------------------------------------------------------------
-- Client Script
-------------------------------------------------------------------------------
function MissionTalk_041()
	local TalkLIST = { };
	TalkLIST[6] = {8250044,78, 50 ,true,false}
	TalkLIST[30217] = {8250045,16, 50 ,true,false}
	TalkLIST[4604] = {8250046,78 ,50 ,true,false}
	TalkLIST[4605] = {8250119,77 ,50 ,true,false}
	local GroupId = TargetID();
	if TalkLIST[GroupId] == nil then
		return;
	end
	local Msg = C_GetStringFromPreset( TalkLIST[GroupId][1] );
	C_PortraitDialog(TalkLIST[GroupId][2] , TalkLIST[GroupId][3] , TalkLIST[GroupId][4] ,TalkLIST[GroupId][5] , Msg, 100);
	--Sleep(20);
end

