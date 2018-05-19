--MOB李寻欢（叶开）-小李飞刀

function skill6216CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill6216Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local nDamskill1 = 0;
	local CritHit = 0;
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
	
	local maxTargetCount = math.random(6, 10);
	
	if Atk:GetMob_id() == 30725 then
		maxTargetCount = 5;
	elseif Atk:GetMob_id() == 8021 then
		maxTargetCount = 3;
	elseif Atk:GetMob_id() == 8026 then
		maxTargetCount = 2;
	end

	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	local countDam = 1;
	while targetlist[count] ~= nil do
		count = count + 1;
	end	
	
	local i = 0;
	while targetlist[i] ~= nil do 
				
		local HitRate = 30;
		
		if Atk:GetMob_id() == 30725 then
			HitRate = 25;
		elseif Atk:GetMob_id() == 8021 or Atk:GetMob_id() == 8026 then
			HitRate = 0;
		end
		
		local hpChange = 0;
		
		if Atk:GetMob_id() == 30725 then
			if math.random(1, 100) <= HitRate then
				hpChange = 2 * (9 * Lv);
				CritHit = 1;
			else
				hpChange = 9 * Lv;
			end
		elseif Atk:GetMob_id() == 8021 then
			hpChange = targetlist[i]:GetHP() - 1;			
		elseif Atk:GetMob_id() == 8026 then
			hpChange = 3 * Lv;	
		else		
			if math.random(1, 100) <= HitRate then
				hpChange = 2 * (8 * Lv);
				CritHit = 1;
			else
				hpChange = 8 * Lv;
			end
		end
		
		if hpChange <= 10 then
			hpChange = math.random(1, 10)
		end
		
		local result = skillCanHit(Atk, targetlist[i]);
		if result == 2 then
			targetlist[i]:MissSkill();
		else
			targetlist[i]:ChangeHp(-1 * hpChange);
		end
		
		if CritHit == 1 then
			targetlist[i]:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
		end
		
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
	if Atk:GetMob_id() == 8021 then
		Atk:AddBuff(4003, 0, 0, 0, 120, 100)
	end
end

