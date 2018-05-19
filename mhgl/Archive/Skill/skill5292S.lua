--MOB攻、防、内三属性强化

function skill5292CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5292Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local nDamskill1 = 0;
	local targetlist = {};
	--local maxTargetCount = math.floor((Lv + 10 - 25) / 25) + 2;
	local maxTargetCount = 1;
	
	--[[if maxTargetCount > 5 then
		maxTargetCount = 5;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	if skill == 1 then
	    maxTargetCount = math.floor((Lv + 10 - 25) / 25) + 3;
	    if maxTargetCount > 6 then
		    maxTargetCount = 6;
	    elseif maxTargetCount < 3 then
		    maxTargetCount = 3;
	    end
	end]]
	
	local bufflist = {1504, 1505, 1506, 2024, 2057};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, ATKDownSort, bufflist, 5);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local i = 0;
	while targetlist[i] ~= nil do
		local turn = 120;		
		local effectAtk = targetlist[i]:GetATK() * 1200 / 1000;
		local effectDef = targetlist[i]:GetDEF() * 2000 / 1000;
		local effectPow = targetlist[i]:GetPOW() * 2000 / 1000;
		if effectAtk <= 1 then
			effectAtk = 1;
		end
		
		targetlist[i]:AddBuff(1505, (Lv + 10), effectAtk, 0, turn, 100);
		targetlist[i]:AddBuff(1504, (Lv + 10), effectDef, 0, turn, 100);
		targetlist[i]:AddBuff(1506, (Lv + 10), effectPow, 0, turn, 100);
		
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

