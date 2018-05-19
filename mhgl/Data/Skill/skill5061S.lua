--MOB”≠∑Á“ªµ∂’∂

function skill5061CanUse(Atk, skillLv, reqSkillLv, reqCharLv)	
end

function skill5061Use(Atk, Target, battle, skillLv)
    local Lv = Atk:GetLevel();
	Atk:SetPostSkill(5062, Target:GetIndex(), 1, (Lv+10));
	Atk:AddBuff(1302, (Lv+10), 0, 0, 2, 100);
	battle:PushReactionActor(Target);
end
