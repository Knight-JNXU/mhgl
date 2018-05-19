function item11454CanUse(Atk, Target) 
end

function item11454Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local tDam = Atk:GetSkillLv(360) - Target:GetSkillLv(360);
		Target:ChangeHp(-80 - tDam);
	end
end
