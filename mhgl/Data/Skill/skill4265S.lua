--弑魔

function skill4265CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4265Use(Atk, Target, battle, skillLv)

	local consumeDp = 50;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	if Atk:HasSkill(4088) then
		consumeDp = consumeDp * 0.8;
  end	
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展弑魔", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);
	
	local FinalDam = 0.2 * Target:GetSP() + Target:GetLevel() * (Atk:GetWC() / 100);
	if FinalDam > Target:GetLevel() * 30 then
		FinalDam = Target:GetLevel() * 30;
	end
	if FinalDam < 1 then
		FinalDam = 1;
	end
	Target:ChangeSp(-1 * FinalDam);
	battle:PushReactionActor(Target);
end

