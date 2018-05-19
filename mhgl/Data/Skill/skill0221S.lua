--力劈华山

function skill0221CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill0221Use(Atk, Target, battle, skillLv)
	
	local sLv = Atk:GetLevel();
	local consumeSp = 1.0 * sLv;
	local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展釜底抽薪", consumeSp);
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
						wDam1 = 1.02 ^ ZPartnerOwner:GetOwner():GetSkillLv(382);--1.64
						
						
						
					end
				end
			end
		end
	else
		wDam1 = 1.02 ^ Atk:GetSkillLv(376);
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
						wDam = wDam1 * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(383); -- 0.98
					end
				end
			end
		end
	else
		wDam = wDam1 * 0.98 ^ Target:GetSkillLv(377);
	end
	local randomDam = 1.2 - (math.random(100, 300) / 1000);
	local critDam = 0.8;
	local FinalDef = Target:GetDEF();
	local FinalAtk = Target:GetATK();
	local sh = 0;
	local FinalDam = 0;
	local CritHit = 0;
	local CritRate =  5;
	if Atk:IsBuffExist(2043) then
		CritRate = 25;
	elseif Atk:IsBuffExist(2010) then
		CritRate = 15;
	end
	if Atk:GetATK() > FinalDef then
	  sh = math.random(1.2, 1.7);
	elseif Atk:GetATK() < FinalDef then
	  sh = math.random(0.3, 0.5);
	end
	if math.random(1,100) <= CritRate then
		FinalDam = (((2.0 * Atk:GetATK() - FinalDef) * sh) * wDam) * randomDam * critDam;
		CritHit = 1;
	else
		FinalDam = (((2.0 * Atk:GetATK() - FinalDef) * sh) * wDam) * randomDam;
	end
	if CritHit == 1 then
		Target:SetTempReaction(LuaI.BATCMD_DEFEND_CRIT_HIT);
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

