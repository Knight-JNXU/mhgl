--歃血重生

function skill4408CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4408Use(Atk, Target, battle, skillLv)
	
	local sLv = Atk:GetLevel();
	local consumeSp = 0.1 * Atk:GetSP() + 15;
	local consumeHp = 0.15 * Atk:GetHP() + 10;
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展神·歃血重生",consumeSp);
	local Msg1 = string.format("\#W[战斗讯息]：生命不足\#G%d\#W，无法施展神·歃血重生",consumeHp);
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	if  Atk:GetHP() < consumeHp then
		Atk:SkillFail(Msg1);
		do return end
	end
	Atk:ChangeSp(-1 * consumeSp, false);
	Atk:ChangeHp(-1 * consumeHp, false);
	
	local rec = 0;
	if (Target:IsPlayer() and Target:GetHP() == 0) == false then 
		Atk:SkillFail("\#W[战斗讯息]：目标无效");
		do return end
	else 
		
		
		rec = Atk:GetHP() / 2 + sLv;
		if rec < 1 then
			rec = 1;
		end
		if rec > Target:GetMaxHP() then
			rec = Target:GetMaxHP();
		end
		
		Target:ChangeMHp(3 * rec);
		Target:ChangeHp(rec);
		battle:PushReactionActor(Target);
	end
end
