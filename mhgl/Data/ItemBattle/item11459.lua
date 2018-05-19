function item11459CanUse(Atk, Target) 
end

function item11459Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local tDam = Atk:GetSkillLv(360) - Target:GetSkillLv(360);
		Target:ChangeHp(-130 - tDam);
	end
end
