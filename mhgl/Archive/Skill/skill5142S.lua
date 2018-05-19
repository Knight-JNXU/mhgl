--MOB七星透骨针

function skill5142CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5142Use(Atk, Target, battle, skillLv)
	if Target:IsBuffExist(1104) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经中了七星透骨针")
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
	elseif HitRate > 95 then
		HitRate = 95;
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
	
	local result = skillCanHit(Atk, Target);
	if result == 2 then
		Target:MissSkill();
	else
		Target:AddBuff(1104, (Lv + 10), 0, 0, turn, 100);
	end
	battle:PushReactionActor(Target);
end

