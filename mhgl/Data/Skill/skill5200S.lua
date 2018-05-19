--MOB残雪飘飞

function skill5200CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5200Use(Atk, Target, battle, skillLv)
	
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local nDamskill1 = 0;
	local targetlist = {};	
	local maxTargetCount = math.floor((Lv + 10 - 25) / 25) + 2;
	local DamBonus1 = {0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9,9.5,10,11,12,13,14,15,16,17,18,19,20};
	local nDamsBonus1 = 0;
	local j = 1;
	while j <= 30 do
	    nDamskill1 = Atk:GetSkillLv(5430 + j - 1);
		if nDamskill1 == 1 then 
            nDamsBonus1 = nDamsBonus1 + DamBonus1[j];
		end
		j = j + 1;
	end	
		
	if maxTargetCount > 5 then
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
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local i = 0;
	while targetlist[i] ~= nil do
		
		local FinalDam = (3 - 0.1 * count) * (Lv + 10) + 0.2 * nDamsBonus1 * Lv; 
		
		targetlist[i]:ChangeHp(-1 * FinalDam);
		targetlist[i]:ChangeMHp(-0.25 * FinalDam);
		
		local duRate = math.floor ((Lv + 10) / 10) + 25;
		if math.random(1, 100) < duRate then
			targetlist[i]:AddBuff(1001, (Lv + 10), 0, 0, 3, 100);
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

