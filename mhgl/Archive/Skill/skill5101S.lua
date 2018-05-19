--MOB亡灵索命

function skill5101CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5101Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local HitRate = 0;
	local HitRateBase = 60;
	
	if skill == 1 then
	    HitRateBase = 85;
	end
	
	if Target:IsMob() then
		if Target:GetMob_id() == 10491 then
			HitRateBase = 100;
		end
	end
	
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
	
	local wDam = 1;
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
						wDam = 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(383);
					end
				end
			end
		end
	else
		wDam =0.98 ^ Target:GetSkillLv(377);
	end
	
	if (Lv + 10) > Target:GetLevel() then
		HitRate = (HitRateBase + 2 * (Lv + 10 - Target:GetLevel()) ^ 0.5) * nDam;
	else
		HitRate = (HitRateBase + 2.2 * (Lv + 10 - Target:GetLevel())) * nDam;
	end
	if HitRate < 1 then
		HitRate = 1;
	elseif HitRate > 100 then
		HitRate = 100;
	end	
	
	
	local randomDam = 1.2 - (math.random(100, 300) / 1000);
	local critDam = 2.0;
	local FinalDef = Target:GetDEF();
	
	if 0.8 * Atk:GetATK() > Target:GetDEF() then
		if math.random(1, 100) <= 5 then
			FinalDef = Target:GetDEF() / 2;
		end
	end
	
	local FinalDam = 0;
	local rec = 0;
	local recBase = 15;
	local CritHit = 0;
	
	if math.random(1,100) <= 5 then
		FinalDam = ((1.1 * Atk:GetATK() - FinalDef + 250) * wDam - 250) * randomDam * critDam;
		rec = FinalDam * (recBase + math.floor((Lv + 10) / 5)) / 100;
		CritHit = 1;
	else
		FinalDam = ((1.1 * Atk:GetATK() - FinalDef + 250) * wDam - 250) * randomDam;	
		rec = FinalDam * (recBase + math.floor((Lv + 10) / 5)) / 100;
	end
	

	
	if Target:GetCommand() == LuaI.BATCMD_DEFEND then
		FinalDam = FinalDam / 2;
		rec = rec / 2;
		Target:SetTempReaction(LuaI.BATCMD_DEFEND_HIT);
	end	
	
	if FinalDam <= 10 then
		FinalDam = math.random(1, 10);
	end
	if rec <= 0 then
		rec = 1;
	elseif rec >= Target:GetHP() then
		rec = Target:GetHP();
	end
	
	Target:ChangeHp(-1 * FinalDam);
	if CritHit == 1 then
		Target:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
	end
	
	if math.random(1, 100) <= HitRate then
		Atk:ChangeHp(rec);
	end
	
	local LvDif = Lv + 10 - Target:GetLevel();
	local turn = 2 + math.floor(LvDif / 10);
	if turn < 1 then
		turn = 1;
	elseif turn > 5 then
		trun = 5;
	end
	
	local HitRate1 = HitRate + math.floor((Lv + 10) / 5);
	if HitRate1 < 1 then
		HitRate1 = 1;
	elseif HitRate1 > 100 then
		HitRate1 = 100;
	end
	
	if Target:GetHP() ~= 0 and (Target:IsBuffExist(1000) == false) and  math.random(1, 100) <= HitRate1 then
		Target:AddBuff(1000, (Lv + 10), FinalDam * 0.3, 0, turn, 100); 
	end
	
	battle:PushReactionActor(Target);
	
end

