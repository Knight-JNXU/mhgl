--MOB天风狂飓

function skill5003CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5003Use(Atk, Target, battle, skillLv)
    local Lv = Atk:GetLevel();
	local nDamskill1 = 0;
	local targetlist = {};	
	local listIndex = 0;
	local actor = battle:GetActor(listIndex);
	local DamBonus1 = {0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9,9.5,10,11,12,13,14,15,16,17,18,19,20};
	local nDamsBonus1 = 0;
	local j = 1;
	while j <= 30 do
	    nDamskill = Atk:GetSkillLv(5430 + j - 1);
		if nDamskill == 1 then 
            nDamsBonus1 = nDamsBonus1 + DamBonus1[j];
		end
		j = j + 1;
	end	
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, 100, SelAllSameTeam, 0, bufflist, 0);
	
	local i = 0;
	while targetlist[i] ~= nil do
		local hpChange = -2 * (Lv + 10) - 20 - 0.2 * nDamsBonus1 * Lv;
		local spChange = -0.8 * (Lv + 10) - 10;
		
		--注意，获取mob_id前一定要先判断是否为mob
		if Atk:GetMob_id() == 30203 then
			spChange = 2 * spChange;
		end
		
		local result = skillCanHit(Atk, targetlist[i]);
		if result == 2 then
			targetlist[i]:MissSkill();
		else
			targetlist[i]:ChangeHp(hpChange);
			targetlist[i]:ChangeSp(spChange);
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

