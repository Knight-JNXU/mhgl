--野兽冲撞

function skill5273Use(Atk, Target, battle, skillLv)
	
	local Glv = Atk:GetLevel() + 10;	
	local HitRate = 0;
	
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
	
	if Glv > Target:GetLevel() then
		HitRate = (60 + 2 * (Glv - Target:GetLevel()) ^ 0.5) * nDam;
	else
		HitRate = (60 + 2.2 * (Glv - Target:GetLevel())) * nDam;
	end
	if HitRate < 1 then
		HitRate = 1;
	elseif HitRate > 95 then
		HitRate = 95;
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
	local CritHit = 0;
	
	if math.random(1,100) <= 5 then
		FinalDam = ((1.2 * Atk:GetATK() - FinalDef + 250) * wDam - 250) * randomDam * critDam;
		rec = FinalDam * 0.25;
		CritHit = 1;
	else
		FinalDam = ((1.2 * Atk:GetATK() - FinalDef + 250) * wDam - 250) * randomDam;	
		rec = FinalDam * 0.25;
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
	
	local LvDif = Glv - Target:GetLevel();
	local turn = 2 + math.floor(LvDif / 10);
	if turn < 1 then
		turn = 1;
	elseif turn > 5 then
		trun = 5;
	end
	
	if Target:GetHP() ~= 0 and (Target:IsBuffExist(3096) == false) and  math.random(1, 100) <= HitRate then
		Target:AddBuff(3096, skillLv, FinalDam * 0.3, 0, turn, 100); 
	end

	battle:PushReactionActor(Target);
end

