function item11449CanUse(Atk, Target) 
end

function item11449Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local tDam = Atk:GetSkillLv(360) - Target:GetSkillLv(360);
		Target:ChangeHp(-30 - tDam);
	end
end
