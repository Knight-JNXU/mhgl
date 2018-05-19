--MOB天佛伏魔

function skill6205CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill6205Use(Atk, Target, battle, skillLv)
	
	local lv = Atk:GetLevel();
	local nDamskill1 = 0;
	--[[local consumeSp = 40;
	if Atk:IsBuffExist(1707) then
		consumeSp = 0;
	end
	local Msg = string.format("內力不足%d，无法施展天佛伏魔",consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);]]
	
	local FinalDam = {0};
	local DamRate = {1};
	local RateDam = {1};
	local CritHit = {0};
	local KillFlag = 0;
	local lianji = 1;
	
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
		Rate = 40;
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
		
		local nDam = 1;		--是CBatActor类型 
		local nDam1 = 1;
		local ZPartnerOwner;			--是CBatActor类型
		local PartnerOwner;			--是CBatActor类型
		if Atk:IsParnter() then
			local ZpBatMob = Atk:ToBatMob();
			if ZpBatMob ~= nil then
				for jj=0, battle:GetActorCount() - 1 do
					local ZpActor = battle:GetActor(jj);
					if ZpActor:IsPlayer() then
						local ZpBatChar = ZpActor:ToBatChar();
						if ZpBatChar ~= nil and ZpBatChar:GetChar_id() == ZpBatMob:GetOwner_id() then
							ZPartnerOwner = ZpActor;
							nDam1 = 1.02 ^ ZPartnerOwner:GetOwner():GetSkillLv(384);
						end
					end
				end
			end
		else
			nDam1 = 1.02 ^ Atk:GetSkillLv(378);
		end
		if Target:IsParnter() then
			local pBatMob = Target:ToBatMob();
			if pBatMob ~= nil then
				for ii=0, battle:GetActorCount() - 1 do
					local pActor = battle:GetActor(ii);
					if pActor:IsPlayer() then
						local pBatChar = pActor:ToBatChar();
						if pBatChar ~= nil and pBatChar:GetChar_id() == pBatMob:GetOwner_id() then
							PartnerOwner = pActor;
							nDam = nDam1 * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(385);
						end
					end
				end
			end
		else
			nDam = nDam1 * 0.98 ^ Target:GetSkillLv(379);
		end
		if Atk:IsBuffExist(2027) then
			RateDam[i] =  math.random(80, 120) / 100;
		end
		if Atk:IsBuffExist(2060) then
			RateDam[i] =  math.random(80, 130) / 100;
		end
		
		FinalDam[i] = (((Atk:GetPOW() - Target:GetPOW()) * 1.1 + 3.4 * lv + nDamsBonus1 * lv + 250) * nDam - 250) * DamRate[i] * RateDam[i];
		
		local CritRate = 0;
		if Atk:IsBuffExist(2026) then
			CritRate = 25;
		end
		if Atk:IsBuffExist(2059) then
			CritRate = 35;
		end
		if Target:IsMob() or Target:IsBoss() then
		   FinalDam[i] = FinalDam[i] * 1.3
		end
		if math.random(1, 100) <= CritRate then
			FinalDam[i] = FinalDam[i] * 2;
			CritHit[i] = 1;
		end
			
		if FinalDam[i] <= 10 then
			FinalDam[i] = math.random(1, 10);
		end	
		
		if CritHit[i] == 1 then
			Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_CRIT_HIT);
		else
			Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_SKILL_HIT);
		end
		
		i = i + 1;
	end
	
	local HitRate = math.random(1, 100);
	if HitRate < 26 then
		if Target:IsBuffExist(1003) ~= true and Target:GetHP() ~= 0 then 
			Target:AddBuff(1003, lv, 0, 0, 4, 100);
		end
	elseif HitRate < 51 then
		if Target:IsBuffExist(1401) ~= true and Target:GetHP() ~= 0 then 
			Target:AddBuff(1401, lv, 0, 0, 4, 100);
		end
	elseif HitRate < 76 then
		if Target:IsBuffExist(1005) ~= true and Target:GetHP() ~= 0 then 
			Target:AddBuff(1005, lv, 0, 0, 4, 100);
		end
	else
		if Target:IsBuffExist(1106) ~= true and Target:GetHP() ~= 0 then 
			Target:AddBuff(1106, lv, 0, 0, 1, 100);
		end
	end
	battle:PushReactionActor(Target);
end
