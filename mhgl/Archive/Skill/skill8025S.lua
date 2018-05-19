--踏月留香

function skill8025CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill8025Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local consumeSp = 10 * (0.3 * Lv + 10);
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg1 = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展踏月留香", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg1);
		do return end
	end
	
	if Target:IsBuffExist(1201) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经处在踏月留香状态");
		do return end
	end
	if Target:IsBuffExist(2020) then
		Atk:SkillFail("\#W[战斗讯息]：此目标不能接收治疗");
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local turn = 5;
	if Target:IsBuffExist(2014) then
		turn = turn * 2;
	end
	if Target:IsBuffExist(2047) then
		turn = turn * 4;
	end
	
	local rec1 = 10 * (3 * Lv + 0.1 * Atk:GetPOW()/10 + 0.01 * Target:GetMaxHP()/40);
	local rec2 = 10 * (1.85 * Lv + 0.05 * Atk:GetPOW()/10);
	if rec1 <= 1 then
		rec1 = 1;
	end
	if rec2 <= 1 then
		rec2 = 1;
	end
	
	Target:ChangeMHp(rec2);
	Target:ChangeHp(rec1);
	Target:AddBuff(1201, 1, rec1, rec2, turn, 100);
	
	battle:PushReactionActor(Target);
	
end

