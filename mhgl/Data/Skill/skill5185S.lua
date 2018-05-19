--MOB三阴玄针

function skill5185CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5185Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local targetlist = {};
	local maxTargetCount = math.floor((Lv + 10 - 35) / 25) + 2;
	
	if maxTargetCount > 5 then
		maxTargetCount = 5;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	if skill == 1 then
	    maxTargetCount = math.floor((Lv + 10 - 35) / 25) + 3;
	    if maxTargetCount > 10 then
		    maxTargetCount = 10;
	    elseif maxTargetCount < 3 then
		    maxTargetCount = 3;
	    end
	end
	
	local bufflist = {1506, 2024, 2057};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, POWUpSort, bufflist, 3);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
			
	local i = 0;
	while targetlist[i] ~= nil do
		local turn = 2 + math.floor((Lv + 10 - 35) / 25);
		
		if turn < 2 then 
			turn = 2;
		elseif turn > 5 then
			turn = 5;
		end
		
		local effectPow = targetlist[i]:GetPOW() * 1075 / 1000;
		if effectPow <= 1 then
			effectPow = 1;
		end
		
		targetlist[i]:AddBuff(1506, (Lv + 10), effectPow, 0, turn, 100);
		
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

