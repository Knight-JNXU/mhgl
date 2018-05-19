--清心咒

function skill4211CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4211Use(Atk, Target, battle, skillLv)
	
	local consumeDp = 50;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	if Atk:HasSkill(4088) then
		consumeDp = consumeDp * 0.8;
  end	
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展清心咒", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);
	
	local rec = (0.06 * Target:GetMaxSP() + 400 + Target:GetLevel() * (2 + Atk:GetWC() / 100)) / 2;
	if rec <= 1 then
		rec = 1;
	end
	if rec > Target:GetMaxSP() then
		rec = Target:GetMaxSP();
	end
	
	Target:ChangeSp(rec);
	battle:PushReactionActor(Target);
	
end


