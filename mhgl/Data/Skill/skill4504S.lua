--雷霆震怒

function skill4504CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4504Use(Atk, Target, battle, skillLv)
	
	local sLv = Atk:GetLevel();
	local consumeSp = 0.8 * sLv;
	if Atk:IsBuffExist(1707) then
		consumeSp = 0;
	end
	local Msg = string.format("\#W[战斗讯息]：内力不足\#G%d\#W，无法施展雷霆震怒", consumeSp);
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local wDam = 1;		--是CBatActor类型 
	local wDam1 = 1;
	local ZPartnerOwner;			--是CBatActor类型
	local PartnerOwner;			--是CBatActor类型
	if Atk:IsParnter() then
		local ZpBatMob = Atk:ToBatMob();
		if ZpBatMob ~= nil then
			for jj=0, battle:GetActorCount() - 1 do
				local ZpActor = battle:GetActor(jj);
				if ZpActor:IsPlayer() then
					local ZpBatChar = ZpActor:ToBatChar();
					if ZpBatChar ~= nil and ZpBatChar:GetChar_id() == ZpBatMob:GetOwner_id() then
						ZPartnerOwner = ZpActor;
						wDam1 = 1.02 ^ ZPartnerOwner:GetOwner():GetSkillLv(382);
					end
				end
			end
		end
	else
		wDam1 = 1.02 ^ Atk:GetSkillLv(376);
	end
	if Target:IsParnter() then
		local pBatMob = Target:ToBatMob();
		if pBatMob ~= nil then
			for ii=0, battle:GetActorCount() - 1 do
				local pActor = battle:GetActor(ii);
				if pActor:IsPlayer() then
					local pBatChar = pActor:ToBatChar();
					if pBatChar ~= nil and pBatChar:GetChar_id() == pBatMob:GetOwner_id() then
						PartnerOwner = pActor;
						wDam = wDam1 * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(383);
					end
				end
			end
		end
	else
		wDam = wDam1 * 0.98 ^ Target:GetSkillLv(377);
	end
	
	local critDam = 2.0;
	local FinalDef = Target:GetDEF();
	if 0.8 * Atk:GetATK() > Target:GetDEF() then
		if math.random(1, 100) <= 5 then
			FinalDef = Target:GetDEF() / 2;
		end
	end
	
	local FinalDam = {0};
	local DamRate = {1};
	local CritHit = {0};
	local lianji = 1;
	
	local Rate = 0;
	if Atk:IsBuffExist(2003) and Target:IsBuffExist(2001) ~= true and not Atk:IsBuffExist(2036) and 
		Target:IsBuffExist(2034) ~= true and Target:IsBuffExist(2033) ~= true and 
		Target:IsBuffExist(2000) ~= true and Target:IsBuffExist(1626) ~= true then
		Rate = 45;
		if math.random(1, 100) <= Rate then
			lianji = 2;
			FinalDam = {0,0};
			DamRate = {0.85, 1.1};
			CritHit = {0, 0};
		end
	end
	if Atk:IsBuffExist(2036) and Target:IsBuffExist(2001) ~= true and 
		Target:IsBuffExist(2034) ~= true and Target:IsBuffExist(2033) ~= true and 
		Target:IsBuffExist(2000) ~= true and Target:IsBuffExist(1626) ~= true then
		Rate = 55;
		if math.random(1, 100) <= Rate then
			lianji = 3;
			FinalDam = {0,0,0};
			DamRate = {1.2, 0.9, 0.75};
			CritHit = {0, 0, 0};
		end
	end
	
	local i = 1;
	while i <= lianji do
		local buffRate = 25;
		local CritRate =  5;
		if Atk:IsBuffExist(2043) then
			CritRate = 25;
		elseif Atk:IsBuffExist(2010) then
			CritRate = 15;
		end
		local randomDam = 1.2 - (math.random(100, 300) / 1000);
		if math.random(1,100) <= CritRate then
			FinalDam[i] = ((1.0 * Atk:GetATK() - FinalDef + 250) * wDam - 250) * randomDam * critDam * DamRate[i];
			CritHit[i] = 1;
		--	buffRate = 40;
		else
			FinalDam[i] = ((1.0 * Atk:GetATK() - FinalDef + 250) * wDam - 250) * randomDam * DamRate[i];
		end
		
		if Target:GetCommand() == LuaI.BATCMD_DEFEND then
			
			FinalDam[i] = FinalDam[i] / 2;
			
			if FinalDam[i] <= 10 then
				FinalDam[i] = math.random(1, 10);
			end
			
			if CritHit[i] == 1 then
				Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_DEFEND_CRIT_HIT);
			else
				Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_DEFEND_HIT);
			end
		else
			if FinalDam[i] <= 10 then
				FinalDam[i] = math.random(1, 10);
			end
			
			if CritHit[i] == 1 then
				Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_CRIT_HIT);
			else
				Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_NORM_HIT);
			end
		end
		
		if math.random(1,100) <= buffRate and not Target:IsBuffExist(1123) then
			Target:AddBuff(1123, sLv, 0, 0, 1, 100);
		end
		i = i + 1;
	end
	
	battle:PushReactionActor(Target);
	
end

