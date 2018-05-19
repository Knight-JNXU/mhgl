--MOB金针通脉·改

function skill5281CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5281Use(Atk, Target, battle, skillLv)
	local targetlist = {};
	local Lv = Atk:GetLevel();
	local maxTargetCount = 10;
	local skill = Atk:GetSkillLv(5300);
	
	--[[if skill == 1 then
	    maxTargetCount = math.floor(Lv / 60) + 1;
		if maxTargetCount > 3 then
		    maxTargetCount = 3;
	    elseif maxTargetCount < 1 then
		    maxTargetCount = 1;
	    end
	end]]
	
	local bufflist = {1507, 2024, 2038, 2057};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, HPDownSort, bufflist, 4);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end	

	local i = 0;
	while targetlist[i] ~= nil do
		if targetlist[i]:IsBuffExist(1507) then
			Atk:SkillFail("\#W[战斗讯息]：目标已经处于金针通脉状态");
			do return end
		end
	
		--[[local turn = 3 + math.floor((Lv + 10 - 25) / 25);
		
		if turn < 3 then 
			turn = 3;
		elseif turn > 7 then
			turn = 7;
		end	]]
		
		local effectMaxHp = 2; --* targetlist[i]:GetMaxHP();
		if Target:GetMob_id() == 30204 or Target:GetMob_id() == 30205 then
			effectMaxHp = 1.3;
		end	
		if effectMaxHp <= 1 then
			effectMaxHp = 1;
		end
		
		targetlist[i]:AddBuff(1516, (Lv + 10), effectMaxHp, 0, 4, 100);
		targetlist[i]:ChangeHp(targetlist[i]:GetHP() * (effectMaxHp - 1), false);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end
