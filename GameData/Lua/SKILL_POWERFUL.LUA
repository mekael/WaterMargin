--第一類技能施用時搭配的效果
function Skill_powerful01 ()
	C_RunScript ( -1 , OwnerID () , "Camzoom_01"); --特寫鏡頭第一類
	C_RunScript ( -1 , OwnerID () , "Picshow_01"); --速度線效果
end	

--測試雷橫用2秒長技能效果
function Skill_powerful_PC02_01 ()
	C_RunScript ( -1 , OwnerID () , "Camzoom_PC02_01"); --特寫鏡頭第一類
	C_RunScript ( -1 , OwnerID () , "Picshow_01"); --速度線效果
end

--測試孫二娘用2秒長技能效果
function Skill_powerful_PC03_01 ()
	C_RunScript ( -1 , OwnerID () , "Camzoom_PC03_01"); --特寫鏡頭第一類
	C_RunScript ( -1 , OwnerID () , "Picshow_01"); --速度線效果
end

--測試孫二娘用2秒長技能效果；旋轉鏡頭
function Skill_powerful_PC03_02 ()
	C_RunScript ( -1 , OwnerID () , "Camzoom_PC03_02"); --特寫鏡頭第一類
	C_RunScript ( -1 , OwnerID () , "Picshow_01"); --速度線效果
end

--測試特效用黑幕無zoom in
function Skill_powerful_PC99_01 ()
	C_RunScript ( -1 , OwnerID () , "Camzoom_PC99_01"); --特寫鏡頭第一類
	C_RunScript ( -1 , OwnerID () , "Picshow_01"); --速度線效果
end
