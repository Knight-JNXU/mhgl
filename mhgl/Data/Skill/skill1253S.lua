--无极潜渊式--释放

function skill1253CanUse(Atk, skillLv, reqSkillLv, reqCharLv)

	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需十二无双心法修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif not Atk:IsBuffExist(1306) and not Atk:IsBuffExist(1311) and not Atk:IsBuffExist(1312) then
		local Msg = "\#W[战斗讯息]：此招式需要集气后才能使用";
		Atk:SkillFail(Msg);
	end	
end

function skill1253Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.4 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：内力不足\#G%d\#W，无法施展无极潜渊式", consumeSp);

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
	local skillDam = (Atk:GetSkillLv(1200) + Atk:GetSkillLv(1210) + Atk:GetSkillLv(1220) 
					+ Atk:GetSkillLv(1230) + Atk:GetSkillLv(1240)) * 0.48 + (Atk:GetSkillLv(1200) ^ 2 
					+ Atk:GetSkillLv(1210) ^ 2 + Atk:GetSkillLv(1220) ^ 2 + Atk:GetSkillLv(1230) ^ 2 
					+ Atk:GetSkillLv(1240) ^ 2 ) * 0.0016 + 20 ;
	local weaponDam = Atk:GetWeaponATK();
	local damRate = 2;
	local redamRate = 15;
	if Atk:IsBuffExist(1306) then
		damRate = 2;
		redamRate = 14;
	elseif Atk:IsBuffExist(1311) then
		damRate = 4;
		redamRate = 28;
	elseif Atk:IsBuffExist(1312) then
		damRate = 6.5;
		redamRate = 45;
	end
	local FinalDam = damRate * (((Atk:GetPOW() - Target:GetPOW() + 0.25 * weaponDam) * 1.35 + 2.8 
						* skillLv + 0.1 * skillDam + 300)  * nDam - 250);
	if FinalDam < 1 then
		FinalDam = math.random(1, 10);
	end
	local reDam = Target:GetFinalValue(-FinalDam, Atk, Atk:GetAction(), 1);
	if -reDam < 1 then
		reDam = - 1;
	end
	if - reDam < redamRate * skillLv then
		FinalDam = - redamRate * skillLv * FinalDam / reDam;
	end
	
	Target:ChangeHp(-1 * FinalDam);
	Atk:RemoveBuff(1306);
	Atk:RemoveBuff(1311);
	Atk:RemoveBuff(1312);
	battle:PushReactionActor(Target);
end
