--奇经八脉

function skill0140CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需黄帝内经修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill0140Use(Atk, Target, battle, skillLv)
	local targetlist = {};
	
	local maxTargetCount = math.floor((skillLv - 35) / 25) + 1;
	
	if maxTargetCount > 5 then
		maxTargetCount = 5;
	elseif maxTargetCount < 1 then
		maxTargetCount = 1;
	end
	
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, POWDownSort, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local consumeSp = (0.1 * skillLv + 20) * count;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展奇经八脉", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local turn = 2 + math.floor((skillLv - 35) / 25);
	
	if turn < 3 then 
		turn = 3;
	elseif turn > 6 then
		turn = 6;
	end
	
	local i = 0;
	while targetlist[i] ~= nil do
	
		local effectPow = (1 + (0.15 - 0.02 * math.floor((skillLv - 35) / 25)) * skillLv / 100) * targetlist[i]:GetPOW();
		
		if effectPow <= 1 then
			effectPow = 1;
		end
		
		targetlist[i]:AddBuff(34, skillLv, effectPow, 0, turn, 100);
		
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

