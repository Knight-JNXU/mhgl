function item11458CanUse(Atk, Target) 
end

function item11458Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local tDam = Atk:GetSkillLv(360) - Target:GetSkillLv(360);
		Target:ChangeHp(-120 - tDam);
	end
end
