--风雷七星斩

function skill1611CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需惊魂刀法修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill1611Use(Atk, Target, battle, skillLv)
	
	local consumeHp = 0.1 * Atk:GetHP() * math.random(9, 11) / 10;
	
	if consumeHp <= 1 then
		consumeHp = 1;
	end
	
	local reqHp = Atk:GetMaxHP() * 0.5;
	if Atk:GetHP() < reqHp then
		Atk:SkillFail("\#W[战斗讯息]：生命不足\#G50\%\#W，无法施展风雷七星斩");
		do return end
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
	
	local weaponDam = 0.25 * (Atk:GetHIT() - Atk:GetAGI() * 1.7 - 6);
	local critDam = 2.0;
	local FinalDef = Target:GetDEF();
	if 0.8 * Atk:GetATK() > Target:GetDEF() then
		if math.random(1, 100) <= 5 then
			FinalDef = Target:GetDEF() / 2;
		end
	end
	
	local FinalDam = {0, 0, 0};
	local CritHit = {0, 0, 0};
	local DamRate = {0.95, 1.1, 1.55};
	local CritRate =  5;
	if Atk:IsBuffExist(1633) then
		CritRate =  20;
	end
	
	local i = 1;
	while i <= 3 do
		local randomDam = 1.2 - math.random(100, 300) / 1000;
		local result = skillCanHit(Atk,Target);
		if result == 2 then
			Target:MissSkill();		
		elseif math.random(1,100) <= CritRate then
			FinalDam[i] = ((DamRate[i] * Atk:GetATK() - 0.95 * FinalDef + weaponDam + 250) * wDam - 250) * randomDam * critDam;
			CritHit[i] = 1;
		else
			FinalDam[i] = ((DamRate[i] * Atk:GetATK() - 0.95 * FinalDef + weaponDam + 250) * wDam - 250) * randomDam;
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
	
	if Atk:GetHP() ~= 1 then
		Atk:ChangeHp(-1 * consumeHp, false);
	end
	
	local DefEffect = 0.8 + math.floor(Atk:GetSkillLv(1650) / 5) / 100;
	local PowEffect = 0.8 + math.floor(Atk:GetSkillLv(1650) / 5) / 100;
	battle:PushReactionActor(Target);
	Atk:AddBuff(1300, skillLv, 0, 0, 1, 100);
	Atk:AddBuff(1301, skillLv, DefEffect, PowEffect, 1, 100);
	
end

