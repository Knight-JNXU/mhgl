--MOB云寂术

function skill5222CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5222Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local targetlist = {};
	local maxTargetCount = math.floor((Lv + 10 - 30) / 25) + 2;

	if maxTargetCount > 5 then
		maxTargetCount = 5;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end

	if skill == 1 then
	    maxTargetCount = math.floor((Lv + 10 - 30) / 25) + 3;
	    if maxTargetCount > 6 then
		    maxTargetCount = 6;
	    elseif maxTargetCount < 3 then
		    maxTargetCount = 3;
	    end
	end
	
	local bufflist = {1807, 2024, 2057};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 3);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end

	local turn = 2 + math.floor((Lv + 10 - 30) / 30);

	if turn < 2 then
		turn = 2;
	elseif turn > 5 then
		turn = 5;
	end
	
	local i = 0;
	while targetlist[i] ~= nil do

		targetlist[i]:AddBuff(1807, (Lv + 10), 0, 0, turn, 100);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

