--MOB弑神

function skill6242CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill6242Use(Atk, Target, battle, skillLv)

	local Lv = Atk:GetLevel();
	--[[local consumeDp = 50;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展弑神", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);]]
	
	local FinalDam = 0.2 * Target:GetHP() + Target:GetLevel();
	if FinalDam > Target:GetLevel() * 40 then
		FinalDam = Target:GetLevel() * 40;
	end
	if FinalDam < 10 then
		FinalDam = math.random(1, 10);
	end
	Target:ChangeHp(-1 * FinalDam);
	battle:PushReactionActor(Target);
end

