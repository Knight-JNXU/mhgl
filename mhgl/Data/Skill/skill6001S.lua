--MOB 火属性 绝学

function skill6001CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill6001Use(Atk, Target, battle, skillLv)
	
	local lv = Atk:GetLevel();
	local targetlist = {};
	local skill = Atk:GetSkillLv(5300);
	local nDamskill1 = 0;
	--local TargetHP = {};
	--local KillFlag = {};
	local DamBonus1 = {0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9,9.5,10,11,12,13,14,15,16,17,18,19,20};
	local nDamsBonus1 = 0;
	local i = 1;
	while i <= 30 do
	    nDamskill1 = Atk:GetSkillLv(5430 + i - 1);
		if nDamskill1 == 1 then 
            nDamsBonus1 = nDamsBonus1 + DamBonus1[i];
		end
		i = i + 1;
	end	
	--[[local DamBonus = {1.1, 1.2, 1.3, 1.4, 0.8, 0.6, 0.4, 0.2, 0.8, 0.6, 0.4, 0.2, 0.1};
	local nDamsBonus = {};
	local buffid = {3050, 3051, 3052, 3053, 3060, 3061, 3062, 3063, 3070, 3071, 3072, 3073, 3074};]]
	
	local maxTargetCount = math.floor(lv / 30) + 1;
	if maxTargetCount > 3 then
		maxTargetCount = 3;
	elseif maxTargetCount < 1 then
		maxTargetCount = 1;
	end
	
	if skill == 1 then
	    maxTargetCount = math.floor(lv / 30) + 2;
	    if maxTargetCount > 5 then
		    maxTargetCount = 5;
	    elseif maxTargetCount < 2 then
		    maxTargetCount = 2;
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
		local ranDam = 2.25 - math.random(100, 300) / 1000
		local lv = targetlist[i]:GetLevel()
		local anti = targetlist[i]:GetElementAnti(3)
		local per =  ( 1000 - anti  ) /1000
		
		local hpChange = (Atk:GetElementAttack(3) + 3.2 * lv +  20 )  * ranDam * per;
		
		
		
		local result = skillCanHit(Atk, targetlist[i]);
		if result == 2 then
			targetlist[i]:MissSkill();
		else
			targetlist[i]:ChangeHp(-0.5 * hpChange);
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1
	end
end


