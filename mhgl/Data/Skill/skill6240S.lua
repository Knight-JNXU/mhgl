--MOB倚天一击

function skill6240CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill6240Use(Atk, Target, battle, skillLv)
	
	local Lv = Atk:GetLevel();
	--[[local consumeDp = 50;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展倚天一击", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);]]
	
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
	local randomDam = 1.2 - (math.random(100, 300) / 1000);	
	local critDam = 2.0;
	local FinalDef = Target:GetDEF();
	
	if 0.8 * Atk:GetATK() > Target:GetDEF() then
		if math.random(1, 100) <= 5 then
			FinalDef = Target:GetDEF() / 2;
		end
	end
	
	local FinalDam = 0;
	local CritHit = 0;
	
	if math.random(1,100) <= 5 then
		FinalDam = ((Atk:GetATK() - 0.6 * FinalDef + 250 + Atk:GetLevel() * Atk:GetWC() / 65) * wDam - 250) * randomDam * critDam;
		CritHit = 1;
	else
		FinalDam = ((Atk:GetATK() - 0.6 * FinalDef + 250 + Atk:GetLevel() * Atk:GetWC() / 65) * wDam - 250) * randomDam;
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

