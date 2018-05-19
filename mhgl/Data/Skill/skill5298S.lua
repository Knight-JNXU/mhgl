--MOB暗器

function skill5298CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5298Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();	
	local targetlist = {};		
	local maxTargetCount = 1;	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local i = 0;
	while targetlist[i] ~= nil do 		
		local hpChange = 10 * Lv;					
		local result = skillCanHit(Atk, targetlist[i]);
		if result == 2 then
			targetlist[i]:MissSkill();
		else
			targetlist[i]:ChangeHp(-1 * hpChange);
		end
		
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end 