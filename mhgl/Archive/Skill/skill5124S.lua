--MOB云烟四起

function skill5124CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5124Use(Atk, Target, battle, skillLv)
    local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local targetlist = {};
	local maxTargetCount = 1;

	if skill == 1 then
	    maxTargetCount = math.floor((Lv + 20)/ 40) + 1;
		if maxTargetCount > 5 then
		    maxTargetCount = 5;
	    elseif maxTargetCount < 1 then
		    maxTargetCount = 1;
	    end
	end 
	
	local bufflist = {1803, 2024, 2057};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, POWUpSort, bufflist, 3);
	
	local i = 0;
	while targetlist[i] ~= nil do	
		if Target:IsBuffExist(1803) then
			do return end
		end
	
		local turn = 2 + math.floor((Lv + 10 - 30) / 30);
		
		if turn < 2 then
			turn = 2;
		elseif turn > 5 then
			turn = 5;
		end	
		
		targetlist[i]:AddBuff(1803, (Lv + 10), 0, 0, turn, 100);
		
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

