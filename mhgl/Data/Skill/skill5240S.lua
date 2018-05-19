--MOB后羿射日

function skill5240CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5240Use(Atk, Target, battle, skillLv)
	
	local lv = Atk:GetLevel();
	local nDamskill1 = 0;
	--local nDam = Atk:GetSkillLv(378) - Target:GetSkillLv(379);
	local FinalDam = {0};
	local DamRate = {1};
	local RateDam = {1};
	local CritHit = {0};
	--local KillFlag = 0;
	local lianji = 1;
	--local TargetHP = Target:GetHP();
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
	
	local Rate = 0;
	if Atk:IsBuffExist(2025) then
		Rate = 15;
	end
	if Atk:IsBuffExist(2058) then
		Rate = 25;
	end
	if math.random(1, 100) <= Rate then
		lianji = 2;
		FinalDam = {0,0};
		DamRate = {0.75, 0.75};
		RateDam = {1, 1};
		CritHit = {0, 0};
	end
	
	local i = 1;
	while i <= lianji do
		local nDam = 1;
		local PartnerOwner;			--是CBatActor类型 
		if Target:IsParnter() then
			local pBatMob = Target:ToBatMob();
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
			nDam =0.98 ^ Target:GetSkillLv(379);
		end
		
		if Atk:IsBuffExist(2027) then
			RateDam[i] =  math.random(80, 120) / 100;
		end
		if Atk:IsBuffExist(2060) then
			RateDam[i] =  math.random(80, 130) / 100;
		end
		
		FinalDam[i] = ((Atk:GetPOW() - Target:GetPOW() + 4 * lv + nDamsBonus1 * lv + 250) * nDam - 250) * DamRate[i] * RateDam[i];
		
		local CritRate = 0;
		if Atk:IsBuffExist(2026) then
			CritRate = 10;
		end
		if Atk:IsBuffExist(2059) then
			CritRate = 20;
		end
		
		if math.random(1, 100) <= CritRate then
			FinalDam[i] = FinalDam[i] * 2;
			CritHit[i] = 1;
		end
		
		--if KillFlag == 0 then
			
			if --[[nDamsBonus2 *]] FinalDam[i] <= 10 then
				FinalDam[i] = math.random(1, 10);
			end	
			
			--[[if nDamsBonus2 * FinalDam[i] >= TargetHP then
				--FinalDam[i] = TargetHP + math.random(1, 10);
				KillFlag = 1;
			end]]
			
			if CritHit[i] == 1 then
				Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_CRIT_HIT);
			else
				Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_SKILL_HIT);
			end
			
			--TargetHP = TargetHP - nDamsBonus2 * FinalDam[i];
			
		--[[end
		
		if KillFlag == 1 then
			break;
		end]]
		
		i = i + 1;
	end
	
	local effectATK = (1 - 0.05) * Target:GetATK();
	local HitRate = math.random(1, 100);
	if effectATK <= 1 then
		effectATK = 1;
	end
	
	if HitRate < 25 and Target:IsBuffExist(1403) ~= true and Target:GetHP() ~= 0 then 
		Target:AddBuff(1403, lv, effectATK, 0, 3, 100);
	end
	battle:PushReactionActor(Target);
end
