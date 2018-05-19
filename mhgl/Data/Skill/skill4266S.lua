--幽冥噬血

function skill4266CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4266Use(Atk, Target, battle, skillLv)

	local consumeDp = 70;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	if Atk:HasSkill(4088) then
		consumeDp = consumeDp * 0.8;
  end	
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展幽冥噬血", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	if Target:IsBoss() then
		Atk:SkillFail("无法对主怪使用");
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);
	
	local FinalDam = 0.2 * Target:GetHP() + Target:GetLevel() * (Atk:GetWC() / 100);
	if FinalDam > Target:GetLevel() * 40 then
		FinalDam = Target:GetLevel() * 40;
	end
	if FinalDam < 1 then
		FinalDam = 1;
	end
	Target:ChangeHp(-1 * FinalDam);
	Atk:ChangeHp(FinalDam);
	battle:PushReactionActor(Target);
end

