--MOB醉生梦死·改

function skill5228CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5228Use(Atk, Target, battle, skillLv)	
	local targetlist = {};
	local Lv = Atk:GetLevel();
	local maxTargetCount = 0;
	local BuffRate = 100;
	local bufflist = {1110};
	local maxTargetCount = 2;
	
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
		
		local turn = 0;
		turn = 1 + math.floor((Lv + 10) / 50) + math.floor((Lv + 10 - targetlist[i]:GetLevel()) / 10);
		if turn < 1 then
			turn = 1;
		elseif turn > 5 then
			turn = 5;
		end
		
		local result = skillCanHit(Atk, targetlist[i]);	
		if result == 2 then
			targetlist[i]:MissSkill();
		else	
			if not targetlist[i]:HasBuff(1110) then
				targetlist[i]:AddBuff(1110, (Lv + 10), 0, 0, turn, 100);
			end
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
	
end

