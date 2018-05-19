--MOB金针术

function skill6207CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill6207Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local nDamskill1 = 0;
	local maxTargetCount = 2;	
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
	if Atk:GetMob_id() == 32021 or Atk:GetMob_id() == 32022 then
		maxTargetCount = 3
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local Lv = Atk:GetLevel();
	
	local i = 0;
	while targetlist[i] ~= nil do
	--for i = 0, targetcounter  - 1 do
		local hpChange = Atk:GetPOW() - targetlist[i]:GetPOW() + 60 + nDamsBonus1 * Lv;
		
		--if hpChange > targetlist[i]:GetHP() then
		--	hpChange = targetlist[i]:GetHP();
		--end
		
		if hpChange < 10 then
			hpChange = math.random(1, 10);
		end
		targetlist[i]:ChangeHp(-1 * hpChange);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
	
end

