--MOB弛纵心猿秘法

function skill5165CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5165Use(Atk, Target, battle, skillLv)
	if Target:IsBuffExist(1111) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经中了弛纵心猿秘法");
		do return end
	end
	
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local BuffRate = 0;
	local BuffRateBase = 68;
	
	if skill == 1 then
		BuffRateBase = 95;
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
	
	local LvDif = Lv + 10 - Target:GetLevel();
	if LvDif > 0 then
		BuffRate = (BuffRateBase + 2 * LvDif ^ 0.5) * nDam;
	else
		BuffRate = (BuffRateBase + 2.2 * LvDif) * nDam;
	end
	if Target:IsBuffExist(1807) then
		BuffRate = BuffRate * 0.9;
	end
	
	if Target:IsMob() then
		if Target:GetMob_id() == 30738 then
			BuffRate = BuffRate + 20;
		end
	end
	
	if BuffRate < 1 then
		BuffRate = 1;
	elseif BuffRate > 100 then
		BuffRate = 100;
	end
	
	if Target:IsMob() then
		if Target:GetMob_id() == 10493 then
			BuffRate = 100;
		end
	end
	
	if math.random(1, 100) > BuffRate then
		Target:MissSkill();
		battle:PushReactionActor(Target);
		do return end
	end
	
	--local turn = 4 + math.floor((skillLv - Target:GetLevel()) / 10);
	--if turn < 1 then
	--	turn = 1;
	--elseif turn > 5 then
	--	turn = 5;
	--end
	
	local result = skillCanHit(Atk, Target);	
	if result == 2 then
		Target:MissSkill();
	else	
		Target:AddBuff(1111, (Lv + 10), 1, 0, 120, 100);
	end
	battle:PushReactionActor(Target);	
end

