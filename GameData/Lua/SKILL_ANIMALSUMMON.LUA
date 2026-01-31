function Summon_AK_01()						--召喚動物王01
	C_RunScript ( OwnerID () , OwnerID () , "SkillCamShock3");
	local EffectId = C_AddGameEffect (OwnerID (),								--特效要貼附在場景中的哪個物件身上。
                                "mfa0001",									--特效物件的樣板名稱。這個名稱必須存在該場景的template檔中。
                                3000,											--特效要出現多久。（毫秒）
                                0,											--特效出現時，要花多久的時間進行淡入。單位是毫秒。這段時間包含在 life-time 之內，也就是說，開始淡入時，已經開始倒數 life-time 了。
                                0,												--特效消失時，要花多久的時間進行淡出。單位是毫秒。這段時間不包含在 life-time 之內，也就是從 life-time 倒數零的時候，才會開始淡出。只有在該特效是以 PxEntity 來製作的時候，才有效果。
                                0,												--要讓特效貼附在owner的哪個部位。0: 貼附在owner的參考點。（通常是腳底下）1: 貼附在owner的「可被攻擊範圍的中心點」。2: 貼附在owner的 game bounding box 頂端平面的中心點。
                                0, 0, 50,									--特效貼附在owner指定部位時，在X、Y、Z軸方向上還要再偏移多少距離。
                                1 );											--特效物件從樣板中複製出來後，要先放大幾倍。1.0表示維持原來的尺寸。
								
		local Camera_Direction = (C_GetCameraDirection( ) + 4) % 8
		C_Msg("EffectId"..EffectId.."Camera_Direction"..Camera_Direction.."\n")
		C_SetDirection( EffectId , Camera_Direction )
end

function Summon_AK_02()						--召喚動物王02
	C_RunScript ( OwnerID () , OwnerID () , "SkillCamShock3");
	local EffectId = C_AddGameEffect (OwnerID (),								--特效要貼附在場景中的哪個物件身上。
                                "mfa0002",									--特效物件的樣板名稱。這個名稱必須存在該場景的template檔中。
                                3000,											--特效要出現多久。（毫秒）
                                0,											--特效出現時，要花多久的時間進行淡入。單位是毫秒。這段時間包含在 life-time 之內，也就是說，開始淡入時，已經開始倒數 life-time 了。
                                0,												--特效消失時，要花多久的時間進行淡出。單位是毫秒。這段時間不包含在 life-time 之內，也就是從 life-time 倒數零的時候，才會開始淡出。只有在該特效是以 PxEntity 來製作的時候，才有效果。
                                0,												--要讓特效貼附在owner的哪個部位。0: 貼附在owner的參考點。（通常是腳底下）1: 貼附在owner的「可被攻擊範圍的中心點」。2: 貼附在owner的 game bounding box 頂端平面的中心點。
                                0, 0, 50,									--特效貼附在owner指定部位時，在X、Y、Z軸方向上還要再偏移多少距離。
                                1 );											--特效物件從樣板中複製出來後，要先放大幾倍。1.0表示維持原來的尺寸。
								
		local Camera_Direction = (C_GetCameraDirection( ) + 4) % 8
		C_Msg("EffectId"..EffectId.."Camera_Direction"..Camera_Direction.."\n")
		C_SetDirection( EffectId , Camera_Direction )
end

