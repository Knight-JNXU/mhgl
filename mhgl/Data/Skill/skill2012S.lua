--天魔解体

function skill2012CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需赤炼鬼爪修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill2012Use(Atk, Target, battle, skillLv)
	
	local consumeHp = 0.6 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeHp = consumeHp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：生命不足\#G%d\#W，无法施展天魔解体", consumeHp);
	
	if Atk:GetHP() < consumeHp then
		Atk:SkillFail(Msg);
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
						wDam = 1.02 ^ Atk:GetSkillLv(376) * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(383);
					end
				end
			end
		end
	else
		wDam = 1.02 ^ Atk:GetSkillLv(376) * 0.98 ^ Target:GetSkillLv(377);
	end
	
	local HitRate = 0;
	if skillLv > Target:GetLevel() then
		HitRate = (60 + 2 * (skillLv - Target:GetLevel()) ^ 0.5) * wDam;
	else
		HitRate = (60 + 2.2 * (skillLv - Target:GetLevel())) * wDam;
	end
	if HitRate < 1 then
		HitRate = 1;
	elseif HitRate > 95 then
		HitRate = 95;
	end	
	
	local randomDam = 1.2 - (math.random(100, 300) / 1000);
	local weaponDam = 0.25 * (Atk:GetHIT() - Atk:GetAGI() * 1.7 - 6);
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
		FinalDam = (0.12 * (Atk:GetATK() + weaponDam) + 0.2 * Target:GetSP()) * wDam * randomDam * critDam;
		CritHit = 1;
	else
		FinalDam = (0.12 * (Atk:GetATK() + weaponDam) + 0.2 * Target:GetSP()) * wDam * randomDam;
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
	
	if FinalDam <= 10 then
		FinalDam = math.random(1, 10);
	end
	
	local reDam = Target:GetFinalValue(-FinalDam, Atk, Atk:GetAction(), 1);
	rec = -1 * reDam * (25 + math.floor(Atk:GetSkillLv(2050) / 5)) / 100;
	
	if rec <= 0 then
		rec = 1;
	elseif rec >= Target:GetSP() then
		rec = Target:GetSP();
	end
	
	Target:ChangeSp(-1 * FinalDam);
	
	if math.random(1, 100) <= HitRate then
		Atk:ChangeSp(rec);
	end
	local LvDif = skillLv - Target:GetLevel();
	local turn = 2 + math.floor(LvDif / 10);
	if turn < 1 then
		turn = 1;
	elseif turn > 5 then
		trun = 5;
	end
	
	local HitRate1 = HitRate + math.floor(Atk:GetSkillLv(2050) / 15);
	if HitRate1 < 1 then
		HitRate1 = 1;
	elseif HitRate1 > 95 then
		HitRate1 = 95;
	end
	
	if Target:GetHP() ~= 0 and (Target:IsBuffExist(1000) == false) and  math.random(1, 100) <= HitRate1 then
		Target:AddBuff(1004, skillLv, reDam * -0.3, 0, turn, 100); 
	end
	
	battle:PushReactionActor(Target);
	
end

