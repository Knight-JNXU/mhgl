--MOB点血截脉

function skill5163CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5163Use(Atk, Target, battle, skillLv)
	if Target:IsBuffExist(1105) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经中了点血截脉");
		do return end
	end
	
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local HitRate = 0;
	local HitRateBase = 68;
	
	if skill == 1 then
		HitRateBase = 95;
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
	
	if (Lv + 10) > Target:GetLevel() then
		HitRate = (HitRateBase + 2 * ((Lv + 10) - Target:GetLevel()) ^ 0.5) * nDam;
	else
		HitRate = (HitRateBase + 2.2 * ((Lv + 10) - Target:GetLevel())) * nDam;
	end
	if Target:IsBuffExist(1807) then
		HitRate = HitRate * 0.9;
	end
	if HitRate < 1 then
		HitRate = 1;
	elseif HitRate > 100 then
		HitRate = 100;
	end	
	
	if Target:IsMob() then
		if Target:GetMob_id() == 10493 or Target:GetMob_id() == 10497 then
			HitRate = 100;
		end
	end
	
	if math.random(1, 100) > HitRate then
		Target:MissSkill();
		battle:PushReactionActor(Target);
		do return end
	end
	
	local turn = 0;
	turn = 1 + math.floor((Lv + 10) / 50) + math.floor((Lv + 10 - Target:GetLevel()) / 10);
	if turn < 1 then
		turn = 1;
	elseif turn > 5 then
		turn = 5;
	end
	
	if Atk:IsMob() then
		if Atk:GetMob_id() == 10417 then
			turn = 120;
		end
	end
	
	local DefEffect = 0.9 * Target:GetDEF();
	local result = skillCanHit(Atk, Target);
	if result == 2 then
		Target:MissSkill();
	else
		Target:AddBuff(1105, (Lv + 10), DefEffect, 0, turn, 100);
	end
	battle:PushReactionActor(Target);
	
end

