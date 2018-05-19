--迷魂蛊毒

function skill8091CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill8091Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local consumeSp = 10 * (0.4 * Lv + 10);
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展迷魂蛊毒", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	if Target:IsBuffExist(1109) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经中了迷魂蛊毒");
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local nDam = 1;		--是CBatActor类型 
	local BuffRate = 72;
	local turn = 3;
	
	local result = skillCanHit(Atk, Target);	
	if result == 2 then
		Target:MissSkill();		
	else	
		Target:AddBuff(1109, 1, 0, 0, turn, 100);
	end
	battle:PushReactionActor(Target);
	
end

