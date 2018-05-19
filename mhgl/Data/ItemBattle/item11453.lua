function item11453CanUse(Atk, Target) 
end

function item11453Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local tDam = Atk:GetSkillLv(360) - Target:GetSkillLv(360);
		Target:ChangeHp(-70 - tDam);
	end
end
