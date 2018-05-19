--气运丹田

function skill8045CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill8045Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local consumeSp = 10 * (0.2 * Lv + 5);
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足%d，无法施展气运丹田", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	if Target:IsBuffExist(1521) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经处于气运丹田状态");
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
	
	Target:AddBuff(1521, 1, 0, 0, turn, 100);
	
	battle:PushReactionActor(Target);
	
end
