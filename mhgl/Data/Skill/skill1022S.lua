--虎啸苍穹

function skill1022CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需啸天决修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill1022Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.6 * skillLv + 10;	
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展虎啸苍穹", consumeSp);
	
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
	local skillDam = (Atk:GetSkillLv(1000) + Atk:GetSkillLv(1010) + Atk:GetSkillLv(1020) 
					+ Atk:GetSkillLv(1030) + Atk:GetSkillLv(1040)) * 0.48 + (Atk:GetSkillLv(1000) ^ 2 
					+ Atk:GetSkillLv(1010) ^ 2 + Atk:GetSkillLv(1020) ^ 2 + Atk:GetSkillLv(1030) ^ 2 
					+ Atk:GetSkillLv(1040) ^ 2 ) * 0.0016 + 20 ;
	local weaponDam = Atk:GetWeaponATK();
	local hpChange = ((Atk:GetPOW() - Target:GetPOW() + 0.25 * weaponDam) * 1.2 + 2.5 
						* skillLv + 0.1 * skillDam + 280)  * nDam - 250;
	
	if hpChange <= 10 then
		hpChange = math.random(1, 10);
	end
	
	local result = skillCanHit(Atk, Target);
	
	if result == 2 then
		Target:MissSkill();
	else
		Target:ChangeHp(-1 * (hpChange - 140));
	end
	
	battle:PushReactionActor(Target);
	
end

