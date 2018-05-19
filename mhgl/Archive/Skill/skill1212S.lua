--七巧锁心剑

function skill1212CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需落日剑法修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill1212Use(Atk, Target, battle, skillLv)

	local consumeSp = 0.4 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足%d，无法施展七巧锁心剑", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	if Target:IsBuffExist(1800) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经处于七巧锁心剑状态");
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local turn = 3 + math.floor((skillLv - 30) / 30);
	if turn < 3 then
		turn = 3;
	elseif turn > 6 then
		trun = 6;
	end
	
	local ReAtkCount = 1; 
	
	Target:AddBuff(1800, skillLv, ReAtkCount, 0, turn, 100);
	battle:PushReactionActor(Target);
	
end

