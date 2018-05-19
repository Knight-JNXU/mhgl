--灵合归元

function skill4204CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4204Use(Atk, Target, battle, skillLv)
	
	local consumeDp = 100;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展灵合归元", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);
	
	local rec = 0.5 * Target:GetMaxHP() + Target:GetLevel() * (Atk:GetWC() / 100);
	if rec <= 1 then
		rec = 1;
	end
	if rec > Target:GetLevel() * 30 then
		rec = Target:GetLevel() * 30;
	end
	
	Target:ChangeHp(rec);
	battle:PushReactionActor(Target);
	
end


