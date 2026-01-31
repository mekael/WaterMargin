--特寫鏡頭第一類
function Camzoom_01 ()	
	local CamDis = C_GetCameraDistance ();
	C_SetCameraDistance (-450,0.2);
	--local CamDis1 = C_GetCameraFieldOfView ();
	--C_SetCameraFieldOfView (20,0.15);
	local CamDis2 = C_GetCameraLookAtOffsetY ();
	C_SetCameraLookAtOffsetY (65,0.1)
	local CamDis3 = C_GetCamera_ScreenCenterArea_WidthPercent()
	C_SetCamera_ScreenCenterArea_WidthPercent(10)
	local CamDis4 = C_GetCamera_ScreenCenterArea_HeightPercent()
	C_SetCamera_ScreenCenterArea_HeightPercent(10)
	C_ReturnDefFog ();C_SaveNowFogData ();
    C_ModifySceneFog (500,1000,0.0,0.0,0.0);
	C_ReturnDefAmbiLightColor ();C_SaveNowAmbiLightColorData ();
	C_ModifyAmbiLightColor (0.0,0.0,0.0);
	C_ReturnDefMainLightColor ();C_SaveNowMainLightColorData ();
	C_ModifyMainLightColor (0.0,0.0,0.0);
	--Sleep (8)
	C_WaitForAnimation(TargetID() , 0);
			
	C_ReturnDefFog ();
	C_ReturnDefAmbiLightColor ();
	C_ReturnDefMainLightColor ();
	C_SetCameraDistance (CamDis, 0.2);
	--C_SetCameraFieldOfView (CamDis1,0.2);
	C_SetCameraLookAtOffsetY (CamDis2, 0.2)
	C_SetCamera_ScreenCenterArea_WidthPercent(CamDis3)
	C_SetCamera_ScreenCenterArea_HeightPercent(CamDis4)	
	--Sleep (10)
end

