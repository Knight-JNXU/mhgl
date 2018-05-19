--MOB连环封魔式

function skill5088CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
    if Atk:IsBuffExist(1502) == false then
		Atk:SkillFail("\#W[战斗讯息]：此招式需在云体风身状态下才能施展");	
		do return end
	end
end

function skill5088Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local consumeSp = 2.5 * Lv + 100;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：内力不足\#G%d\#W，无法施展连环封魔式", consumeSp);

	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
		local reqHp = Atk:GetMaxHP() * 0.3;
	if Atk:GetHP() < reqHp then
		Atk:SkillFail("\#W[战斗讯息]：生命不足\#G30\%\#W，无法施展连环封魔式");
		do return end
	end	
	Atk:ChangeHp(-1 * consumeSp, false);
	
	
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
	
	
	if 0.65 * Atk:GetATK() > Target:GetDEF() then
		if math.random(1, 100) <= 5 then
			FinalDef = Target:GetDEF() / 2;
		end
	end
	local FinalDam = {0, 0, 0, 0, 0, 0};
	local CritHit = {0, 0, 0, 0, 0, 0};
	local DamRate = {1.7, 1.5, 1.2, 0.95, 0.75, 0.55};
	local CritRate =  5;
	local i = 1;
	   if skillLv <= 100 then
		  DamRate = {0.8, 0.75, 0.55, 0.4, 0.3, 0.25};
		  CritRate =  1;
	   elseif skillLv <= 140 then
	      DamRate = {1.2, 0.95, 0.85, 0.7, 0.5, 0.35};
		  CritRate =  2;
	   elseif skillLv <= 160 then	
	      DamRate = {1.4, 1.1, 0.95, 0.75, 0.65, 0.45};
		  CritRate =  3;
	   elseif skillLv <= 180 then	
	      DamRate = {1.6, 1.3, 1.1, 0.9, 0.7, 0.5};	
		  CritRate =  4;	
	   end  
	while i <= 6 do
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
	
	battle:PushReactionActor(Target);
	Atk:RemoveBuff(1502);
	Atk:AddBuff(1303, skillLv, 0, 0, 1, 100);
	
end
