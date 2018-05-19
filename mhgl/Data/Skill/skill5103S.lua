--MOB勾魂摄心大法

function skill5103CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5103Use(Atk, Target, battle, skillLv)
    local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local HitRate = 0;
	local HitRateBase = 60;
	
	if skill == 1 then
	    HitRateBase = 90;
	end
	
	if Target:IsMob() then
		if Target:GetMob_id() == 10496 then
			HitRateBase = 100;
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
	
	if (Lv +10) > Target:GetLevel() then
		HitRate = (HitRateBase + 2 * (Lv +10 - Target:GetLevel()) ^ 0.5) * nDam;
	else
		HitRate = (HitRateBase + 2.2 * (Lv +10 - Target:GetLevel())) * nDam;
	end
	if Target:IsBuffExist(1807) then
		HitRate = HitRate * 0.9;
	end
	if Atk:IsMob() then
		if Atk:GetMob_id() == 2944 then
			HitRate = HitRate + 20;
		end
	end
	if HitRate < 10 then
		HitRate = 10;
	elseif HitRate > 100 then
		HitRate = 100;
	end	
	if math.random(1, 100) > HitRate then
		Target:MissSkill();
		battle:PushReactionActor(Target);
		do return end
	end
	
	local turn = 4 + math.floor((Lv + 10 - Target:GetLevel()) / 10);
	if turn < 1 then
		turn = 1;
	elseif turn > 5 then
		turn = 5;
	end
	
	Atk:AddBuff(1811, (Lv + 10), 0, 0, 4, 100);
	Target:AddBuff(1114, (Lv + 10), 0, 0, turn, 100);
	battle:PushReactionActor(Target);
	
end

