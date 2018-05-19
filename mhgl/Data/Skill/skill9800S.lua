--MOB圣妙吉祥+万息回元术

function skill9800CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill9800Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local nDamskill1 = 0;
	local targetlist = {};
	local maxTargetCount = math.floor((Lv + 10 - 20) / 25) + 2;
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
	
	if maxTargetCount > 2 then
		maxTargetCount = 2;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	if Lv > 155 then
	   maxTargetCount = 3
	end
	
	if skill == 1 then
	    maxTargetCount = math.floor((Lv + 10 - 20) / 25) + 3;
	    if maxTargetCount > 7 then
		    maxTargetCount = 7;
	    elseif maxTargetCount < 3 then
		    maxTargetCount = 3;
	    end
	end
	
	local bufflist = {2020};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, HPUpSort, bufflist, 1);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	------------------------------------------------------------
	local MobID = Atk:GetMob_id();
	if MobID == 565 or MobID == 598 then
		local consumeSp = 100 * count;
	
		local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展妖兽技能", consumeSp);
	
		if  Atk:GetSP() < consumeSp then
			Atk:SkillFail(Msg);
			do return end
		end
	
		Atk:ChangeSp(-1 * consumeSp, false);
	end
	-----------------------------------------------------------
	local i = 0;
	while targetlist[i] ~= nil do
		local rec1 = (3 - 0.1 * count) * (Lv + 10) + 0.02 * targetlist[i]:GetMaxHP() + 0.15 * Atk:GetPOW();
		local rec2 = (1.3 - 0.05 * count) * (Lv + 10) + 0.1 * Atk:GetPOW();
		
		if targetlist[i]:IsMob() == true then
			rec1 = rec1 + nDamsBonus1 * Lv;
			rec2 = rec2 + 0.5 * nDamsBonus1 * Lv;
		end
		--[[if targetlist[i]:GetMob_id() == 30351 or targetlist[i]:GetMob_id() == 30352 or targetlist[i]:GetMob_id() == 30002 then 
			rec1 = 10 * rec1
			rec2 = 10 * rec2
		end]]
		if Atk:GetMob_id() == 30351 then
			rec1 = 10 * rec1
			rec2 = 10 * rec2
		end
		
		if MobID == 565 or MobID == 598 then
		   rec1 = Atk:GetLevel() * 8 + Atk:GetPOW() + math.random(1, 10)
		   rec2 = Atk:GetPOW()
		end
		if rec1 <= 1 then
			rec1 = 1;
		end
		if rec2 > targetlist[i]:GetMHP() then
			rec2 = targetlist[i]:GetMHP();
		end
		
		if rec2 <= 1 then
			rec2 = 1;
		end
		if rec1 > targetlist[i]:GetMaxHP() then
			rec1 = targetlist[i]:GetMaxHP();
		end
		rec1 = targetlist[i]:GetHP() / 2;
		targetlist[i]:ChangeHp(rec1);
		targetlist[i]:ChangeMHp(rec2);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

