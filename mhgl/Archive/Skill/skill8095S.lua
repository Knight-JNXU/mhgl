--天竺瑜珈术

function skill8095CanUse(Atk, skillLv, reqSkillLv, reqCharLv)	
	
end

function skill8095Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local consumeHp = (0.5 * Lv + 10) * 10;
	if Atk:IsBuffExist(1702) then
		consumeHp = consumeHp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：生命不足\#G%d\#W，无法施展天竺瑜珈术", consumeHp);
	if  Atk:GetHP() < consumeHp then
		Atk:SkillFail(Msg);
		do return end
	end

	Atk:ChangeHp(-1 * consumeHp, false);
	
	local SpChange = 10 * (Lv + 20);

	Target:ChangeSp(SpChange);
	
	battle:PushReactionActor(Target);	
end

