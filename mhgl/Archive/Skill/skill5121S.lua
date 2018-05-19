--MOB

function skill5121CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5121Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local HitRate = 0;
	local HitRateBase = 68;
	
	if skill == 1 then
		HitRateBase = 80;
	end
	local consumeSp = 1.5 * Lv +10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足%d，无法施展乾坤一掷", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
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
		HitRate = (HitRateBase + 2 * (Lv +10 - Target:GetLevel()) ^ 0.5) * nDam;
	else
		HitRate = (HitRateBase + 2.2 * (Lv + 10 - Target:GetLevel())) * nDam;
	end
	if HitRate < 1 then
		HitRate = 1;
	elseif HitRate > 100 then
		HitRate = 100;
	end	
	
	if Target:IsMob() then
		if Target:GetMob_id() == 10493 then
			HitRate = 100;
		end
	end
	
	local hpChange = 0;
	local spChange = 0;
	local DamBase = 0.25;
	
	if skill == 1 then
		DamBase = 0.75;
	end
	
	local PassiveDam = math.floor ((Lv + 10) / 15);
	if math.random(1, 100) <= HitRate then
		
		hpChange = 0.25 * Target:GetHP();
		spChange = 0.1 * Target:GetSP();
		if hpChange >= 2000 * Lv then
			hpChange = 2000 * Lv;
        end			
	else
		hpChange = (DamBase / 5 + PassiveDam / 100) * Target:GetHP() + 50;
		if hpChange <= 2 * Lv then
			hpChange = 2 * Lv;	
		end
	end
	
	if hpChange <= 1 then
		hpChange = math.random(1, 10);
	end
	
	if spChange <= 1 then
		spChange = math.random(1, 10);
	end
	
	Target:ChangeHp(-1 * hpChange);
	Target:ChangeSp(-1 * spChange);
	battle:PushReactionActor(Target);
	
end

