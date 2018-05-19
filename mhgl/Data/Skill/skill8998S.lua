--BOSS玉冰障

function skill8998CanUse(Atk, skillLv, reqSkillLv, reqCharLv)

end

function skill8998Use(Atk, Target, battle, skillLv)
	Target:AddBuff(8998, skillLv, 100, 0, 10, 100);
	battle:PushReactionActor(Target);
end

