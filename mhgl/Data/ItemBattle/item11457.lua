function item11457CanUse(Atk, Target) 
end

function item11457Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local tDam = Atk:GetSkillLv(360) - Target:GetSkillLv(360);
		Target:ChangeHp(-110 - tDam);
	end
end
