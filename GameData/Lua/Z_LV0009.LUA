function c_lv0009_boss1_anm()
--[[	local height,width,Rate;
	Rate = 1;
	height = 256 *  Rate
	width = 800 * Rate
	local PicId = C_ShowPicAnmByUV ( 4009 , width  , height ,
                                0 , 700 , 1 , 2 , 
                                0 , width, height ,
                                0.5 , 0.2 ,true);
	Sleep(30);
	C_ClosePic( PicId )]]
end	
-- Client Script
-------------------------------------------------------------------------------

function MissionTalk_009()
	local G_TalkLIST = { };
	G_TalkLIST[1] = {8250012,95, 50 ,true,false}

	G_TalkLIST[3] = {8250013,94, 50 ,true,false } 
	G_TalkLIST[4] = {8250014,95, 50 ,true,false }
	G_TalkLIST[5] = {8250015,94, 50 ,true,false} 

	G_TalkLIST[8] = {8250016,94, 50 ,true,false} 
	local GroupId = TargetID();
	if G_TalkLIST[GroupId] == nil then
		return;
	end
	local Msg = C_GetStringFromPreset( G_TalkLIST[GroupId][1] );
	C_PortraitDialog(G_TalkLIST[GroupId][2] , G_TalkLIST[GroupId][3] , G_TalkLIST[GroupId][4] ,G_TalkLIST[GroupId][5] , Msg, 100);
	Sleep(20);
end
--=============================================================================
