G_FogFar = 1000
function C_fog_change1()
	G_FogFar = 1000
	C_ModifySceneFog(100,G_FogFar,1,1,1)
	C_SaveNowFogData ();
end
function C_fog_change2()
	G_FogFar = G_FogFar+1000
	C_ModifySceneFog(100,G_FogFar,1,1,1)
	C_SaveNowFogData ();
end


--=============================================================================
--控制霧的函式，關卡Lv0007使用
function C_fog_lv0007_start()
	C_ModifySceneFog(100,3000,0,0,0)
	C_SaveNowFogData ();
end
--控制霧的函式，關卡Lv0011使用
function C_fog_lv0011_start()
	C_ModifySceneFog(100,3000,0,0,0)
	C_SaveNowFogData ();
end
function C_fog_lv0011_start2()
	C_ModifySceneFog(800,5000,1,1,1)
	C_SaveNowFogData ();
end
