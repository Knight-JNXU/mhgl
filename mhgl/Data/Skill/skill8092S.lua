--金蚕蛊毒

function skill8092CanUse(Atk, skillLv, reqSkillLv, reqCharLv)	
	
end

function skill8092Use(Atk, Target, battle, skillLv)

	local Lv = Atk:GetLevel();
	local consumeSp = 0 * (0.7 * Lv + 0);
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展金蚕蛊毒", consumeSp);
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end

	if Target:IsBuffExist(1002) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经中了金蚕蛊毒");
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local nDam = 1;		--是CBatActor类型 
	local BuffRate = 80;
	if math.random(1, 100) > BuffRate then
		Target:MissSkill();
		battle:PushReactionActor(Target);
		do return end
	end
	
	local turn = 5;
	local hpChange = Target:GetHP() * 0.15;
	local spChange = hpChange * 0.1;
	local mhpChange = Target:GetMHP() * 0.1;
	local dulv = 20 * Lv;
	local dusxlv = 10 * Lv;
	local result = skillCanHit(Atk, Target);	
	if result == 2 then
		Target:MissSkill();
	else	
		if hpChange > dulv then
			Target:ChangeHp(-1 * dulv);
			Target:ChangeSp(-0.1 * dulv);
		else
			Target:ChangeHp(-1 * hpChange);
			Target:ChangeSp(-1 * spChange);
		end
		if mhpChange > dusxlv then
			Target:ChangeMHp(-1 * dusxlv);
		else
			Target:ChangeMHp(-1 * mhpChange);
		end		
		Target:AddBuff(1002, 1, 0, 0, turn, 100);
		
	end
	
	battle:PushReactionActor(Target);	
	
end

