--MOB鬼门阵

function skill5143CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5143Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local targetlist = {};
	local maxTargetCount = math.floor((Lv + 10 - 30) / 25) + 2;

	if maxTargetCount > 6 then
		maxTargetCount = 6;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	if Atk:GetMob_id() == 10413 then
		maxTargetCount = 3;
	end
		
		
	if skill == 1 then
	    maxTargetCount = math.floor((Lv + 10 - 30) / 25) + 3;
		if maxTargetCount > 7 then
		    maxTargetCount = 7;
	    elseif maxTargetCount < 3 then
		    maxTargetCount = 3;
	    end
	end 
	
	local bufflist = {1804, 2024, 2057};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, DEFUpSort, bufflist, 3);
	
	local i = 0;
	while targetlist[i] ~= nil do	
		if targetlist[i]:IsBuffExist(1804) then
			Atk:SkillFail("\#W[战斗讯息]：目标已经处在毒砂阵状态");
			do return end
		end
		
		local turn = 2 + math.floor((Lv + 10 - 30) / 30);
		
		if turn < 2 then
			turn = 2;
		elseif turn > 5 then
			turn = 5;
		end	
		
		local reAtkCount = 1 + math.floor((Lv + 10 - 30) / 45);
		
		if reAtkCount < 1 then
			reAtkCount = 1;
		elseif reAtkCount > 3 then
			reAtkCount = 3;
		end
		
		targetlist[i]:AddBuff(1804, (Lv + 10), reAtkCount, 0, turn, 100);
		
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

