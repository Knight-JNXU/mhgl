--气合归元

function skill4203CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4203Use(Atk, Target, battle, skillLv)
	
	local consumeDp = 50;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展气合归元", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);
	
	local rec = 0.25 * Target:GetMaxHP() + Target:GetLevel() * (Atk:GetWC() / 100);
	if rec <= 1 then
		rec = 1;
	end
	if rec > Target:GetLevel() * 18 then
		rec = Target:GetLevel() * 18;
	end
	
	Target:ChangeHp(rec);
	battle:PushReactionActor(Target);
	
end


