--化瘀

function skill0462CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill0462Use(Atk, Target, battle, skillLv)
	
	local Lv = Atk:GetLevel();
	local consumeSp = 0.5 * Lv + 1;
	
	local Msg = string.format("\#W内力不足\#G%d\#W，无法施展化瘀", consumeSp);
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	Target:ChangeHp(100);
	battle:PushReactionActor(Target);
	
end
