--一击必杀

function skill1652CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需破念心经修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);	
	end	
end

function skill1652Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 1.2 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：内力不足\#G%d\#W，无法施展一击必杀", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
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
						wDam = 1.02 ^ Atk:GetSkillLv(376) * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(382);
					end
				end
			end
		end
	else
		wDam = 1.02 ^ Atk:GetSkillLv(376) * 0.98 ^ Target:GetSkillLv(377);
	end
	local randomDam = 1.2 - (math.random(100, 300) / 1000);
	local weaponDam = 0.25 * (Atk:GetHIT() - Atk:GetAGI() * 1.7 - 6);
	local critDam = 2.0;
	local FinalDef = Target:GetDEF();
	if 1.2 * Atk:GetATK() < Target:GetDEF() then
		if math.random(1, 100) <= 60 then
			FinalDef = Target:GetDEF() / 3;
		end
	end
	
	local FinalDam = 0;
	local CritHit = 0;
	local CritRate =  5;
	if Atk:IsBuffExist(1633) then
		CritRate = 30;
	end
	if math.random(1,100) <= CritRate then
		FinalDam = ((1.2 * Atk:GetATK() - 0.9 * FinalDef + weaponDam + 250) * wDam - 250) * randomDam * critDam;
		CritHit = 1;
	else
		FinalDam = ((1.2 * Atk:GetATK() - 0.9 * FinalDef + weaponDam + 250) * wDam - 250) * randomDam;
	end
	
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
	--[[
	if Target:IsBuffExist(1204) then
		FinalDam = FinalDam * 5 / 3;
	end
	if Target:IsBuffExist(1629) then
		FinalDam = FinalDam * 5;
	end
	if Target:IsBuffExist(1806) then
		FinalDam = FinalDam / 0.85;
	end
	if Target:IsBuffExist(3050) or Target:IsBuffExist(3070) then
		FinalDam = FinalDam / 0.8;
	end
	if Target:IsBuffExist(3051) or Target:IsBuffExist(3071) then
		FinalDam = FinalDam / 0.6;
	end
	if Target:IsBuffExist(3052) or Target:IsBuffExist(3072) then
		FinalDam = FinalDam / 0.4;
	end
	if Target:IsBuffExist(3053) or Target:IsBuffExist(3073) then
		FinalDam = FinalDam / 0.2;
	end
	if Target:IsBuffExist(3074) then
		FinalDam = FinalDam / 0.1;
	end	]]
	if FinalDam <= 10 then
		FinalDam = math.random(1, 10);
	end
	
	local result = skillCanHit(Atk,Target);
	if result == 2 then
		Target:MissSkill();
	else
		Target:ChangeHp(-1 * FinalDam);
	end
	
	battle:PushReactionActor(Target);
	
end

