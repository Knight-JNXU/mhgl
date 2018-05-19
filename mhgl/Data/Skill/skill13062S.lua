--后发制人(真正发动)

function skill13062Use(Atk, Target, battle, skillLv)

	local consumeHp = 0.05 * Atk:GetHP() * math.random(9, 11) / 10;

	if consumeHp <= 1 then
		consumeHp = 1;
	end

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
						wDam = 1.02 ^ Atk:GetSkillLv(376) * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(383);
					end
				end
			end
		end
	else
		wDam = 1.02 ^ Atk:GetSkillLv(376) * 0.98 ^ Target:GetSkillLv(377);
	end
	
	local randomDam = 1.2 - math.random(100, 300) / 1000;
	local weaponDam = 0.25 * (Atk:GetHIT() - Atk:GetAGI() * 1.7 - 6);
	local critDam = 2.0;
	local FinalDef = Target:GetDEF();
	--法宝提升忽视对方防御的结算
	if Atk:GetSkillLv(394) > 0 then
		FinalDef = FinalDef - (Atk:GetSkillLv(394) * 0.01 * FinalDef)
	end
	--法宝提升忽视对方防御的结算处理完毕
	if 0.8 * Atk:GetATK() > FinalDef then
		if math.random(1, 100) <= 5 then
			FinalDef = FinalDef / 2;
		end
	end

	local FinalDam = 0;
	local CritHit = 0;
	local CritRate =  5;
	if Atk:IsBuffExist(50027) then
	CritRate =  10;
	elseif Atk:IsBuffExist(50042) then
	CritRate =  15;
	end
	if math.random(1,100) <= CritRate then
		FinalDam = ((1.35 * Atk:GetATK() - 0.85 * FinalDef+500 ) * wDam -500) * randomDam * critDam;
		CritHit = 1;
	else
		FinalDam = ((1.35 * Atk:GetATK() - 0.85 * FinalDef+500 ) * wDam -500) * randomDam;
	end
    --法宝提升对怪物的结算
	if Atk:GetSkillLv(394) > 0 then
		fabao = Atk:GetSkillLv(394)*0.03 
	end
	if Target:IsMob() or Target:IsBoss()  then
		FinalDam = FinalDam + (FinalDam * fabao)
	end
	--法宝提升对怪物的结算处理完毕
	if Target:GetCommand() == LuaI.BATCMD_DEFEND then
		FinalDam = FinalDam / 2;
		Target:SetTempReaction(LuaI.BATCMD_DEFEND_HIT);
		if CritHit == 1 then
			Target:SetTempReaction(LuaI.BATCMD_DEFEND_CRIT_HIT);
		end
	else
		if CritHit == 1 then
			Target:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
		end
	end

	if FinalDam <= 1 then
	 	FinalDam = math.random(1, 10);
	end

	Target:ChangeHp(-1 * FinalDam);
	
	if Atk:GetHP() ~= 1 then
		Atk:ChangeHp(-1 * consumeHp, false);
	end
	
	Atk:RemoveBuff(1302);
	battle:PushReactionActor(Target);

end
