--MOB长河落日剑

function skill9792CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill9792Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local nDamskill1 = 0;
	local skill = Atk:GetSkillLv(5300);	
	local RateBase = 10;
	local FinalDam = {0};
	local DamRate = {1};
	local lianji = 1;
	
	if skill == 1 then
		RateBase = 30;
	end
	
	local Rate = RateBase + math.floor((Lv + 10) / 10);
	if Rate < 10 then
		Rate = 10;
	elseif Rate > 100  then
		Rate = 100;
	end
	
	if math.random(1, 100) <= Rate then
		lianji = 2;
		FinalDam = {0,0};
		DamRate = {0.8, 0.8};
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
	
	
	local i = 1;
	while i <= lianji do
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
		
		FinalDam[i] = (((Atk:GetPOW() - Target:GetPOW()) * 1.35 + 2.8 * (Lv + 10) + 300 + 1.5 * nDamsBonus1 * Lv) * nDam - 250) * DamRate[i];
		
	  local hp = 0 ;
	  local lv = Target:GetLevel()
	  local A = 0
	  if lv <= 159 then
	    FinalDam[i] = math.random(1000,1700)
	  elseif lv <= 105 then
	    FinalDam[i] = math.random(900,1200)
	  end
		
		
		
		
		if FinalDam[i] <= 1 then
			FinalDam[i] = math.random(1, 10);
		end
		
		
		
		Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_SKILL_HIT);
		
		i = i + 1;
	end
	
	battle:PushReactionActor(Target);
	
end
