--碧血聚息

function skill4220CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4220Use(Atk, Target, battle, skillLv)
	
	local consumeDp = 55;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	if Atk:HasSkill(4088) then
		consumeDp = consumeDp * 0.8;
  end	
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展碧血聚息", consumeDp);
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	if Target:IsBuffExist(2020) then
		Atk:SkillFail("\#W[战斗讯息]：此目标不能接收治疗");
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);
	
	local rec = 0.04 * Target:GetMaxHP() + 300 + Target:GetLevel() * (2 + Atk:GetWC() / 100);
	
	if rec <= 1 then
		rec = 1;
	end
	if rec > Target:GetMaxHP() then
		rec = Target:GetMaxHP();
	end
	
	Target:ChangeMHp(rec);
	Target:ChangeHp(rec);
	battle:PushReactionActor(Target);
	
end

