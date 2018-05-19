--MOB夺命十三剑

function skill6208CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill6208Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local Lv = Atk:GetLevel();
	local maxTargetCount = 10;
	local skill = Atk:GetSkillLv(5300);
	local nDamskill1 = 0;
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
	if Atk:GetMob_id() == 32021 or Atk:GetMob_id() == 32022 then
		maxTargetCount = 5
	end
	--[[if maxTargetCount > 7 then
		maxTargetCount = 7;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end

	if skill == 1 then
		maxTargetCount = math.floor((Lv - 25)/ 20) + 3;
	    if maxTargetCount > 8 then
		    maxTargetCount = 8;
	    elseif maxTargetCount < 3 then
		    maxTargetCount = 3;
	    end
	end
	
	if Atk:GetMob_id() == 10420 then
		maxTargetCount = 3;
	end]]
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end	
	
	local i = 0;
	while targetlist[i] ~= nil do
		--local nDam = 1.02 ^ (math.floor((Lv+100)/173) * math.floor((Lv-73)/3));
		local nDam = 1;
		local PartnerOwner;			--是CBatActor类型 
		if targetlist[i]:IsParnter() then
			local pBatMob = targetlist[i]:ToBatMob();
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
			nDam =0.98 ^ targetlist[i]:GetSkillLv(379);
		end
		
		local DamBonus2 = {1.1, 1.2, 1.3, 1.4, 0.8, 0.6, 0.4, 0.2, 0.8, 0.6, 0.4, 0.2, 0.1};
		local nDamsBonus2 = 1;
		local buffid = {3050, 3051, 3052, 3053, 3060, 3061, 3062, 3063, 3070, 3071, 3072, 3073, 3074};
		local k = 1;
		while k <= 13 do
		    if targetlist[i]:IsBuffExist(buffid[k]) then
	            nDamsBonus2 = DamBonus2[k];
			end
			k = k + 1;
		end
		
		if targetlist[i]:IsBuffExist(2071) and  targetlist[i]:IsBuffExist(2074) ~= true then
			nDamsBonus2 = nDamsBonus2 * 0.7;
		end
		if targetlist[i]:IsBuffExist(2074) then
			nDamsBonus2 = nDamsBonus2 * 0.4;
		end
		if targetlist[i]:IsBuffExist(1803) then
			nDamsBonus2 = nDamsBonus2 * 0.85;
		end
		if targetlist[i]:IsBuffExist(2057) then
			nDamsBonus2 = nDamsBonus2 * 0.8;
		end
		if targetlist[i]:IsBuffExist(1302) then
			nDamsBonus2 = nDamsBonus2 * 0.5;
		end
		if targetlist[i]:GetReaction() == LuaI.BATCMD_MISS then
			nDamsBonus1 = 0;
			nDamsBonus2 = 0;
		end
				
		local hpChange = (1 * (Atk:GetPOW() - targetlist[i]:GetPOW()) + 20 * Lv + 250)  * nDam - 250;
		
		if skill == 1 then
			hpChange = (2 * (Atk:GetPOW() - targetlist[i]:GetPOW()) + 40 * Lv + 250)  * nDam - 250;
	    end
		
		if hpChange <= 10 then
			hpChange = math.random(1, 10);
		end
		
		local result = skillCanHit(Atk, targetlist[i]);
		local turn = 2;
		if result == 2 then
			targetlist[i]:MissSkill();
		else
			targetlist[i]:ChangeHp(-1 * hpChange);			
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

