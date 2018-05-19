--MOB无方变幻

function skill5166CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5166Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local hpChange = 2 * (Lv + 10) + 40;
	
	Target:ChangeHp(hpChange);

	battle:PushReactionActor(Target);
	
end

