--MOB降属性多封

function skill5299CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5299Use(Atk, Target, battle, skillLv)	
	local targetlist = {};
	local Lv = Atk:GetLevel();
	local maxTargetCount = 3;
	local BuffRate = 100;
	local bufflist = {1110, 1105, 1116};
		
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 3);
	
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
		turn = 3 + math.floor((Lv + 10) / 50) + math.floor((Lv + 10 - targetlist[i]:GetLevel()) / 10);
		if turn < 3 then
			turn = 3;
		elseif turn > 5 then
			turn = 5;
		end
		
		local result = skillCanHit(Atk, targetlist[i]);	
		if result == 2 then
			targetlist[i]:MissSkill();
		else	
			--targetlist[i]:AddBuff(1110, (Lv + 10), 0, 0, turn, 100);
			local a = math.random(1, 2);
			if a == 1 then
				targetlist[i]:AddBuff(1105, (Lv + 10), 0, 0, turn, 100);
			else
				targetlist[i]:AddBuff(1116, (Lv + 10), 0, 0, turn, 100);
			end
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
	
end

