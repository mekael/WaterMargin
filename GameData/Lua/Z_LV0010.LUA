function c_lv0010_boss1_anm()
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

function MissionTalk_010()
	local G_TalkLIST = { };
	G_TalkLIST[1] = {8250017,18, 50 ,true,false}
	G_TalkLIST[2] = {8250018,19, 50 ,true,false } 
	G_TalkLIST[4] = {8250019,19, 50 ,true,false }
	G_TalkLIST[6] = {8250020,15, 50 ,true,false } 
	G_TalkLIST[7] = {8250021,16, 50 ,true,false } 
	G_TalkLIST[8] = {8250022,17, 50 ,true,false} 
	local GroupId = TargetID();
	if G_TalkLIST[GroupId] == nil then
		return;
	end
	local Msg = C_GetStringFromPreset( G_TalkLIST[GroupId][1] );
--[[	C_PortraitDialog(G_TalkLIST[GroupId][2] , G_TalkLIST[GroupId][3] , G_TalkLIST[GroupId][4] ,G_TalkLIST[GroupId][5] ,"<h2><font color=black>"..Msg .."</font></h2>", 100);
--]]
	C_PortraitDialog(G_TalkLIST[GroupId][2] , G_TalkLIST[GroupId][3] , G_TalkLIST[GroupId][4] ,G_TalkLIST[GroupId][5], Msg, 100);
	Sleep(20);
end
--=============================================================================
