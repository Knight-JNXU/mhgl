--偷天换日

function skill4402CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4402Use(Atk, Target, battle, skillLv)
	
	local sLv = Atk:GetLevel();
	local consumeSp = 0.8 * sLv;
	local Msg = string.format("\#W[战斗讯息]：内力不足\#G%d\#W，无法施展神·偷天换日", consumeSp);
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local wDam = 1;		--是CBatActor类型 
	local wDam1 = 1;
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
						wDam1 = 1.02 ^ ZPartnerOwner:GetOwner():GetSkillLv(383);
					end
				end
			end
		end
	else
		wDam1 = 1.02 ^ Atk:GetSkillLv(378);
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
						wDam = wDam1 * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(385);
					end
				end
			end
		end
	else
		wDam = wDam1 * 0.98 ^ Target:GetSkillLv(378);
	end
	local randomDam = 1.2 - (math.random(100, 300) / 800);
	local critDam = 2.0;
	local FinalDef = Target:GetDEF();
	if 1.2 * Atk:GetATK() > Target:GetDEF() then
		if math.random(1, 100) <= 10 then
			FinalDef = Target:GetDEF() / 2;
		end
	end
	
	local FinalDam = 0;
	local CritHit = 0;
	local CritRate =  5;
	if Atk:IsBuffExist(2043) then
		CritRate = 25;
	elseif Atk:IsBuffExist(2010) then
		CritRate = 15;
	end
	if math.random(1,100) <= CritRate then
		FinalDam = ((1.22 * Atk:GetATK() - FinalDef + 250) * wDam - 200) * randomDam * critDam;
		CritHit = 1;
	else
		FinalDam = ((1.22 * Atk:GetATK() - FinalDef + 250) * wDam - 200) * randomDam;
	end
	
	if Target:GetCommand() == LuaI.BATCMD_DEFEND then
		FinalDam = FinalDam / 2;
		Target:SetTempReaction(LuaI.BATCMD_DEFEND_HIT);
		if CritHit == 1 then
			Target:SetTempReaction(LuaI.BATCMD_DEFEND_CRIT_HIT);
		end
	end	
	if FinalDam <= 10 then
		FinalDam = math.random(1, 10);
	end
	
	local result = skillCanHit(Atk,Target);
	if math.random(1,100) <= 25 then
		Target:ChangeHp( FinalDam / 2);
	else
		Target:ChangeHp(-2.8 * FinalDam);
	end
	
	if CritHit == 1 then
		Target:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
	end
	battle:PushReactionActor(Target);
	
end

