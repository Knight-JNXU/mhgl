--血碎长空

function skill4499CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4499Use(Atk, Target, battle, skillLv)
	
	local sLv = Atk:GetLevel();
	local consumeHp = 0 * Atk:GetHP();
	local Msg = string.format("\#W[战斗讯息]：生命不足\#G%d\#W，无法施展", consumeHp);
	local reqHp = Atk:GetMaxHP() * 0;
	if Atk:GetHP() < reqHp then
		Atk:SkillFail("\#W[战斗讯息]：生命不足\#G1\%\#W，无法施展");
		do return end
	end
	
	Atk:ChangeHp(-1 * consumeHp, false);
	
	local wDam = 1;		--是CBatActor类型 
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
						wDam = 1.02 ^ Atk:GetSkillLv(382) * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(383);
					end
				end
			end
		end
	else
		wDam = 1.02 ^ Atk:GetSkillLv(382) * 0.98 ^ Target:GetSkillLv(383);
	end
	local randomDam = 1.2 - (math.random(100, 300) / 1000);
	local weaponDam = 0.6 * (Atk:GetHIT() - Atk:GetAGI() * 1.9 - 6);
	local critDam = 2.0;
	local FinalDef = Target:GetDEF();
	
	if 1.1 * Atk:GetATK() > Target:GetDEF() then
		if math.random(1, 100) <= 10 then
			FinalDef = Target:GetDEF() / 2;
		end
	end
	
	local FinalDam = 0;
	local CritHit = 0;
	
	if math.random(1,100) <= 100 then
		FinalDam = ((Atk:GetATK() - 0.58 * FinalDef + weaponDam + 100 + Atk:GetLevel() * Atk:GetWC() / 65) * wDam - 250) * randomDam * critDam;
		CritHit = 1;
	else
		FinalDam = ((Atk:GetATK() - 0.58 * FinalDef + weaponDam + 100 + Atk:GetLevel() * Atk:GetWC() / 65) * wDam - 250) * randomDam;
	end

	if Target:GetCommand() == LuaI.BATCMD_DEFEND then
		FinalDam = FinalDam / 2;
		Target:SetTempReaction(LuaI.BATCMD_DEFEND_HIT);
	end	
	
	if FinalDam <= 10 then
		FinalDam = math.random(1, 10);
	end
	
	Target:ChangeHp(-1 * FinalDam);
	if CritHit == 1 then
		Target:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
	end
	battle:PushReactionActor(Target);
end
