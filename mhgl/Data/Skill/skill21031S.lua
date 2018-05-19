--烟雨剑法

function skill21031CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需潇湘仙雨修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill21031Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 10 + 0.5 * skillLv;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	--local req1 = ((Atk:GetSkillLv(3250) - 100) * math.floor((Atk:GetSkillLv(3250) + 500) / 600) + 
	--			(Atk:GetSkillLv(3250) - 50) * math.floor((Atk:GetSkillLv(3250) + 500) / 550) + Atk:GetSkillLv(3250)) / 10;
	local req1 = Atk:GetSkillLv(21030) / 10;
	local reqHp = Atk:GetMaxHP() * (75 - req1) / 100;
	
	local Msg = string.format("\#W[战斗讯息]：内力不足\#G%d\#W，无法施展烟雨剑法", consumeSp);
	--local Msg2 = string.format("\#W[战斗讯息]：生命不足\#G%d\#W，无法施展烟雨剑法", reqHp);
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
    if Atk:GetHP() < reqHp then
		Atk:SkillFail("\#W[战斗讯息]：生命不足，无法施展烟雨剑法");
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
						nDam = 1.02 ^ Atk:GetSkillLv(376) * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(383);
					end
				end
			end
		end
	else
		nDam = 1.02 ^ Atk:GetSkillLv(376) * 0.98 ^ Target:GetSkillLv(377);
	end
	
	local weaponDam = 0.25 * Atk:GetWeaponATK();
	local skillDam = (Atk:GetSkillLv(3200) + Atk:GetSkillLv(3210) + Atk:GetSkillLv(3220) 
					+ Atk:GetSkillLv(3230) + Atk:GetSkillLv(3240)) * 0.48 + (Atk:GetSkillLv(3200) ^ 2 
					+ Atk:GetSkillLv(3210) ^ 2 + Atk:GetSkillLv(3220) ^ 2 + Atk:GetSkillLv(3230) ^ 2 
					+ Atk:GetSkillLv(3240) ^ 2 ) * 0.0016 + 20 ;
	
	
	local FinalDam = {0, 0};
	local critDam = 1.6;
	local DamRate = {0.75, 0.75};
	local AtkNum = 2;
	local CritRate = 10;
	if Atk:GetSkillLv(394) > 0 then
	   FinalDam = {0, 0, 0};
	   critDam = 1.8;
	   DamRate = {0.75, 0.75, 0.75};
	   AtkNum = 3;
	   CritRate = 15;
	end
	local Crit = 0; --暴击标志
	local i = 1;
	while i <= AtkNum do
		
		local result = skillCanHit(Atk,Target);
		if result == 2 then
			Target:MissSkill();		
		else
			FinalDam[i] = ((1.2 * (Atk:GetATK() + weaponDam ) - Target:GetDEF() 
							+ skillLv + 0.1 * skillDam + 2600) * nDam - 250) * DamRate[i];
		end
		if Atk:GetSkillLv(394) > 0 then --法宝
		   FinalDam[i] = FinalDam[i] + (FinalDam[i] * Atk:GetSkillLv(394) * 0.042)
		end
		local Rate = 10 + math.floor(Atk:GetSkillLv(21030) / 15);
		Crit = 0
		if i == 3 then -- 第三下提升暴击概率
		   Rate = 70
		end
		if math.random(1, 100) <= Rate then
			FinalDam[i] = FinalDam[i] * critDam;
			Crit = 1
		end
		
		if FinalDam[i] <= CritRate then
			FinalDam[i] = math.random(1, 10);
		end
		
		--Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_SKILL_HIT);
		if Crit == 1 then
		   Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_CRIT_HIT); --暴击效果  BATCMD_CRIT_HIT暴击效果 BATCMD_SKILL_HIT普通效果  BATCMD_DEFEND_CRIT_HIT防御暴击效果  BATCMD_DEFEND_HIT防御效果
		else
		   Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_SKILL_HIT); --普通效果
		end
		i = i + 1;
	end
	
	battle:PushReactionActor(Target);
	
end

