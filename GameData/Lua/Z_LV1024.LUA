-------------------------------------------------------------------------------
-- Client Script
-------------------------------------------------------------------------------
--進場景執行

function Lv1024_CamShock()
	C_RunScript (OwnerID() ,OwnerID(), "Lv1024_CamShockStart" )
end

function Lv1024_CamShockStart()
	while true do
		local sleep_time_list = { 50, 80, 120, 150, 200}	--間隔時間
		local shock_list = { -10, -5, 0 , 5, 10}	--震動座標
		local shock_rate_list = { 5, 6, 7, 8, 9}	--振動頻率
		local shock_time_list = { 1.5, 2, 2.5, 3}	--震動時間
		local sleep_time =  sleep_time_list[math.random(1,5)]
		local S_shockX = shock_list[math.random(1,5)]
		local S_shockY = shock_list[math.random(1,5)]
		local S_shockZ = shock_list[math.random(1,5)]
		local E_shockX = shock_list[math.random(1,5)]
		local E_shockY = shock_list[math.random(1,5)]
		local E_shockZ = shock_list[math.random(1,5)]
		local shock_rate = shock_rate_list[math.random(1,5)]
		local shock_time = shock_time_list[math.random(1,4)]
		Sleep(sleep_time)
		C_PlaySound( 5054010, OwnerID() )
		C_CameraShockStart( S_shockX, S_shockY, S_shockZ,		--開始震幅
							E_shockX, E_shockY, E_shockZ,	--結束震幅
							shock_rate,			--頻率（每秒鐘震動多少次）
							shock_time,		--持續時間（秒鐘）
							false)		--是否亂數震動 (true / false)
	end
end
