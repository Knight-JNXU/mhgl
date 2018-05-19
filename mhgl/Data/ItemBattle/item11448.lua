function item11448CanUse(Atk, Target) 
end

function item11448Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local tDam = Atk:GetSkillLv(360) - Target:GetSkillLv(360);
		Target:ChangeHp(-20 - tDam);
	end
end
