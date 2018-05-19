--MOB免疫所有攻击

function skill5276CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5276Use(Atk, Target, battle, skillLv)
	local targetlist = {};
	local Lv = Atk:GetLevel();
	local nDamskill1 = 0;
	local maxTargetCount = 1;
	local skill = Atk:GetSkillLv(5300);
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
	
	if skill == 1 then
	    maxTargetCount = math.floor(Lv / 60) + 1;
		if maxTargetCount > 3 then
		    maxTargetCount = 3;
	    elseif maxTargetCount < 1 then
		    maxTargetCount = 1;
	    end
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, HPUpSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end	

	local i = 0;
	while targetlist[i] ~= nil do				
		targetlist[i]:AddBuff(1615, (Lv + 10), 0, 0, 120, 100);
		battle:PushReactionActor(targetlist[i]);
	    i = i + 1;
	end
end 