--灵犀一指

function skill8001CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	
end

function skill8001Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local consumeSp = 10 * (0.4 * Lv + 10);
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展灵犀一指", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	if Target:IsBuffExist(1110) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经中了灵犀一指");
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local nDam = 1;		--是CBatActor类型 
	
	local BuffRate = 68;
	if Target:IsBuffExist(1807) then
		BuffRate = BuffRate * 0.9;
	end
		if BuffRate < 1 then
		BuffRate = 1;
	elseif BuffRate > 95 then
		BuffRate = 95;
	end
	
	if math.random(1, 100) > BuffRate then
		Target:MissSkill();
		battle:PushReactionActor(Target);
		do return end
	end
	
	local turn = 3;
	local result = skillCanHit(Atk, Target);	
	if result == 2 then
		Target:MissSkill();
	else	
		Target:AddBuff(1110, 1, 0, 0, turn, 100);
	end
	battle:PushReactionActor(Target);
	
end

