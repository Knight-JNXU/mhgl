function item11447CanUse(Atk, Target) 
end

function item11447Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local tDam = Atk:GetSkillLv(360) - Target:GetSkillLv(360);
		Target:ChangeHp(-10 - tDam);
	end
end
