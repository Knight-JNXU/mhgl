--MOB隐遁

function skill5674CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5674Use(Atk, Target, battle, skillLv)
	if Target:IsMob() then
		if Target:GetMob_id() == 32340 then
			Target:AddBuff(1711, 0, 0, 0, 1, 100);
		else
			Target:AddBuff(1711, 0, 0, 0, 3, 100);
		end
	end
	battle:PushReactionActor(Target);
end

