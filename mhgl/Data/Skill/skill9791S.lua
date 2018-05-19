--MOB虎啸苍穹

function skill9791CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill9791Use(Atk, Target, battle, skillLv)	
    local Lv = Atk:GetLevel();
	local nDamskill1 = 0;
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
		
	local hpChange = ((Atk:GetPOW() - Target:GetPOW()) * 1.2 + 2.5 * (Lv + 10) + 280 + 1.5 * nDamsBonus1 * Lv)  * nDam - 250;
	
	if  hpChange < 1 then
		hpChange = math.random(1, 10);
	end

	local hp = 0 ;
	local lv = Target:GetLevel()
	local A = 0
	if lv <= 159 then
	  A = math.random(1000,1500)
	elseif lv <= 105 then
	  A = math.random(700,1000)
	end
	
	
	
	local result = skillCanHit(Atk, Target);
	if result == 2 then
		Target:MissSkill();
	else
		Target:ChangeHp(-1 * A);
	end
	
	battle:PushReactionActor(Target);
	
end

