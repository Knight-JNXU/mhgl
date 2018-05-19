--归心咒

function skill4210CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4210Use(Atk, Target, battle, skillLv)
	
	local consumeDp = 25;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展归心咒", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);
	
	local rec = (0.03 * Target:GetMaxSP() + 200 + Target:GetLevel() * (1 + Atk:GetWC() / 100)) / 2;
	if rec <= 1 then
		rec = 1;
	end
	if rec > Target:GetMaxSP() then
		rec = Target:GetMaxSP();
	end
	
	Target:ChangeSp(rec);
	battle:PushReactionActor(Target);
	
end

