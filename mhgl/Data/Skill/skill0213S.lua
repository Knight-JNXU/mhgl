--MOB七巧锁心剑

function skill0213CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill0213Use(Atk, Target, battle, skillLv)
    local targetlist = {};
	local Lv = Atk:GetLevel();
	local maxTargetCount = 1;
	local skill = Atk:GetSkillLv(5300);

    if skill == 1 then
	    maxTargetCount = math.floor((Lv + 10 - 70)/ 70) * math.floor((Lv + 130)/ 200) + 1;
	    if maxTargetCount > 3 then
		    maxTargetCount = 3;
	    elseif maxTargetCount < 1 then
		    maxTargetCount = 1;
	    end
	end
	
	local bufflist = {1800, 2024, 2057};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, HPUpSort, bufflist, 3);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end	

	local i = 0;
	while targetlist[i] ~= nil do	
	    
	    local turn = 3 + math.floor((Lv + 10 - 30) / 30);
	    if turn < 3 then
		    turn = 3;
	    elseif turn > 6 then
		    trun = 6;
	    end
		
	    local ReAtkCount = 1; 
		
	    targetlist[i]:AddBuff(1800, (Lv + 10), ReAtkCount, 0, turn, 100);
	    battle:PushReactionActor(targetlist[i]);
	    i = i + 1;
	end
end
