function item11456CanUse(Atk, Target) 
end

function item11456Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local tDam = Atk:GetSkillLv(360) - Target:GetSkillLv(360);
		Target:ChangeHp(-100 - tDam);
	end
end
