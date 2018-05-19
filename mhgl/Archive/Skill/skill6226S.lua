--MOB紫衣候-淡月弄梅

function skill6226CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill6226Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local randomDam = 1.2 - (math.random(100, 300) / 1000);
	local critDam = 10.0;
	local FinalDef = Target:GetDEF();
	if 0.8 * Atk:GetATK() > Target:GetDEF() then
		if math.random(1, 100) <= 5 then
			FinalDef = Target:GetDEF() / 2;
		end
	end
	
	local FinalDam = 0;
	local CritHit = 0;
	local CritRateBase = 0;
	
	
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
						wDam = 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(382);
					end
				end
			end
		end
	else
		wDam =0.98 ^ Target:GetSkillLv(376);
	end
	
	local CritRate = 5 + CritRateBase;
	
	if math.random(1,100) <= CritRate then
		FinalDam = ((1.1 * Atk:GetATK() - FinalDef + 250) * wDam - 250) * randomDam * critDam;
		CritHit = 1;
	else
		FinalDam = ((1.1 * Atk:GetATK() - FinalDef + 250) * wDam - 250) * randomDam;	
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
	if result == 2 then
		Target:MissSkill();
	else
		Target:ChangeHp(-1 * FinalDam);
	end
	
	if CritHit == 1 then
		Target:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
	end
	battle:PushReactionActor(Target);
	if not Atk:IsBuffExist(3075) then		
		Atk:AddBuff(3075, (Lv + 10), 0, 0, 3, 100);
	end
end

