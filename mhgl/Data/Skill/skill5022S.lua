--MOB蛟龙缠星

function skill5022CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5022Use(Atk, Target, battle, skillLv)
	local targetlist = {};
	local Lv = Atk:GetLevel();
	local maxTargetCount = 1;
	local skill = Atk:GetSkillLv(5300);

    if skill == 1 then
	    maxTargetCount = math.floor((Lv + 20)/ 40) + 1;
		if maxTargetCount > 5 then
		    maxTargetCount = 5;
	    elseif maxTargetCount < 1 then
		    maxTargetCount = 1;
	    end
	end
	
	local bufflist = {1400, 2024, 2057};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 3);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end	

	local i = 0;
	while targetlist[i] ~= nil do
	    local turn = 2 + math.floor((Lv + 10 - 15) / 30);
	    if turn < 2 then 
		    turn = 2;
	    elseif turn > 5 then
		    turn = 5;
	    end	
		
	    local effectSpd = 0.925 * targetlist[i]:GetSPD();
		
	    if effectSpd <= 1 then
		    effectSpd = 1;
	    end
		
	    targetlist[i]:AddBuff(1400, (Lv + 10), effectSpd, 0, turn, 100);
		
	    battle:PushReactionActor(targetlist[i]);
	    i = i + 1;
	end
end
