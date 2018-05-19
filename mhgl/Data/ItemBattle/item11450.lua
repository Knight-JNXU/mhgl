function item11450CanUse(Atk, Target) 
end

function item11450Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local tDam = Atk:GetSkillLv(360) - Target:GetSkillLv(360);
		Target:ChangeHp(-40 - tDam);
	end
end
