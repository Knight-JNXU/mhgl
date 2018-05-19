--MOB羿射九日

function skill5250CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5250Use(Atk, Target, battle, skillLv)
	
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
	
	local RateDam = 1;
	local CritHit = 0;
	local CritRate = 8;
	if Atk:IsBuffExist(2026) then
		CritRate = 25;
	end
	if Atk:IsBuffExist(2059) then
		CritRate = 35;
	end
	local lianji = 1;
	local Rate = 0;
	if Atk:IsBuffExist(2025) then
		Rate = 15;
	end
	if Atk:IsBuffExist(2058) then
		Rate = 40;
	end
	if math.random(1, 100) <= Rate then
		lianji = 2;
	end
	
	local i = 0;
	local j = 0;
	if lianji == 1 then
		
		while targetlist[j] ~= nil do
			local nDam = 1;
			local PartnerOwner;			--是CBatActor类型 
			if targetlist[j]:IsParnter() then
				local pBatMob = targetlist[j]:ToBatMob();
				if pBatMob ~= nil then
					for ii=0, battle:GetActorCount() - 1 do
						local pActor = battle:GetActor(ii);
						if pActor:IsPlayer() then
							local pBatChar = pActor:ToBatChar();
							if pBatChar ~= nil and pBatChar:GetChar_id() == pBatMob:GetOwner_id() then
								PartnerOwner = pActor;
								nDam = 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(385);
							end
						end
					end
				end
			else
				nDam =0.98 ^ targetlist[j]:GetSkillLv(379);
			end
			
			if Atk:IsBuffExist(2027) then
				RateDam =  math.random(80, 120) / 100;
			end
			if Atk:IsBuffExist(2060) then
				RateDam =  math.random(80, 130) / 100;
			end
			
			local FinalDam = ((Atk:GetPOW() - targetlist[j]:GetPOW() + (3.4 - 0.3 * count) * lv + nDamsBonus1 * lv + 250) * nDam - 250) * RateDam;
			
			if math.random(1, 100) <= CritRate then
				FinalDam = FinalDam * 2;
				CritHit = 1;
			end
			
			if --[[nDamsBonus[j] *]] FinalDam <= 10 then
				FinalDam = math.random(1, 10);
			end
			
			targetlist[j]:ChangeHp(-1 * FinalDam);
			
			if CritHit == 1 then
				targetlist[j]:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
			end
			
			local effectATK = (1 - 0.05) * targetlist[j]:GetATK();
			local HitRate = math.random(1, 100);
			if effectATK <= 1 then
				effectATK = 1;
			end
			
			if HitRate < 20 and targetlist[j]:IsBuffExist(1403) ~= true and targetlist[j]:GetHP() ~= 0 then 
				targetlist[j]:AddBuff(1403, lv, effectATK, 0, 3, 100);
			end
			
			battle:PushReactionActor(targetlist[j]);
			j = j + 1;
		end
	else		
		--local FinalDam = {0, 0};	
		while targetlist[j] ~= nil do
			
			i = 0;
			while i < lianji do
				local nDam = 1;
				local PartnerOwner;			--是CBatActor类型 
				if targetlist[j]:IsParnter() then
					local pBatMob = targetlist[j]:ToBatMob();
					if pBatMob ~= nil then
						for ii=0, battle:GetActorCount() - 1 do
							local pActor = battle:GetActor(ii);
							if pActor:IsPlayer() then
								local pBatChar = pActor:ToBatChar();
								if pBatChar ~= nil and pBatChar:GetChar_id() == pBatMob:GetOwner_id() then
									PartnerOwner = pActor;
									nDam = 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(385);
								end
							end
						end
					end
				else
					nDam =0.98 ^ targetlist[j]:GetSkillLv(379);
				end
				
				if Atk:IsBuffExist(2027) then
					RateDam =  math.random(80, 120) / 100;
				end
				if Atk:IsBuffExist(2060) then
					RateDam =  math.random(80, 130) / 100;
				end
				
				local FinalDam = ((Atk:GetPOW() - targetlist[j]:GetPOW() + (3.4 - 0.3 * count) * lv + nDamsBonus1 * lv + 250) * nDam - 250) * 0.75 * RateDam;
				
				CritHit = 0;
				if math.random(1, 100) <= CritRate then
					FinalDam = FinalDam * 2;
					CritHit = 1;
				end
				
				if --[[nDamsBonus[j] *]] FinalDam <= 1 then
					FinalDam = 1;
				end	
				
				if CritHit == 1 then
					targetlist[j]:AddAttriChangeToLst(-1 * FinalDam, 0, 0, 0, LuaI.BATCMD_CRIT_HIT);
				else
					targetlist[j]:AddAttriChangeToLst(-1 * FinalDam, 0, 0, 0, LuaI.BATCMD_SKILL_HIT);
				end
				
				--TargetHP[j] = TargetHP[j] - nDamsBonus[j] * FinalDam;
				
				local effectATK = (1 - 0.05) * targetlist[j]:GetATK();
				local HitRate = math.random(1, 100);
				if effectATK <= 1 then
					effectATK = 1;
				end
				
				if HitRate < 20 and targetlist[j]:IsBuffExist(1403) ~= true and targetlist[j]:GetHP() ~= 0 then 
					targetlist[j]:AddBuff(1403, lv, effectATK, 0, 3, 100);
				end
				
				--[[if KillFlag[j] == 1 then
					break;
				end]]
				
				i = i + 1;
				
			end
			battle:PushReactionActor(targetlist[j]);
			j = j + 1;	
		end
	end
end

