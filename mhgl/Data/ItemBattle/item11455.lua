function item11455CanUse(Atk, Target) 
end

function item11455Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local tDam = Atk:GetSkillLv(360) - Target:GetSkillLv(360);
		Target:ChangeHp(-90 - tDam);
	end
end
