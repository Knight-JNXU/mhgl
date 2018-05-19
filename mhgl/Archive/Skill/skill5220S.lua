--MOB灵蛇漫舞

function skill5220CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5220Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local nDamskill1 = 0;
	local FinalDam = {0, 0};
	local DamRate = {0.4, 0.6};
	--local KillFlag = 0;
	--local TargetHP = Target:GetHP();
	local CritHit={0, 0};
	local critDam = 1.3;
	local hitnum = 2;
	
	if skill == 1 then
		CritHit={0, 0, 0};
		FinalDam = {0, 0, 0};
		DamRate = {0.4, 0.5, 0.6};
		hitnum = 3;
	end
	
	local DamBonus1 = {0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9,9.5,10,11,12,13,14,15,16,17,18,19,20};
	local nDamsBonus1 = 0;
	local j = 1;
	while j <= 30 do
	    nDamskill1 = Atk:GetSkillLv(5430 + j - 1);
		if nDamskill1 == 1 then 
            nDamsBonus1 = nDamsBonus1 + DamBonus1[j];
		end
		j = j + 1;
	end	
	
	local nDam = 1;
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
						nDam = 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(385);
					end
				end
			end
		end
	else
		nDam =0.98 ^ Target:GetSkillLv(379);
	end
	
	local i = 1;
	while i <= hitnum do
		
		local result = skillCanHit(Atk,Target);
		if result == 2 then
			Target:MissSkill();		
		else
			FinalDam[i] = ((1.2 * (Atk:GetPOW()) - Target:GetPOW() + Lv + 10 + 260 + nDamsBonus1 * Lv) * nDam - 250) * DamRate[i];
		end
			
		local critRate = 15 + math.floor((Lv + 10) / 15);
		if math.random(1, 100) <= critRate then
			FinalDam[i] = FinalDam[i] * critDam;
			CritHit[i] = 1;
		end
			
		--if KillFlag == 0 then
				
			if --[[nDamsBonus2 *]] FinalDam[i] <= 10 then
				FinalDam[i] = math.random(1, 10);
			end
					
			--[[if nDamsBonus2 * FinalDam[i] >= TargetHP then
				FinalDam[i] = TargetHP + math.random(1, 10);
				KillFlag = 1;
			end]]
			if CritHit[i] == 1 then
				Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_CRIT_HIT);
			else
				Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_SKILL_HIT);
			--TargetHP = TargetHP - nDamsBonus2 * FinalDam[i];
			end	
		--[[end
			
		if KillFlag == 1 then
			break;
		end]]
		
		i = i + 1;
		
	end
	battle:PushReactionActor(Target);
end

