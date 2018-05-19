--长河出蛟

function skill0275CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill0275Use(Atk, Target, battle, skillLv)
	
	local lv = Atk:GetLevel();
	local consumeSp = 30;
	
	local Msg = string.format("內力不足%d，无法施展此招式",consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local FinalDam = {0};
	local DamRate = {1};
	local RateDam = {1};
	local CritHit = {0};
	local lianji = 1;
	
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
		
		FinalDam[i] = (((Atk:GetPOW() - Target:GetPOW()) * 1.1 + 3.4 * lv + 250) * nDam - 250) * DamRate[i] * RateDam[i];
		
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
	
	local effectSPD = (1 - 0.05) * Target:GetSPD();
	local HitRate = math.random(1, 100);
	
	if effectSPD <= 1 then
		effectSPD = 1;
	end
	
	if HitRate < 15 and Target:IsBuffExist(1405) ~= true and Target:GetHP() ~= 0 then
		Target:AddBuff(1405, lv, effectSPD, 0, 3, 100);
	end
	battle:PushReactionActor(Target);
end
