--灵蛇漫舞

function skill3211CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需灵蛇心法修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill3211Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.5 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	--local req1 = ((Atk:GetSkillLv(3250) - 100) * math.floor((Atk:GetSkillLv(3250) + 500) / 600) + 
	--			(Atk:GetSkillLv(3250) - 50) * math.floor((Atk:GetSkillLv(3250) + 500) / 550) + Atk:GetSkillLv(3250)) / 10;
	local req1 = Atk:GetSkillLv(3250) / 10;
	local reqHp = Atk:GetMaxHP() * (75 - req1) / 100;
	
	local Msg = string.format("\#W[战斗讯息]：内力不足\#G%d\#W，无法施展灵蛇漫舞", consumeSp);
	--local Msg2 = string.format("\#W[战斗讯息]：生命不足\#G%d\#W，无法施展灵蛇漫舞", reqHp);
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	if Atk:GetHP() < reqHp then
		Atk:SkillFail("\#W[战斗讯息]：生命不足，无法施展灵蛇漫舞");
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local nDam = 1;		--是CBatActor类型 
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
						nDam = 1.02 ^ Atk:GetSkillLv(378) * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(385);
					end
				end
			end
		end
	else
		nDam = 1.02 ^ Atk:GetSkillLv(378) * 0.98 ^ Target:GetSkillLv(379);
	end
	
	local weaponDam = 0.25 * Atk:GetWeaponATK();
	local skillDam = (Atk:GetSkillLv(3200) + Atk:GetSkillLv(3210) + Atk:GetSkillLv(3220) 
					+ Atk:GetSkillLv(3230) + Atk:GetSkillLv(3240)) * 0.48 + (Atk:GetSkillLv(3200) ^ 2 
					+ Atk:GetSkillLv(3210) ^ 2 + Atk:GetSkillLv(3220) ^ 2 + Atk:GetSkillLv(3230) ^ 2 
					+ Atk:GetSkillLv(3240) ^ 2 ) * 0.0016 + 20 ;
	local FinalDam = {0, 0};
	local critDam = 1.3;
	local DamRate = {0.7, 0.7};
	
	local i = 1;
	while i <= 2 do
		
		local result = skillCanHit(Atk,Target);
		if result == 2 then
			Target:MissSkill();		
		else
			FinalDam[i] = ((1.2 * (Atk:GetPOW() + weaponDam ) - Target:GetPOW() 
							+ skillLv + 0.1 * skillDam + 260) * nDam - 250) * DamRate[i];
		end
		
		local critRate = 15 + math.floor(Atk:GetSkillLv(3250) / 15);
		if math.random(1, 100) <= critRate then
			FinalDam[i] = FinalDam[i] * critDam;
		end
		
		if FinalDam[i] <= 10 then
			FinalDam[i] = math.random(1, 10);
		end
		
		Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_SKILL_HIT);
		
		i = i + 1;
	end
	
	battle:PushReactionActor(Target);
	
end

