--血碎长空

function skill4400CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4400Use(Atk, Target, battle, skillLv)
	
	local sLv = Atk:GetLevel();
	local consumeHp = 0 * Atk:GetHP();
	local Msg = string.format("\#W[战斗讯息]：生命不足\#G%d\#W，无法施展神·血碎长空", consumeHp);
	local reqHp = Atk:GetMaxHP() * 0.01;
	if Atk:GetHP() < reqHp then
		Atk:SkillFail("\#W[战斗讯息]：生命不足\#G1\%\#W，无法施展神·血碎长空");
		do return end
	end
	
	Atk:ChangeHp(-1 * consumeHp, false);
	
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
						wDam1 = 1.02 ^ ZPartnerOwner:GetOwner():GetSkillLv(383);
					end
				end
			end
		end
	else
		wDam1 = 1.02 ^ Atk:GetSkillLv(378);
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
						wDam = wDam1 * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(385);
					end
				end
			end
		end
	else
		wDam = wDam1 * 0.98 ^ Target:GetSkillLv(378);
	end
	
	local critDam = 2.0;
	local FinalDef = Target:GetDEF();
	if 1.28 * Atk:GetATK() > Target:GetDEF() then
		if math.random(1, 100) <= 20 then
			FinalDef = Target:GetDEF() / 2;
		end
	end
	
	local FinalDam = {0};
	local DamRate = {1};
	local CritHit = {0};
	local lianji = 1;
	
	local Rate = 0;
	if Atk:IsBuffExist(2036) and Target:IsBuffExist(2001) ~= true and not Atk:IsBuffExist(2036) and 
		Target:IsBuffExist(2034) ~= true and Target:IsBuffExist(2033) ~= true and 
		Target:IsBuffExist(2000) ~= true and Target:IsBuffExist(1626) ~= true then
		Rate = 35;
		if math.random(1, 100) <= Rate then
			lianji = 2;
			FinalDam = {0,0};
			DamRate = {0.75, 0.75};
			CritHit = {0, 0};
		end
	end
	if Atk:IsBuffExist(1924) and Target:IsBuffExist(2001) ~= true and 
		Target:IsBuffExist(2034) ~= true and Target:IsBuffExist(2033) ~= true and 
		Target:IsBuffExist(2000) ~= true and Target:IsBuffExist(1626) ~= true then
		Rate = 55;
		if math.random(1, 100) <= Rate then
			lianji = math.random(2, 3);
			FinalDam = {0,0,0};
			DamRate = {1.15, 1.25, 1.35};
			CritHit = {0, 0, 0};
		end
	end
	
	local i = 1;
	while i <= lianji do
	
		local CritRate =  5;
		if Atk:IsBuffExist(2043) then
			CritRate = 25;
		elseif Atk:IsBuffExist(1925) then
			CritRate = 45;
		end
		local randomDam = 1.2 - (math.random(100, 300) / 800);
		if math.random(1,100) <= CritRate then
			FinalDam[i] = ((1.33 * Atk:GetATK() - FinalDef + 350) * wDam - 150) * randomDam * critDam * DamRate[i];
			CritHit[i] = 1;
		else
			FinalDam[i] = ((1.33 * Atk:GetATK() - FinalDef + 350) * wDam - 150) * randomDam * DamRate[i];
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
		i = i + 1;
	end
	
	battle:PushReactionActor(Target);
	
end

