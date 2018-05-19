--MOB迎风一刀斩(真正发动)

function skill5062Use(Atk, Target, battle, skillLv)
    local Lv = Atk:GetLevel();
	local randomDam = 1.2 - math.random(100, 300) / 1000;
	local critDam = 2.0;
	local FinalDef = Target:GetDEF();
	if 0.8 * Atk:GetATK() > Target:GetDEF() then
		if math.random(1, 100) <= 5 then
			FinalDef = Target:GetDEF() / 2;
		end
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
	
	
	
	local FinalDam = 0;
	local CritHit = 0;
	if math.random(1,100) <= 5 then
		FinalDam = ((1.35 * Atk:GetATK() - FinalDef + 250) * wDam - 250) * randomDam * critDam;
		CritHit = 1;
	else
		FinalDam = ((1.35 * Atk:GetATK() - FinalDef + 250) * wDam - 250) * randomDam;
	end

	if Target:GetCommand() == LuaI.BATCMD_DEFEND then
		FinalDam = FinalDam / 2;
		Target:SetTempReaction(LuaI.BATCMD_DEFEND_HIT);
		if CritHit == 1 then
			Target:SetTempReaction(LuaI.BATCMD_DEFEND_CRIT_HIT);
		end
	end

	if FinalDam <= 1 then
	 	FinalDam = math.random(1, 10);
	end

	Target:ChangeHp(-1 * FinalDam);
	
	if CritHit == 1 then
		Target:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
	end

	Atk:RemoveBuff(1302);
	battle:PushReactionActor(Target);

end
