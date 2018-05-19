--碧水清茗

function skill5278CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill5278Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local Lv = Atk:GetLevel();
	local nDamskill1 = 0;
	local maxTargetCount = 1;
	local skill = Atk:GetSkillLv(5300);
	local DamBonus1 = {0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9,9.5,10,11,12,13,14,15,16,17,18,19,20};
	local nDamsBonus1 = 0;
	local j = 1;
	while j <= 30 do
	    nDamskill1 = Atk:GetSkillLv(5430 + j - 1);
		if nDamskill1 == 1 then 
            nDamsBonus1 = nDamsBonus1 + DamBonus1[j];
		end
		j = j + 1;
	end	
	
	--[[if skill == 1 then
	    maxTargetCount = math.floor(Lv / 60) + 1;
		if maxTargetCount > 3 then
		    maxTargetCount = 3;
	    elseif maxTargetCount < 1 then
		    maxTargetCount = 1;
	    end
	end]]
	
	local bufflist = {1204, 2024, 2057, 3081};
	targetlist = BattleSort(battle, Atk, Target, 100, SelAllSameTeam, 0, bufflist, 4);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end	

	local i = 0;
	while targetlist[i] ~= nil do
		local turn = 2 + math.floor((Lv + 10 - 20) / 35);
		
		if turn < 2 then
			turn = 2;
		elseif turn > 5 then
			turn = 5;
		end
		local rec1 = 1.6 * (Lv + 10) + 0.01 * targetlist[i]:GetMaxHP() + 0.1 * Atk:GetPOW();
		local rec2 = (Lv + 10) + 0.05 * Atk:GetPOW();
		
		--[[if targetlist[i]:IsMob() == true then
			rec1 = rec1 + nDamsBonus1 * Lv;
			rec2 = rec2 + 0.6 * nDamsBonus1 * Lv;
		end]]
		
		if rec1 <= 1 then
			rec1 = 1;
		end
		if rec2 <= 1 then
			rec2 = 1;
		end
		
		targetlist[i]:AddBuff(1204, (Lv + 10), rec1, rec2, 150, 100);
		targetlist[i]:ChangeMHp(rec2);
		targetlist[i]:ChangeHp(rec1);
		battle:PushReactionActor(targetlist[i]);
	    i = i + 1;
	end
	
end

