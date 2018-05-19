function item11451CanUse(Atk, Target) 
end

function item11451Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local tDam = Atk:GetSkillLv(360) - Target:GetSkillLv(360);
		Target:ChangeHp(-50 - tDam);
	end
end
