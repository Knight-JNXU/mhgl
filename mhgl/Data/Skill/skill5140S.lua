--MOB满天花雨

function skill5140CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5140Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local nDamskill1 = 0;
	local targetlist = {};
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
	
	local maxTargetCount = math.floor((Lv + 10 - 25) / 20) + 2;
	
	if maxTargetCount > 7 then
		maxTargetCount = 7;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	if skill == 1 then
	    maxTargetCount = math.floor((Lv + 10 - 25) / 20) + 3;
	    if maxTargetCount > 8 then
		    maxTargetCount = 8;
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
		
		local nDam = Lv + 10;
		local FinalDam = (2.4 - 0.2 * count) * (Lv + 10) + Lv + nDam + nDamsBonus1 * Lv;
		targetlist[i]:ChangeHp(-1 * FinalDam);
		
		local duRate = math.floor((Lv + 10) / 15) + 25;
		local result = skillCanHit(Atk, targetlist[i]);
		if result == 2 then
			targetlist[i]:MissSkill();		
		elseif math.random(1, 100) <= duRate then
			if (targetlist[i]:IsBuffExist(1001) or targetlist[i]:IsBuffExist(1002)) ==  false then
				targetlist[i]:AddBuff(1001, (Lv + 10), 0, 0, 3, 100);
			end
		end
		
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
	
end

