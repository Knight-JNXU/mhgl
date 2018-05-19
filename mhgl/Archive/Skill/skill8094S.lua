--再生秘术

function skill8094CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill8094Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local consumeSp = 10 * (0.5 * Lv + 10);
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展再生秘术", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local hpChange = (2 * Lv + 40) * 10;
	
	Target:ChangeHp(hpChange);
	battle:PushReactionActor(Target);
	
end

