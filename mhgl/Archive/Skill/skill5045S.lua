--MOB凤飞羽散

function skill5045CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5045Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local buffid = {1500, 1501, 1503, 1504, 1505, 1506, 1507, 1514, 1516, 1200, 1201, 1202, 1203, 1803, 1806, 1815};--对应skillid
	--local buffcount = 13;
	local HitRate = 0;
	local i = 1;
	local Rate = 0;
	
	if Target:GetLevel() > (Lv + 10) then
		Rate = 60 + 2.2 * (Lv + 10 - Target:GetLevel()); 
	else
		Rate = 60 + 2 * (Lv + 10 - Target:GetLevel()) ^ 0.5;
	end
	
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
						nDam = 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(385);
					end
				end
			end
		end
	else
		nDam = 0.98 ^ Target:GetSkillLv(379);
	end
			
	local HitRate = Rate * nDam;
	if HitRate > 90 then
		HitRate = 90;
	end
	
	if HitRate < 5 then
		HitRate = 5;
	end
	
	if Target:IsMob() then
		if Target:GetMob_id() == 10494 or Atk:GetMob_id() == 2382 or Atk:GetMob_id() == 2383 then
			HitRate = 100;
		end
	end
	
	if math.random(1, 100) <= HitRate then
		i = 1;
		while buffid[i] ~= nil do
			Target:RemoveBuff(buffid[i]);
			i = i + 1;
		end
	else 
		Target:MissSkill();
	end
	
	battle:PushReactionActor(Target);
	
end


