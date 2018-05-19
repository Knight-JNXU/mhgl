--天佛伏魔

function skill4551CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill4551Use(Atk, Target, battle, skillLv)
	
	local lv = Atk:GetLevel();
	local consumeSp = 40;
	if Atk:IsBuffExist(1707) then
		consumeSp = 0;
	end
	local Msg = string.format("內力不足%d，无法施展天佛伏魔",consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local FinalDam = {0};
	local DamRate = {1};
	local RateDam = {1};
	local CritHit = {0};
	local KillFlag = 0;
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
		
		FinalDam[i] = (((Atk:GetPOW() - Target:GetPOW()) * 1.25 + 3.8 * lv + 250) * nDam - 250) * DamRate[i] * RateDam[i];
		
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
	
	local HitRate = math.random(1, 100);
	if HitRate < 26 then
		if Target:IsBuffExist(1003) ~= true and Target:GetHP() ~= 0 then 
			Target:AddBuff(1003, lv, 0, 0, 4, 100);
		end
	elseif HitRate < 56 then
		if Target:IsBuffExist(1401) ~= true and Target:GetHP() ~= 0 then 
			Target:AddBuff(1401, lv, 0, 0, 4, 100);
		end
	elseif HitRate < 81 then
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
