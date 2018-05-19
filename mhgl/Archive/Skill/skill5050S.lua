-- MOB变云无定

function skill5050CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill5050Use(Atk, Target, battle, skillLv)
	
	local Lv = Atk:GetLevel();
	local consumeSp = 0.5 * Lv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展变云无定", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end	
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local nDamskill1 = 0;
	local DamBonus1 = {0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9,9.5,10,11,12,13,14,15,16,17,18,19,20};
	local nDamsBonus1 = 0;
	local j = 1;
	while j <= 30 do
	    nDamskill1 = Atk:GetSkillLv(5430 + j - 1);
		if nDamskill1 == 1 then 
            nDamsBonus1 = nDamsBonus1 + DamBonus1[j];
		end
		j = j + 1;
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
						nDam = 1.02 ^ Atk:GetSkillLv(384) * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(385);
					end
				end
			end
		end
	else
		nDam = 1.02 ^ Atk:GetSkillLv(384) * 0.98 ^ Target:GetSkillLv(379);
	end
	
	local hpChange = ((Atk:GetPOW() - Target:GetPOW()) * 1.0 + 1.8 * Lv + 300 + nDamsBonus1 * Lv)  * nDam - 250;
	if hpChange <= 10 then
		hpChange = math.random(1, 10);
	end	
	if math.random(1, 100) <= 48 then
		hpChange = hpChange * - 2;
	else
		hpChange = hpChange * 0.3;
	end
	
	Target:ChangeHp(hpChange);
	battle:PushReactionActor(Target);
end
