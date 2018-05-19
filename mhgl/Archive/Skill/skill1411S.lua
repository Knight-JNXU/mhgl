-- 天玄掌

function skill1411CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需天元掌法修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);	
	end	
end

function skill1411Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.8 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展天玄掌", consumeSp);
	
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
	local skillDam = (Atk:GetSkillLv(1400) + Atk:GetSkillLv(1410) + Atk:GetSkillLv(1420) 
					+ Atk:GetSkillLv(1430) + Atk:GetSkillLv(1440)) * 0.48 + (Atk:GetSkillLv(1400) ^ 2 
					+ Atk:GetSkillLv(1410) ^ 2 + Atk:GetSkillLv(1420) ^ 2 + Atk:GetSkillLv(1430) ^ 2 
					+ Atk:GetSkillLv(1440) ^ 2 ) * 0.0016 + 20 ;
	local weaponDam = Atk:GetWeaponATK();
	local hpChange = ((Atk:GetPOW() - Target:GetPOW() + 0.25 * weaponDam) * 1.1 + 2 
						* skillLv + 0.1 * skillDam + 260)  * nDam - 250;
	if LuaI.GetGameTime(0) == 1 then
		hpChange = hpChange * 1.3;
	end
	
	if hpChange <= 10 then
		hpChange = math.random(1, 10);
	end	
	
	local spChange = 0.3 * hpChange;
	local mhpChange = 0.002 * hpChange * Atk:GetSkillLv(1450);
	if mhpChange < 2 * Atk:GetSkillLv(1450) then
		mhpChange = 2 * Atk:GetSkillLv(1450);
	end
	if mhpChange > hpChange then
		mhpChange = hpChange;
	end
	local result = skillCanHit(Atk, Target);
	
	if result == 2 then
		Target:MissSkill();
	else
		Target:ChangeHp(-1 * hpChange);
		Target:ChangeSp(-1 * spChange);
		Target:ChangeMHp(-1 * mhpChange);
	end
	
	battle:PushReactionActor(Target);
	
end
