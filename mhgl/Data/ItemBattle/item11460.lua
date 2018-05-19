function item11460CanUse(Atk, Target) 
end

function item11460Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local tDam = Atk:GetSkillLv(360) - Target:GetSkillLv(360);
		Target:ChangeHp(-140 - tDam);
	end
end
