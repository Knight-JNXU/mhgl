--MOB

function skill5120CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5120Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local nDamskill1 = 0;
	local CritHit = 0;
	local targetlist = {};
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
	local consumeSp = 0.5 * Lv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展含沙射影", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	local maxTargetCount = math.floor( math.random(150, 350) / 100);
	
	if skill == 1 then
		maxTargetCount = math.floor( math.random(150, 450) / 100);
	end
	
	if Atk:GetMob_id() == 32301 then
		maxTargetCount = 4;
	end
	
	if Lv > 60 then
		maxTargetCount = maxTargetCount + 1;
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	local countDam = 1;
	while targetlist[count] ~= nil do
		count = count + 1;
	end	
	if count == 1 then
		countDam = 1.66  ;
	elseif count == 2 then
		countDam = 1.55  ;
	elseif count == 3 then
		countDam = 1.44 ;
	else
		countDam = 1.33 ;
	end
	
	local i = 0;
	while targetlist[i] ~= nil do 
		
		local nDam = 1.02 ^ (math.floor((Lv+100)/173) * math.floor((Lv-73)/3)) * 0.98 ^ targetlist[i]:GetSkillLv(379);
		local HitRate = 0;
		local HitRateBase = 30;
		
		if skill == 1 then 
			HitRateBase = 50;
		end

		if (Lv + 10) > targetlist[i]:GetLevel() then
			HitRate = (HitRateBase + 2 * (Lv + 10 - targetlist[i]:GetLevel()) ^ 0.5) * nDam;
		else
			HitRate = (HitRateBase + 2.2 * (Lv + 10 - targetlist[i]:GetLevel())) * nDam;
		end
		if HitRate < 1 then
			HitRate = 1;
		elseif HitRate > 100 then
			HitRate = 100;
		end	
	
		local hpChange = 0;
		if math.random(1, 100) <= HitRate then
			hpChange = countDam * (Lv + 2.7 * (Lv + 10) + nDamsBonus1 * Lv);
			CritHit = 1;
		else
			hpChange = Lv + 2.7 * (Lv + 10) + nDamsBonus1 * Lv;
		end
		
		local result = skillCanHit(Atk, targetlist[i]);
		if result == 2 then
			targetlist[i]:MissSkill();
		else
			targetlist[i]:ChangeHp(-1 * hpChange);
		end
		
		if CritHit == 1 then
			targetlist[i]:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
		end
		
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

