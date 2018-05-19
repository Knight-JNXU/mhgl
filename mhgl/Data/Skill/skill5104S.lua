--MOB罗刹魅

function skill5104CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5104Use(Atk, Target, battle, skillLv)
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
	
	local bufflist = {1503, 2024, 2057};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 3);
	
	local i = 0;
	while targetlist[i] ~= nil do
		local turn = 3 + math.floor((Lv - 5) / 30);
		
		if turn < 3 then 
			turn = 3;
		elseif turn > 6 then
			turn = 6;
		end	
		
		local effectSpd = 1.075 * targetlist[i]:GetSPD();
			
		if effectSpd <= 1 then
			effectSpd = 1;
		end
		
		targetlist[i]:AddBuff(1503, (Lv + 10), effectSpd, 0, turn, 100);
		battle:PushReactionActor(targetlist[i]);
	    i = i + 1;
	end
end
