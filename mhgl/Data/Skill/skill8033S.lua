--燕子三抄水

function skill8033CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill8033Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local consumeSp = 10 * (0.3 * Lv + 10);
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展燕子三抄水", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	if Target:IsBuffExist(1803) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经处在燕子三抄水状态");
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
	
	Target:AddBuff(1803, 1, 0, 0, turn, 100);
	
	battle:PushReactionActor(Target);

end

