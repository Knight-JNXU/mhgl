--连环击

function skill1851CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需狂兽诀修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:IsBuffExist(1502) == false then
		Atk:SkillFail("\#W[战斗讯息]：此招式需在变身状态下才能施展");	
	end	
end

function skill1851Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 30;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail("\#W[战斗讯息]：魔法不足\#G50\%\#W，无法施展连环击");
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
	
	local weaponDam = 0.25 * (Atk:GetHIT() - Atk:GetAGI() * 1.7 - 6);
	local critDam = 2.0;
	local FinalDef = Target:GetDEF();
	if 0.8 * Atk:GetATK() > Target:GetDEF() then
		if math.random(1, 100) <= 5 then
			FinalDef = Target:GetDEF() / 2;
		end
	end
	
	local FinalDam = {0, 0, 0, 0, 0, 0};
	local CritHit = {0, 0, 0, 0, 0, 0};
	local DamRate = {0.85, 0.8, 0.75, 0.7, 0.65, 0.6};
	local AtkNum = 6
	local CritRate = 5
	if Atk:GetSkillLv(394) >= 11 then
	    FinalDam = {0, 0, 0, 0, 0, 0, 0};
	    CritHit = {0, 0, 0, 0, 0, 0, 0};
	    DamRate = {1.01, 0.85, 0.8, 0.75, 0.7, 0.6, 1.01};
		AtkNum = 7
		CritRate = math.random(12,25)
	end
	
	local i = 1;
	while i <= AtkNum do
		local randomDam = 1.2 - math.random(100, 300) / 1000;
		local result = skillCanHit(Atk,Target);
		FinalDam[i] = (DamRate[i] * (Atk:GetATK() - FinalDef  + 250) * wDam - 250) * randomDam;
		if Atk:GetSkillLv(394) > 0 then --法宝
		   FinalDam[i] = FinalDam[i] + (FinalDam[i]*Atk:GetSkillLv(394)*0.03)
		end
		if Target:IsMob() or Target:IsBoss() then
	       FinalDam[i] = FinalDam[i] * 1.3
	    end
		if result == 2 then
			Target:MissSkill();		
		elseif math.random(1,100) <= CritRate then
			FinalDam[i] = FinalDam[i] * critDam;
			CritHit[i] = 1;
		end
		
		if Target:GetCommand() == LuaI.BATCMD_DEFEND then
			FinalDam[i] = FinalDam[i] / 2;
			
			if FinalDam[i] <= 10 then
				FinalDam[i] = math.random(1, 10);
			end
			
			if CritHit[i] == 1 then
				Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_DEFEND_CRIT_HIT);
			else
				Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_DEFEND_HIT);
			end
		else
			if FinalDam[i] <= 10 then
				FinalDam[i] = math.random(1, 10);
			end
			
			if CritHit[i] == 1 then
				Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_CRIT_HIT);
			else
				Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_SKILL_HIT);
			end
		end
		i = i + 1;
	end
	
	battle:PushReactionActor(Target);
	if skillLv < 130 and Atk:GetSkillLv(394) < 15 then
	   Atk:RemoveBuff(1502);
	end
	Atk:AddBuff(1303, skillLv, 0, 0, 1, 100);
	
end

