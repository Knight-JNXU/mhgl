function item11461CanUse(Atk, Target) 
end

function item11461Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local tDam = Atk:GetSkillLv(360) - Target:GetSkillLv(360);
		Target:ChangeHp(-150 - tDam);
	end
end
