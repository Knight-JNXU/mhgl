--四象两仪掌

function skill2651CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需修罗真经修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill2651Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.3 * skillLv + 10;	
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展四象两仪掌", consumeSp);
	
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
	local skillDam = (Atk:GetSkillLv(2600) + Atk:GetSkillLv(2610) + Atk:GetSkillLv(2620) 
						+ Atk:GetSkillLv(2630) + Atk:GetSkillLv(2640)) * 0.48 + (Atk:GetSkillLv(2600) ^ 2 
						+ Atk:GetSkillLv(2610) ^ 2 + Atk:GetSkillLv(2620) ^ 2 + Atk:GetSkillLv(2630) ^ 2 
						+ Atk:GetSkillLv(2640) ^ 2 ) * 0.0016 + 20 ;
	local weaponDam = Atk:GetWeaponATK();
	local hpChange = ((Atk:GetPOW() - Target:GetPOW() + 0.25 * weaponDam) * 1.35 + 2.8 
						* skillLv + 0.1 * skillDam + 280)  * nDam - 250;
	if Atk:IsBuffExist(1305) then
		hpChange = (1.35 * Atk:GetPOW() - Target:GetPOW() + 0.25 * weaponDam + 2.8 
					* skillLv + 0.1 * skillDam + 280)  * nDam - 250;
	end
	if (Target:IsBuffExist(2020) or Target:IsBuffExist(2021) or Target:IsBuffExist(2053) 
			or Target:IsBuffExist(2054)) == true then 
			hpChange = 2 * hpChange;
		end
	if hpChange <= 10 then
		hpChange = math.random(1, 10);
	end
	
	local result = skillCanHit(Atk, Target);
	
	if result == 2 then
		Target:MissSkill();
	else
		Target:ChangeHp(-1 * hpChange);
	end
	
	battle:PushReactionActor(Target);
	
end