--特寫鏡頭第二類(
function Camzoom_02 ()	
	local CamDis1 = C_GetCameraFieldOfView ();
	C_SetCameraFieldOfView (35,0.15);
	Sleep (12)
	--C_WaitForAnimation(OwnerID(),0);

	C_SetCameraFieldOfView (CamDis1,0.2);
end

--測試雷橫用2秒長技能20101效果：鏡頭較高、Zoom in時間略長
function Camzoom_PC02_01 ()	
	local CamDis = C_GetCameraDistance ();
	C_SetCameraDistance (-450,0.2);
	--local CamDis1 = C_GetCameraFieldOfView ();	--記錄目前FOV
	--C_SetCameraFieldOfView (20,0.15);	--指定FOV
	local CamDis2 = C_GetCameraLookAtOffsetY ();	--記錄觀看位置目標Y軸位移量
	C_SetCameraLookAtOffsetY (130,0.1);	--指定觀看位置目標Y軸位移量
	local CamDis3 = C_GetCamera_ScreenCenterArea_WidthPercent();	--記錄不跟隨區域佔螢幕寬度比例
	C_SetCamera_ScreenCenterArea_WidthPercent(10);	--指定不跟隨區域佔螢幕寬度比例
	local CamDis4 = C_GetCamera_ScreenCenterArea_HeightPercent();	--記錄不跟隨區域佔螢幕高度比例
	C_SetCamera_ScreenCenterArea_HeightPercent(10);	--指定不跟隨區域佔螢幕高度比例
	C_ReturnDefFog ();C_SaveNowFogData ();	--先回復再記錄目前霧色資料（避免複數技能發動到一半時記錄到其他資料）
    C_ModifySceneFog (500,1000,0.0,0.0,0.0);	--指定霧色效果
	C_ReturnDefAmbiLightColor ();C_SaveNowAmbiLightColorData ();	--記錄目前場景光色（避免複數技能發動到一半時記錄到其他資料）
	C_ModifyAmbiLightColor (0.0,0.0,0.0);	--指定場景光色
	C_ReturnDefMainLightColor ();C_SaveNowMainLightColorData ();	--記錄目前主光源色（避免複數技能發動到一半時記錄到其他資料）
	C_ModifyMainLightColor (0.0,0.0,0.0);	--指定主光源色
	--Sleep (13);	--停滯時間
	C_WaitForAnimation(TargetID(),0);
		
	C_ReturnDefFog ();	--回復霧色
	C_ReturnDefAmbiLightColor ();	--回復場景光色
	C_ReturnDefMainLightColor ();	--回復主光源色
	C_SetCameraDistance (CamDis, 0.2);
	--C_SetCameraFieldOfView (CamDis1,0.2);	--回復FOV
	C_SetCameraLookAtOffsetY (CamDis2, 0.5);	--回復觀看位置目標Y軸位移量
	C_SetCamera_ScreenCenterArea_WidthPercent(CamDis3);	--回復不跟隨區域佔螢幕寬度比例
	C_SetCamera_ScreenCenterArea_HeightPercent(CamDis4);	--回復不跟隨區域佔螢幕高度比例
	--Sleep (10)
end

--測試孫二娘用2秒長技能30101效果：Zoom in距離較出來、Zoom in時間略長
function Camzoom_PC03_01 ()	
	local CamDis = C_GetCameraDistance ();
	C_SetCameraDistance (-550,0.2);
	--local CamDis1 = C_GetCameraFieldOfView ();	--記錄目前FOV
	--C_SetCameraFieldOfView (20,0.15);	--指定FOV
	local CamDis2 = C_GetCameraLookAtOffsetY ();	--記錄觀看位置目標Y軸位移量
	C_SetCameraLookAtOffsetY (65,0.1);	--指定觀看位置目標Y軸位移量
	local CamDis3 = C_GetCamera_ScreenCenterArea_WidthPercent();	--記錄不跟隨區域佔螢幕寬度比例
	C_SetCamera_ScreenCenterArea_WidthPercent(10);	--指定不跟隨區域佔螢幕寬度比例
	local CamDis4 = C_GetCamera_ScreenCenterArea_HeightPercent();	--記錄不跟隨區域佔螢幕高度比例
	C_SetCamera_ScreenCenterArea_HeightPercent(10);	--指定不跟隨區域佔螢幕高度比例
	C_ReturnDefFog ();C_SaveNowFogData ();	--記錄目前霧色資料（避免複數技能發動到一半時記錄到其他資料）
    C_ModifySceneFog (500,1000,0.0,0.0,0.0);	--指定霧色效果
	C_ReturnDefAmbiLightColor ();C_SaveNowAmbiLightColorData ();	--記錄目前場景光色（避免複數技能發動到一半時記錄到其他資料）
	C_ModifyAmbiLightColor (0.0,0.0,0.0);	--指定場景光色
	C_ReturnDefMainLightColor ();C_SaveNowMainLightColorData ();	--記錄目前主光源色（避免複數技能發動到一半時記錄到其他資料）
	C_ModifyMainLightColor (0.0,0.0,0.0);	--指定主光源色
	--Sleep (17);	--停滯時間
	C_WaitForAnimation(TargetID(),0);
	C_ReturnDefFog ();	--回復霧色
	C_ReturnDefAmbiLightColor ();	--回復場景光色
	C_ReturnDefMainLightColor ();	--回復主光源色
	C_SetCameraDistance (CamDis, 0.1);
	--C_SetCameraFieldOfView (CamDis1,0.2);	--回復FOV
	C_SetCameraLookAtOffsetY (CamDis2, 0.4);	--回復觀看位置目標Y軸位移量
	C_SetCamera_ScreenCenterArea_WidthPercent(CamDis3);	--回復不跟隨區域佔螢幕寬度比例
	C_SetCamera_ScreenCenterArea_HeightPercent(CamDis4);	--回復不跟隨區域佔螢幕高度比例
	--Sleep (10)
end

--測試孫二娘用2秒長技能30101效果：Zoom in距離較出來、Zoom in時間略長
--美術預計特效均在播放至第15格時（0.5秒；每秒約30格）才開始攻擊，鏡頭差不到在這時間前zoom到定位效果較適當
function Camzoom_PC03_02 ()	
	local CamDis = C_GetCameraDistance ();				--記錄鏡頭距觀看點的距離
	--C_SetCameraDistance (-550,0.2);								--指定鏡頭移至距離觀看點的絕對距離
	C_SetCameraDistance (-350,0.2);								--指定鏡頭移至距離觀看點的絕對距離
	--local CamDis1 = C_GetCameraFieldOfView ();			--記錄目前FOV
	--C_SetCameraFieldOfView (20,0.15);							--指定FOV
	local CamDis2 = C_GetCameraLookAtOffsetY ();	--記錄觀看位置對目標於Y軸位移量
	--C_SetCameraLookAtOffsetY (65,0.1);						--指定觀看位置對目標於Y軸位移量
	C_SetCameraLookAtOffsetY (30,0.1);						--指定觀看位置對目標於Y軸位移量
	--***************************************************************************************************************
	local CamAngX_0 = C_GetCameraAngleX();			--記錄目前對X軸的旋轉角度
	C_SetCameraAngleX(20.2);										--指定對Y軸的旋轉角度
	local CamAngY_0 = C_GetCameraAngleY();			--記錄目前對Y軸的旋轉角度
	C_SetCameraAngleY(60,0.2);										--指定對Y軸的旋轉角度
		--***************************************************************************************************************
	
	local CamDis3 = C_GetCamera_ScreenCenterArea_WidthPercent();		--記錄不跟隨區域佔螢幕寬度比例
	C_SetCamera_ScreenCenterArea_WidthPercent(10);	--指定不跟隨區域佔螢幕寬度比例
	local CamDis4 = C_GetCamera_ScreenCenterArea_HeightPercent();	--記錄不跟隨區域佔螢幕高度比例
	C_SetCamera_ScreenCenterArea_HeightPercent(10);	--指定不跟隨區域佔螢幕高度比例
	C_ReturnDefFog ();C_SaveNowFogData ();						--記錄目前霧色資料（避免複數技能發動到一半時記錄到其他資料）
    --C_ModifySceneFog (500,1000,0.0,0.0,0.0);				--指定霧色效果
	C_ReturnDefAmbiLightColor ();C_SaveNowAmbiLightColorData ();	--記錄目前場景光色（避免複數技能發動到一半時記錄到其他資料）
	C_ModifyAmbiLightColor (0.1,0.1,0.1);						--指定場景光色
	C_ReturnDefMainLightColor ();C_SaveNowMainLightColorData ();	--記錄目前主光源色（避免複數技能發動到一半時記錄到其他資料）
	C_ModifyMainLightColor (0.0,0.0,0.0);						--指定主光源色
	Sleep (2);																		--停滯時間，留給上面各行為用，單位 1/10 秒
	C_RunScript ( -1 , -1 , "SkillCamShock1"); --呼叫震動script
		--Sleep (1);																		--停滯時間，留給上面各行為用，單位 1/10 秒
	--***************************************************************************************************************
	C_SetCameraAngleY(-60,1.2);									--指定對Y軸的旋轉角度
		--Sleep (14);																	--停滯時間，留給上面各行為用，單位 1/10 秒
	C_WaitForAnimation(TargetID(),0);
		
	--***************************************************************************************************************
	
	C_SetCameraDistance (CamDis, 0.2);						--回復鏡頭距觀看點的距離
	--C_SetCameraFieldOfView (CamDis1,0.2);					--回復FOV
	--***************************************************************************************************************
	C_SetCameraAngleX(CamAngX_0,0.2);					--回復對Y軸的旋轉角度
	C_SetCameraAngleY(CamAngY_0,0.2);					--回復對Y軸的旋轉角度
	--***************************************************************************************************************
	--C_SetCameraLookAtOffsetY (CamDis2, 0.4);			--回復觀看位置目標Y軸位移量
	C_SetCameraLookAtOffsetY (CamDis2, 0.2);			--回復觀看位置目標Y軸位移量
	C_SetCamera_ScreenCenterArea_WidthPercent(CamDis3);	--回復不跟隨區域佔螢幕寬度比例
	C_SetCamera_ScreenCenterArea_HeightPercent(CamDis4);	--回復不跟隨區域佔螢幕高度比例
	
	 --C_ModifySceneFog (500,1000,0.0,0.0,0.0);				--指定霧色效果
	--C_ModifyAmbiLightColor (0.5,0.5,0.5);						--指定場景光色
	--C_ReturnDefMainLightColor ();C_SaveNowMainLightColorData ();								--記錄目前主光源色
	--C_ModifyMainLightColor (0.0,0.0,0.0);						--指定主光源色
	
	--C_RunScript ( OwnerID () , OwnerID () , "SkillCamShock1"); --呼叫震動script
	
	Sleep (2)																			--停滯時間，留給上面各行為用，單位 1/10 秒
	C_ReturnDefFog ();														--回復霧色
	C_ReturnDefAmbiLightColor ();									--回復場景光色
	C_ReturnDefMainLightColor ();									--回復主光源色
end

--測試特效用黑幕，不zoom in

function Camzoom_PC99_01 ()	
	C_ReturnDefFog ();C_SaveNowFogData ();						--記錄目前霧色資料（避免複數技能發動到一半時記錄到其他資料）
    --C_ModifySceneFog (500,1000,0.0,0.0,0.0);				--指定霧色效果
	C_ReturnDefAmbiLightColor ();C_SaveNowAmbiLightColorData ();	--記錄目前場景光色（避免複數技能發動到一半時記錄到其他資料）
	C_ModifyAmbiLightColor (0.1,0.1,0.1);						--指定場景光色
	C_ReturnDefMainLightColor ();C_SaveNowMainLightColorData ();	--記錄目前主光源色（避免複數技能發動到一半時記錄到其他資料）
	C_ModifyMainLightColor (0.0,0.0,0.0);						--指定主光源色
	C_RunScript ( -1 , -1 , "SkillCamShock1"); --呼叫震動script
	--	Sleep (15);																		--停滯時間，留給上面各行為用，單位 1/10 秒	
	C_WaitForAnimation(TargetID(),0);

	C_ReturnDefFog ();														--回復霧色
	C_ReturnDefAmbiLightColor ();									--回復場景光色
	C_ReturnDefMainLightColor ();									--回復主光源色
end