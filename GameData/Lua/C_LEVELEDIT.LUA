--G_DoMiniMapManagerOnTime = false;
G_Timer_Data = {}

--=============================================================================
-- Client 每次換地圖會執行一次
function Client_Initialize_Script()
	C_RunScript( -1 , -1 , "MiniMapOnTime")
	C_RunScript( -1 , -1 , "CompassOnTime")
	C_RunScript( -1 , -1 , "Default_Timer_OnTime")
	C_RunScript( -1 , -1 , "Client_MiniMap_Initialize_Script")
	MessageOfLevelInitialize()
end
--=============================================================================
-------------------------------------------------------------------------------
G_CompassData = { Destination = {X = 0 , Y =0 ,Z = 0 }, Show = false , CurrnetShow = false}
function L_CompassShow()
	G_CompassData.Show = true
	G_CompassData.Show = false  --暫時關閉
end
--=============================================================================
function L_CompassHide()
	G_CompassData.Show = false;
end

--=============================================================================
-- 設定指南針目的地
function L_SetCompassDestination ( X, Y , Z)
	G_CompassData.Destination.X,G_CompassData.Destination.Y,G_CompassData.Destination.Z =  X, Y , Z;
end
--=============================================================================
-- 產生目標指南針
function CompassOnTime()
	local NewMainplayerId = C_GetMainPlayerEntityId();
	local LiveTime = 60 * 60* 12 * 1000;
	local CompassTemplateName = "compass";
	local CompassId = 0;
	local MainPlayId = 0;
	
	L_CompassHide();
	
	while true do
		NewMainplayerId = C_GetMainPlayerEntityId();
		--C_Msg ("NewMainplayerId("..NewMainplayerId..") MainPlayId("..MainPlayId..") CompassId("..CompassId..")");
		if NewMainplayerId ~= MainPlayId and NewMainplayerId > 0 then
			MainPlayId = NewMainplayerId;
			if CompassId ~= 0 then
				C_Msg ("換地圖了清除Destroy "..MainPlayId);
				CompassId = 0;
				if G_CompassData.CurrnetShow == true then
					G_CompassData.CurrnetShow = false;
				end
			end
		end

		if G_CompassData.Show ~= G_CompassData.CurrnetShow and MainPlayId > 0 then
			if G_CompassData.CurrnetShow == true then
				C_DestroyClientObj( CompassId );
				CompassId = 0;
				C_Msg ("Destroy"..CompassId);
			else
				CompassId = C_AddGameEffect( MainPlayId , CompassTemplateName , LiveTime , 0 , 0 , 1 ,0 ,0,0 , 1.0);
				C_Msg ("AddEffect"..MainPlayId);
			end
			G_CompassData.CurrnetShow = G_CompassData.Show;
		end

		if CompassId ~= 0 then
			C_SetDirectionByTarget( CompassId ,G_CompassData.Destination.X , G_CompassData.Destination.y , G_CompassData.Destination.Z );
		end
		Sleep(1);
	end
end
--=============================================================================
function Default_Timer_OnTime ()
	G_Timer_Data = {}
	local LastTime,DeltaTime
	LastTime = os.clock()
	while true do
		DeltaTime = LastTime - os.clock()
		for TimeId ,TimerData in pairs (G_Timer_Data) do
			if TimerData.Playing == true then
				if TimerData.Time >= 0 then
					if TimerData.NumberPic ~= nil then
						ClosePicNumber(TimerData.NumberPic);
						TimerData.NumberPic = {}
					end
					TimerData.NumberPic = ShowPicNumber (430,25,math.floor(TimerData.Time) , 4045 , 37 , 75 )
					TimerData.Time = TimerData.Time + DeltaTime
				else
					if TimerData.NumberPic ~= nil then
						ClosePicNumber(TimerData.NumberPic);
						TimerData.NumberPic = {}
					end
					G_Timer_Data[TimeId] = nil
				end
			end
		end
		LastTime = os.clock()
		Sleep(5)
	end
end
--=============================================================================
--數字圖形
function ShowPicNumber ( Pos_X , Pos_Y ,Number , ImageListId , FontWidth , FontHeight  )
	local tb_Number = {};
	local tb_Pic = {};
	local Screen= {Width = 800 , Height = 600}
	local Position = { X = Pos_X - FontWidth , Y = Pos_Y} 
	local Count = 1;
	local Uwidth = FontWidth/ Screen.Width
	local Vheight= FontHeight / Screen.Height

	repeat
		local num = math.fmod(Number,10)
		Number = (Number - num) / 10
		tb_Number[Count] = num;
		Count = Count + 1;
	until Number == 0
	
	local TotalNum = table.getn(tb_Number);

	if TotalNum > 0 then
		for i,Num in pairs (tb_Number) do
			tb_Pic[i] = C_ShowAutoScalePicAnmByUV  ( ImageListId , Uwidth , Vheight ,
													Num , 1000 , 0 , 1 ,
													0 	, Uwidth , Vheight ,
													Position.X/Screen.Width + Uwidth*(TotalNum - i +1) - Uwidth*TotalNum/2 , Position.Y / Screen.Height ,false)
		end
		return tb_Pic
	end
	return nil
end
--=============================================================================
--關閉圖形數字
function ClosePicNumber( tb_Pic )
	for i,PicId in pairs (tb_Pic) do
		C_ClosePic(PicId)
	end
end
--=============================================================================
--G_Showed_GameStageAnnounce = false
function Default_ShowGameStageAnnounce()
	local PlayTime = TargetID()
	if C_IsGameStageAnnounceShowed() == false then
		C_GameStageAnnounceShow( PlayTime )
		--G_Showed_GameStageAnnounce = true
	end
end
--=============================================================================
function Default_CloseGameStageAnnounce()
	C_GameStageAnnounceClose()
	--G_Showed_GameStageAnnounce = false
end
--=============================================================================
function Default_Client_CreateTimer()
	local NewTimerId = TargetID()
	
	if NewTimerId <= 0 then
		return 
	end
	
	-- 清除舊的資訊
	if G_Timer_Data[NewTimerId] ~= nil then
		local tb_NumberPic = G_Timer_Data[NewTimerId].NumberPic
		if tb_NumberPic ~= nil and type(tb_NumberPic) == "table" then
			ClosePicNumber(tb_NumberPic);
		end
	end
	
	G_Timer_Data[NewTimerId] = {NumberPic = {},
								Time = 0 ,
								Playing = false}
	

end
--=============================================================================
function Default_Client_StartTimer()
	local CountDown = TargetID() % 1000 
	local TimerId = (TargetID() - CountDown) / 1000
	if G_Timer_Data[TimerId] ~= nil then
		G_Timer_Data[TimerId].Time = CountDown
		G_Timer_Data[TimerId].Playing = true
	end
end
--=============================================================================
function Default_Client_StopTimer()
	local TimerId = TargetID()
	if G_Timer_Data[TimerId] ~= nil then
		G_Timer_Data[TimerId].Time = 0
		G_Timer_Data[TimerId].Playing = true
	end
end
--=============================================================================
