--MOB三阳玄针

function skill5183CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5183Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local nDamskill1 = 0;
	local targetlist = {};
	local maxTargetCount = math.floor((Lv + 10 - 25) / 25) + 2;
	
	if maxTargetCount > 5 then
		maxTargetCount = 5;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	if skill == 1 then
	    maxTargetCount = math.floor((Lv + 10 - 25) / 25) + 3;
	    if maxTargetCount > 6 then
		    maxTargetCount = 6;
	    elseif maxTargetCount < 3 then
		    maxTargetCount = 3;
	    end
	end
	
	local bufflist = {1505, 2024, 2057};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, ATKDownSort, bufflist, 3);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local i = 0;
	while targetlist[i] ~= nil do
		local turn = 2 + math.floor((Lv + 10 - 25) / 30);
		
		if turn < 2 then 
			turn = 2;
		elseif turn > 5 then
			turn = 5;
		end
		
		if Atk:IsMob() then
			if Atk:GetMob_id() == 10411 then
				turn = 5;
			end 
		end
		
		local effectAtk = targetlist[i]:GetATK() * 1075 / 1000;
		if effectAtk <= 1 then
			effectAtk = 1;
		end
		
		targetlist[i]:AddBuff(1505, (Lv + 10), effectAtk, 0, turn, 100);
		
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

