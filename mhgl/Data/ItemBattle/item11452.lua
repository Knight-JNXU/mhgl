function item11452CanUse(Atk, Target) 
end

function item11452Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local tDam = Atk:GetSkillLv(360) - Target:GetSkillLv(360);
		Target:ChangeHp(-60 - tDam);
	end
end
