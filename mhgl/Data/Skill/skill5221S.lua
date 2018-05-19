--MOB凝血术

function skill5221CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5221Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local targetlist = {};
	local maxTargetCount = math.floor((Lv + 10 - 20) / 25) + 2;
	
	local RecBonus = {0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9,9.5,10,11,12,13,14,15,16,17,18,19,20};
	local nRecBonus = 0;
	local k = 1;
	while k <= 30 do
	    local nRecskill = Atk:GetSkillLv(5430 + k - 1);
		if nRecskill == 1 then 
            nRecBonus = nRecBonus + RecBonus[k];
		end
		k = k + 1;
	end	
	
	if maxTargetCount > 6 then
		maxTargetCount = 6;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	if skill == 1 then
	    maxTargetCount = math.floor((Lv + 10 - 20) / 25) + 3;
	    if maxTargetCount > 7 then
		    maxTargetCount = 7;
	    elseif maxTargetCount < 3 then
		    maxTargetCount = 3;
	    end
	end
	
	local bufflist = {1202, 2020, 2024, 2057, 1112};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 5);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local i = 0;
	while targetlist[i] ~= nil do
		local rec1 = 0.65 * (Lv + 10) + 0.01 * targetlist[i]:GetMaxHP() + 0.05 * Atk:GetPOW();
		local rec2 = 0.65 * (Lv + 10) + 0.01 * targetlist[i]:GetMaxHP() + 0.05 * Atk:GetPOW();
		
		if targetlist[i]:IsMob() == true then
			rec1 = rec1 + nRecBonus * Lv;
			rec2 = rec2 + nRecBonus * Lv;
		end
		
		local Rate = math.floor((Lv + 10) / 15) + 10;
		if math.random(1, 100) <= Rate then
			rec1 = rec1 * ( math.random(100, 150) / 1000 + 1);
			rec2 = rec2 * ( math.random(100, 150) / 1000 + 1);
		end
		
		if rec1 <= 1 then
			rec1 = 1;
		end
		
		if rec2 <= 1 then
			rec2 = 1;
		end
		
		local turn = 3 + math.floor((Lv + 10 - 25) / 15);
		if turn > 9 then
			turn = 9;
		elseif turn < 3 then
			turn = 3;
		end
		
		if targetlist[i]:IsBuffExist(1202) == false then
			targetlist[i]:ChangeHp(rec1);
			targetlist[i]:AddBuff(1202, (Lv + 10), rec2, 0, turn, 100);
			battle:PushReactionActor(targetlist[i]);
		end
		i = i + 1;
	end
end

