--乾坤一掷

function skill2212CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需秘掷宝典修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill2212Use(Atk, Target, battle, skillLv)

	local consumeSp = 0.9 * skillLv +10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足%d，无法施展乾坤一掷", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
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
						nDam = 1.02 ^ Atk:GetSkillLv(378) * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(385);
					end
				end
			end
		end
	else
		nDam = 1.02 ^ Atk:GetSkillLv(378) * 0.98 ^ Target:GetSkillLv(379);
	end
	
	local HitRate = 0;
	if skillLv > Target:GetLevel() then
		HitRate = (58 + 2 * (skillLv - Target:GetLevel()) ^ 0.5) * nDam;
	else
		HitRate = (58 + 2.2 * (skillLv - Target:GetLevel())) * nDam;
	end
	if HitRate < 1 then
		HitRate = 1;
	elseif HitRate > 95 then
		HitRate = 95;
	end	
	
	local hpChange = 0;
	local spChange = 0;
	local PassiveDam = math.floor (Atk:GetSkillLv(2250) / 15);
	if math.random(1, 100) <= HitRate then
		
		hpChange = (0.25 + PassiveDam / 100) * Target:GetHP();
		spChange = (0.25 + PassiveDam / 100) * Target:GetSP();
		if hpChange > 50 * skillLv then
			hpChange = 50 * skillLv;	
		end
	else
		hpChange = (0.05 + PassiveDam / 100) * Target:GetHP() + 50;
		if hpChange > (10 + PassiveDam) * skillLv then
			hpChange = (10 + PassiveDam) * skillLv;	
		end
	end
	
	if hpChange <= 1 then
		hpChange = 1;
	end
	
	if spChange <= 1 then
		spChange = 1;
	end
	
	Target:ChangeHp(-1 * hpChange);
	Target:ChangeSp(-1 * spChange);
	battle:PushReactionActor(Target);
	
end

