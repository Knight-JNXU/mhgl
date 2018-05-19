--MOB变态天外飞仙

function skill5295CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5295Use(Atk, Target, battle, skillLv)
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
		
		local hpChange = Atk:GetATK() - targetlist[i]:GetDEF();
		
		local result = skillCanHit(Atk, targetlist[i]);
		if result == 2 then
			targetlist[i]:MissSkill();
		else
			targetlist[i]:ChangeHp(-1.2 * hpChange);			
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

