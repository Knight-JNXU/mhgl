--BOSS小还丹

function skill8090CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill8090Use(Atk, Target, battle, skillLv)
	local targetlist = {};	
	local Lv = Atk:GetLevel();		
	local maxTargetCount = math.floor((Lv -20) / 30) + 2;
	
	if maxTargetCount > 6 then
		maxTargetCount = 6;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPUpSort, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local consumeSp = (0.1 * Lv + 20) * count;
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do		
		if Atk:GetIndex() ~= targetlist[i]:GetIndex() then
			local rec = (1.2 - 0.03 * math.floor((Lv - 30) / 60)) * Lv  + 0.01 * targetlist[i]:GetMaxSP();
			if rec <= 1 then
				rec = 1;
			end
			
			local turn = 2 + math.floor((Lv - 30) / 60);
			if turn > 4 then
				turn = 4;
			elseif turn < 2 then
				turn = 2;
			end
			
			targetlist[i]:ChangeSp(rec);
			battle:PushReactionActor(targetlist[i]);
			targetlist[i]:AddBuff(44, rec, 0, 0, turn, 100);		
		end
		
		i = i + 1;
	end
end
