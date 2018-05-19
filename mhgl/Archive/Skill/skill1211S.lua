--长河落日剑

function skill1211CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需落日剑法修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);	
	end	
end

function skill1211Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.8 * skillLv + 10;	
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展长河落日剑", consumeSp);
	
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
	local FinalDam = {0};
	local DamRate = {1};
	local lianji = 1;
	
	local jichuRate = 0;
	if Atk:GetSkillLv(1250) > 0 then
		jichuRate = 17.5;
	end
	local Rate = jichuRate + math.floor(Atk:GetSkillLv(1250) / 5);
	if Rate < 0 then
		Rate = 0;
	elseif Rate > 80  then
		Rate = 80;
	end
	
	if math.random(1, 100) <= Rate then
		lianji = 2;
		FinalDam = {0,0};
		DamRate = {0.8, 0.8};
	end
	
	local i = 1;
	while i <= lianji do
		
		FinalDam[i] = (((Atk:GetPOW() - Target:GetPOW() + 0.25 * weaponDam) * 1.35 + 2.8 
							* skillLv + 0.1 * skillDam + 300)  * nDam - 250) * DamRate[i];
		if FinalDam[i] <= 10 then
			FinalDam[i] = math.random(1, 10);
		end	
		
		Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_SKILL_HIT);
		
		i = i + 1;
	end
	
	battle:PushReactionActor(Target);
	
end
