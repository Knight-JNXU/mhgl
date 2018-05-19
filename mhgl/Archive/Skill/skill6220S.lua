--MOB天风狂飓

function skill6220CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill6220Use(Atk, Target, battle, skillLv)
    local Lv = Atk:GetLevel();
	local nDamskill1 = 0;
	local targetlist = {};	
	local listIndex = 0;
	local actor = battle:GetActor(listIndex);	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, 100, SelAllSameTeam, 0, bufflist, 0);
	
	local i = 0;
	while targetlist[i] ~= nil do
		local hpChange = -6.5 * Lv;
		
		if hpChange <= 10 then
			hpChange = math.random(1, 10)
		end
		
		--注意，获取mob_id前一定要先判断是否为mob
		
		local result = skillCanHit(Atk, targetlist[i]);
		if result == 2 then
			targetlist[i]:MissSkill();
		else
			targetlist[i]:ChangeHp(hpChange);			
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

