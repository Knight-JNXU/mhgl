--MOB气撼九重天

function skill5064CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5064Use(Atk, Target, battle, skillLv)
	
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local lvdiff = Lv +10 - Target:GetLevel();
	local hitRateBase = 44;
	
	if skill == 1 then
	    hitRateBase = 75;
	end
	
	if Target:IsMob() then
		if Target:GetMob_id() == 10493 or Target:GetMob_id() == 32323 then
			hitRateBase = 100;
		end
	end
	
	if Atk:IsMob() then
		if Atk:GetMob_id() == 2944 then
			hitRateBase = 100;
		end
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
	
	if lvdiff > 0 then
		hitRate = (hitRateBase + 2 * lvdiff ^ 0.5) * nDam;
	else
		hitRate = (hitRateBase + 2.2 * lvdiff) * nDam;
	end
	
	if Target:IsBuffExist(1807) then
		hitRate = hitRate * 0.9;
	end
	
	if Atk:IsMob() then
		if Atk:GetMob_id() == 32219 then
			hitRate = hitRate + 25;
		end
	end
	
	if hitRate < 1 then
		hitRate = 1;
	elseif hitRate > 100 then
		hitRate = 100;
	end
	
	if Atk:IsMob() then
		if Atk:GetMob_id() == 32323 then
			hitRate = 60;
		end
	end
	
	local turn = 2 + math.floor(lvdiff / 10);
	if turn < 1 then
		turn = 1;
	elseif turn > 5 then
		turn = 5;
	end
	
	if math.random(1, 100) <= hitRate then
		Target:AddBuff(1113, (Lv + 10), 0, 0, turn, 100); 
	else
		Target:MissSkill();
	end
	
	battle:PushReactionActor(Target);
	
end