function Summon_AK_03()						--召喚動物王03
	C_RunScript ( OwnerID () , OwnerID () , "SkillCamShock3");
	local EffectId = C_AddGameEffect (OwnerID (),								--特效要貼附在場景中的哪個物件身上。
                                "mfa0003",									--特效物件的樣板名稱。這個名稱必須存在該場景的template檔中。
                                3000,											--特效要出現多久。（毫秒）
                                0,											--特效出現時，要花多久的時間進行淡入。單位是毫秒。這段時間包含在 life-time 之內，也就是說，開始淡入時，已經開始倒數 life-time 了。
                                0,												--特效消失時，要花多久的時間進行淡出。單位是毫秒。這段時間不包含在 life-time 之內，也就是從 life-time 倒數零的時候，才會開始淡出。只有在該特效是以 PxEntity 來製作的時候，才有效果。
                                0,												--要讓特效貼附在owner的哪個部位。0: 貼附在owner的參考點。（通常是腳底下）1: 貼附在owner的「可被攻擊範圍的中心點」。2: 貼附在owner的 game bounding box 頂端平面的中心點。
                                0, 0, 50,									--特效貼附在owner指定部位時，在X、Y、Z軸方向上還要再偏移多少距離。
                                1 );											--特效物件從樣板中複製出來後，要先放大幾倍。1.0表示維持原來的尺寸。
								
		local Camera_Direction = (C_GetCameraDirection( ) + 4) % 8
		C_Msg("EffectId"..EffectId.."Camera_Direction"..Camera_Direction.."\n")
		C_SetDirection( EffectId , Camera_Direction )
end

function Summon_AK_04()						--召喚動物王04
	C_RunScript ( OwnerID () , OwnerID () , "SkillCamShock3");
	local EffectId = C_AddGameEffect (OwnerID (),								--特效要貼附在場景中的哪個物件身上。
                                "mfa0004",									--特效物件的樣板名稱。這個名稱必須存在該場景的template檔中。
                                3000,											--特效要出現多久。（毫秒）
                                0,											--特效出現時，要花多久的時間進行淡入。單位是毫秒。這段時間包含在 life-time 之內，也就是說，開始淡入時，已經開始倒數 life-time 了。
                                0,												--特效消失時，要花多久的時間進行淡出。單位是毫秒。這段時間不包含在 life-time 之內，也就是從 life-time 倒數零的時候，才會開始淡出。只有在該特效是以 PxEntity 來製作的時候，才有效果。
                                0,												--要讓特效貼附在owner的哪個部位。0: 貼附在owner的參考點。（通常是腳底下）1: 貼附在owner的「可被攻擊範圍的中心點」。2: 貼附在owner的 game bounding box 頂端平面的中心點。
                                0, 0, 50,									--特效貼附在owner指定部位時，在X、Y、Z軸方向上還要再偏移多少距離。
                                1 );											--特效物件從樣板中複製出來後，要先放大幾倍。1.0表示維持原來的尺寸。
								
		local Camera_Direction = (C_GetCameraDirection( ) + 4) % 8
		C_Msg("EffectId"..EffectId.."Camera_Direction"..Camera_Direction.."\n")
		C_SetDirection( EffectId , Camera_Direction )
end

function Summon_AK_05()						--召喚動物王05
	C_RunScript ( OwnerID () , OwnerID () , "SkillCamShock3");
	local EffectId = C_AddGameEffect (OwnerID (),								--特效要貼附在場景中的哪個物件身上。
                                "mfa0005",									--特效物件的樣板名稱。這個名稱必須存在該場景的template檔中。
                                3000,											--特效要出現多久。（毫秒）
                                0,											--特效出現時，要花多久的時間進行淡入。單位是毫秒。這段時間包含在 life-time 之內，也就是說，開始淡入時，已經開始倒數 life-time 了。
                                0,												--特效消失時，要花多久的時間進行淡出。單位是毫秒。這段時間不包含在 life-time 之內，也就是從 life-time 倒數零的時候，才會開始淡出。只有在該特效是以 PxEntity 來製作的時候，才有效果。
                                0,												--要讓特效貼附在owner的哪個部位。0: 貼附在owner的參考點。（通常是腳底下）1: 貼附在owner的「可被攻擊範圍的中心點」。2: 貼附在owner的 game bounding box 頂端平面的中心點。
                                0, 0, 50,									--特效貼附在owner指定部位時，在X、Y、Z軸方向上還要再偏移多少距離。
                                1 );											--特效物件從樣板中複製出來後，要先放大幾倍。1.0表示維持原來的尺寸。
								
		local Camera_Direction = (C_GetCameraDirection( ) + 4) % 8
		C_Msg("EffectId"..EffectId.."Camera_Direction"..Camera_Direction.."\n")
		C_SetDirection( EffectId , Camera_Direction )
end
