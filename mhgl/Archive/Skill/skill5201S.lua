--MOB玉冰障

function skill5201CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5201Use(Atk, Target, battle, skillLv)
	local targetlist = {};
	local Lv = Atk:GetLevel();
	local maxTargetCount = 1;
	local skill = Atk:GetSkillLv(5300);
	
	if skill == 1 then
	    maxTargetCount = math.floor(Lv / 60) + 1;
		if maxTargetCount > 3 then
		    maxTargetCount = 3;
	    elseif maxTargetCount < 1 then
		    maxTargetCount = 1;
	    end
	end
	
	local bufflist = {1806, 2024, 2057};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, HPUpSort, bufflist, 3);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end	

	local i = 0;
	while targetlist[i] ~= nil do
		local turn = 2 + math.floor((Lv + 10 - 25) / 35);
		
		if turn < 2 then
			turn = 2;
		elseif turn > 5 then
			turn = 5;
		end
		
		local val = 3 * (math.floor((Lv + 10) / 5) + math.floor(((Lv + 10) - 50) / 5) * math.floor(((Lv + 10) + 500) / 550) + math.floor(((Lv + 10) - 100) / 5) * math.floor(((Lv + 10) + 500) / 600));
		targetlist[i]:AddBuff(1806, (Lv + 10), val, 0, turn, 100);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

