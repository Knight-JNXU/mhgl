--七星回魂

function skill4221CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4221Use(Atk, Target, battle, skillLv)

	local consumeDp = 60;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	if Atk:HasSkill(4088) then
		consumeDp = consumeDp * 0.8;
  end	
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展七星回魂", consumeDp);
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	if (Target:IsPlayer() and Target:GetHP() == 0) == false then 
		Atk:SkillFail("\#W[战斗讯息]：目标无效");
		do return end
	else 
		Atk:ChangeDp(-1 * consumeDp, false);
		
		rec = 225 + Target:GetLevel() * (Atk:GetWC() / 100);
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
	
end

