--内力传输

function skill8026CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill8026Use(Atk, Target, battle, skillLv)

	local Lv = Atk:GetLevel();
	local consumeSp = 10 * (1 * Lv + 10);
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展内力传输", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end

	local rec1 = 0;
	local rec2 = 0;
	if (Target:IsPlayer() and Target:GetHP() == 0) == false then 
		Atk:SkillFail("\#W[战斗讯息]：目标无效");
		do return end
	else 
		Atk:ChangeSp(-1 * consumeSp, false);
		
		
		rec1 = 10 * 3.5 * Lv;		
		if rec1 <= 1 then
			rec1 = 1;
		end
		if rec1 > Target:GetMaxHP() then
			rec1 = Target:GetMaxHP();
		end
		
		rec2 = 10 * 5.3 * Lv;		
		if rec2 <= 0  then
			rec2 = 1;
		end
		if rec2 > Target:GetMaxHP() then
			rec2 = Target:GetMaxHP();
		end
		
		Target:ChangeMHp(rec2);
		Target:ChangeHp(rec1);
		battle:PushReactionActor(Target);
	end
	
end
