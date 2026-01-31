function Skill_Basic()
	local PresetId = 1
	PresetId = C_GetPresetId(OwnerID())
	C_RunScript ( -1 , -1 , "SkillCamShock")
	
	--[[
	if PresetId == 1 then
		Skill_Basic01()
	elseif PresetId == 2 then
		Skill_Basic02()
	elseif PresetId == 3 then
		Skill_Basic03()
	elseif PresetId == 4 then
		Skill_Basic04()
	elseif PresetId == 5 then
		Skill_Basic05()
	elseif PresetId == 6 then
		Skill_Basic06()
	elseif PresetId == 7 then
		Skill_Basic07()
	elseif PresetId == 8 then
		Skill_Basic08()
	end
	--]]
end
--林沖連擊效果
function Skill_Basic01()
	C_RunScript ( -1 , -1 , "character_picshow01");
end	

--雷橫連擊效果
function Skill_Basic02()
	C_RunScript ( -1 , -1 , "character_picshow02");
end	

--孫二娘連擊效果
function Skill_Basic03()
	C_RunScript ( -1 , -1 , "character_picshow03");			--第三招不衝撞，故不顯示頭像
end	

--戴宗連擊效果
function Skill_Basic04()
	C_RunScript ( -1 , -1 , "character_picshow04");
end

--史進連擊效果
function Skill_Basic05()
	C_RunScript ( -1 , -1 , "character_picshow05");
end	

--李逵連擊效果
function Skill_Basic06()
	C_RunScript ( -1 , -1 , "character_picshow06");
end	

--顧大嫂連擊效果
function Skill_Basic07()
	C_RunScript ( -1 , -1 , "character_picshow07");
end	

--花榮連擊效果
function Skill_Basic08()
	C_RunScript ( -1 , -1 , "character_picshow08");
end		

function Skill_ShowTKO()
	local OId = OwnerID()
	local PresetId = C_GetPresetId( OId )
	
	if PresetId ~= nil then
		if PresetId == 1 then
			C_RunScript( OwnerID(),TargetID(),"Skill_Basic01" )
		elseif PresetId == 2 then
			C_RunScript( OwnerID(),TargetID(),"Skill_Basic02" )
		elseif PresetId == 3 then
			C_RunScript( OwnerID(),TargetID(),"Skill_Basic03" )
		elseif PresetId == 4 then
			C_RunScript( OwnerID(),TargetID(),"Skill_Basic04" )
		elseif PresetId == 5 then
			C_RunScript( OwnerID(),TargetID(),"Skill_Basic05" )
		elseif PresetId == 6 then
			C_RunScript( OwnerID(),TargetID(),"Skill_Basic06" )
		elseif PresetId == 7 then
			C_RunScript( OwnerID(),TargetID(),"Skill_Basic07" )
		elseif PresetId == 8 then
			C_RunScript( OwnerID(),TargetID(),"Skill_Basic08" )
		end
	end
	
end