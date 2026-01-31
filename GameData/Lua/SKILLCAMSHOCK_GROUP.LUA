--鏡頭震動微量
function SkillCamShock()
    
	C_CameraShockStart(0,10,5,
						0,5,10,
						15,0.3,false)
	
end
--鏡頭震動一級	
function SkillCamShock1()
    
	C_CameraShockStart(5,10,5,
						10,5,10,
						15,0.4,false)
	
end	
--鏡頭震動二級	
function SkillCamShock2()
    
	C_CameraShockStart(10,30,10,
						0,0,0,
						10,0.5,false)
	
end	
--鏡頭震動三級	
function SkillCamShock3()
    
	C_CameraShockStart(30,5,30,
						5,30,5,
						15,0.5,false)
	
end	
--鏡頭震動by坦克彪	
function SkillCamShock2_tank()
    Sleep(5)
	C_CameraShockStart(10,30,10,
						0,0,0,
						10,0.5,false)
	
end	
--叛克跑步的鏡頭循環震動
function SkillCamShock_run()
	Sleep(3)
	C_CameraShockStart(0,10,0,--開始震幅
						0,0.1,0,--結束震幅
						10,--頻率（每秒鐘震動多少次）
						0.1,--持續時間（秒鐘）
						false)--是否亂數震動 (true / false)
	Sleep(0.3)
	C_CameraShockStart(0,10,0,--開始震幅
						0,0.1,0,--結束震幅
						10,--頻率（每秒鐘震動多少次）
						0.1,--持續時間（秒鐘）
						false)--是否亂數震動 (true / false)
	Sleep(3)
	C_CameraShockStart(0,10,0,--開始震幅
						0,0.1,0,--結束震幅
						10,--頻率（每秒鐘震動多少次）
						0.1,--持續時間（秒鐘）
						false)--是否亂數震動 (true / false)
	Sleep(0.7)
	C_CameraShockStart(0,10,0,--開始震幅
						0,0.1,0,--結束震幅
						10,--頻率（每秒鐘震動多少次）
						0.1,--持續時間（秒鐘）
						false)--是否亂數震動 (true / false)
end
function SkillCamShock_stop()
    C_StopScript (OwnerID() ,"SkillCamShock_run")
end