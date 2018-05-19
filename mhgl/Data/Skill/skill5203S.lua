--MOB金针通脉

function skill5203CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5203Use(Atk, Target, battle, skillLv)
	local targetlist = {};
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);		
	local targetlist = {};
	local maxTargetCount = math.floor((skillLv - 35) / 20) + 3;
	
	if maxTargetCount > 7 then
		maxTargetCount = 7;
	elseif maxTargetCount < 3 then
		maxTargetCount = 3;
	end
	
	--[[if skill == 1 then
	    maxTargetCount = math.floor(Lv / 60) + 1;
		if maxTargetCount > 3 then
		    maxTargetCount = 3;
	    elseif maxTargetCount < 1 then
		    maxTargetCount = 1;
	    end
	end]]
	
	local bufflist = {1507, 2024, 2057};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, HPDownSort, bufflist, 3);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end	

	local i = 0;
	while targetlist[i] ~= nil do
		if targetlist[i]:IsBuffExist(1507) then
			Atk:SkillFail("\#W[战斗讯息]：目标已经处于金针通脉状态");
			do return end
		end
	
		local turn = 3 + math.floor((Lv + 10 - 25) / 25);
		
		if turn < 3 then 
			turn = 3;
		elseif turn > 7 then
			turn = 7;
		end	
		
		local effectMaxHp = 1.1 * targetlist[i]:GetMaxHP();
			
		if effectMaxHp <= 1 then
			effectMaxHp = 1;
		end
		
		targetlist[i]:AddBuff(1507, (Lv + 10), effectMaxHp, 0, turn, 100);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end
