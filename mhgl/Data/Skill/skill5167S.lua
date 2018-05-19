--MOB弛纵心猿秘法·改

function skill5167CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5167Use(Atk, Target, battle, skillLv)	
	local targetlist = {};
	local Lv = Atk:GetLevel();
	local maxTargetCount = 3;
	local BuffRate = 100;
	local bufflist = {1111};
	
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 1);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local i = 0;
	while targetlist[i] ~= nil do
		if math.random(1, 100) > BuffRate then
			targetlist[i]:MissSkill();
			battle:PushReactionActor(targetlist[i]);
			do return end
		end
		
		local result = skillCanHit(Atk, targetlist[i]);	
		if result == 2 then
			targetlist[i]:MissSkill();
		else	
			targetlist[i]:AddBuff(1111, (Lv + 10), 0, 0, 120, 100);
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
	
end

