--凝心咒

function skill4212CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4212Use(Atk, Target, battle, skillLv)
	
	local consumeDp = 75;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	if Atk:HasSkill(4088) then
		consumeDp = consumeDp * 0.8;
  end	
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展凝心咒", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);
	
	local rec = (0.09 * Target:GetMaxSP() + 600 + Target:GetLevel() * (3 + Atk:GetWC() / 100)) / 2;
	if rec <= 1 then
		rec = 1;
	end
	if rec > Target:GetMaxSP() then
		rec = Target:GetMaxSP();
	end
	
	Target:ChangeSp(rec);
	battle:PushReactionActor(Target);
	
end


