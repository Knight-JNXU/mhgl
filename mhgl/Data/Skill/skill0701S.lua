--小李飞刀

function skill0701CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill0701Use(Atk, Target, battle, skillLv)
	
	local lv = Atk:GetLevel();
	local targetlist = {};
	local skill = Atk:GetSkillLv(5300);
	local nDamskill1 = 0;
	--local TargetHP = {};
	--local KillFlag = {};
	local DamBonus1 = {0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9,9.5,10,11,12,13,14,15,16,17,18,19,20};
	local nDamsBonus1 = 0;
	local i = 1;
	while i <= 30 do
	    nDamskill1 = Atk:GetSkillLv(5430 + i - 1);
		if nDamskill1 == 1 then 
            nDamsBonus1 = nDamsBonus1 + DamBonus1[i];
		end
		i = i + 1;
	end	
	--[[local DamBonus = {1.1, 1.2, 1.3, 1.4, 0.8, 0.6, 0.4, 0.2, 0.8, 0.6, 0.4, 0.2, 0.1};
	local nDamsBonus = {};
	local buffid = {3050, 3051, 3052, 3053, 3060, 3061, 3062, 3063, 3070, 3071, 3072, 3073, 3074};]]
	
	
	local maxTargetCount = math.floor(lv / 30) + 1;
	if maxTargetCount > 3 then
		maxTargetCount = 3;
	elseif maxTargetCount < 1 then
		maxTargetCount = 1;
	end
	
	if skill == 1 then
	    maxTargetCount = math.floor(lv / 30) + 2;
	    if maxTargetCount > 5 then
		    maxTargetCount = 5;
	    elseif maxTargetCount < 2 then
		    maxTargetCount = 2;
	    end
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		--[[TargetHP[count] = targetlist[count]:GetHP();
		nDamsBonus[count] = 1;
		local k = 1;
		while k <= 13 do
			if targetlist[count]:IsBuffExist(buffid[k]) then
				nDamsBonus[count] = DamBonus[k];
			end
			k = k + 1;
		end
		KillFlag[count] = 0;]]
		count = count + 1;
	end
	
	local consumeSp = 30 * count;
	
	local Msg = string.format("\#W[战斗讯息]：内力不足\#G%d\#W，无法施展小李飞刀", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local RateDam = 1;
	local CritHit = 0;
	local CritRate = Atk:GetHIT()/100;
	
	
	local i = 0;
	local j = 0;
	
		
	while targetlist[j] ~= nil do
		local nDam = 1;			
		--local FinalDam = (4 - 0.2 * count) * lv;
		local FinalDam = CritRate / 2 * lv / 2;
		
		if math.random(1, 100) <= CritRate then
			FinalDam = FinalDam * 2;
			CritHit = 1;
		end
		
		if --[[nDamsBonus[j] *]] FinalDam <= 1 then
			FinalDam = 1;
		end
		
		targetlist[j]:ChangeHp(-1 * FinalDam);
		
		if CritHit == 1 then
			targetlist[j]:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
		end
		
		battle:PushReactionActor(targetlist[j]);
		j = j + 1;
	end
	
end

