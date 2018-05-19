--水幕天华

function skill8064CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill8064Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local consumeSp = 10 * (0.4 * Lv + 10);
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足%d，无法施展水幕天华", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	if Target:IsBuffExist(1800) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经处于水幕天华状态");
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local turn = 6;
	
	local ReAtkCount = 1; 
	
	Target:AddBuff(1800, 1, ReAtkCount, 0, turn, 100);
	battle:PushReactionActor(Target);
	
end

