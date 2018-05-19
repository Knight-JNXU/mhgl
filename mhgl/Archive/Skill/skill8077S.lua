--boss奇经八脉

function skill8077CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill8077Use(Atk, Target, battle, skillLv)
	local targetlist = {};
	local Lv = Atk:GetLevel();		
	local maxTargetCount = math.floor((Lv - 35) / 25) + 1;
	
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
	
	local consumeSp = (0.1 * Lv + 20) * count;

	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local turn = 2 + math.floor((Lv - 35) / 25);
	
	if turn < 3 then 
		turn = 3;
	elseif turn > 6 then
		turn = 6;
	end
	
	local i = 0;
	while targetlist[i] ~= nil do
	
		local effectPow = (1 + (0.15 - 0.02 * math.floor((Lv - 35) / 25)) * Lv / 100) * targetlist[i]:GetPOW();
		
		if effectPow <= 1 then
			effectPow = 1;
		end
		
		targetlist[i]:AddBuff(34, Lv, effectPow, 0, turn, 100);
		
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

