--骇浪滔天

function skill0399CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill0399Use(Atk, Target, battle, skillLv)
	
	local lv = Atk:GetLevel();
	local targetlist = {};
	
	local maxTargetCount = math.floor( lv / 20) + 1;
	if maxTargetCount > 4 then
		maxTargetCount = 4;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	local consumeMoney = 2000 * count;
	
	local Msg = string.format("\#W[战斗讯息]：银两不足\#G%d\#W，无法施展钱能通神",consumeMoney)
	local Msg1 = string.format("\#W[战斗讯息]：施展钱能通神成功，扣除银两\#G%d\#W两",consumeMoney)
	
	
	local ZPartnerOwnera	--是CBatActor类型
	if Atk:IsParnter() then
		local ZpBatMob = Atk:ToBatMob();
		if ZpBatMob ~= nil then
			for m =0, battle:GetActorCount() - 1 do
				local ZpActor = battle:GetActor(m);
				if ZpActor:IsPlayer() then
					local ZpBatChar = ZpActor:ToBatChar();
					if ZpBatChar ~= nil and ZpBatChar:GetChar_id() == ZpBatMob:GetOwner_id() then
						ZPartnerOwnera = ZpActor;
					end
				end
			end
		end
	end
	if ZPartnerOwnera:GetOwner():GetMoney() < consumeMoney then
		Atk:SkillFail(Msg);
		do return end
	end
	ZPartnerOwnera:GetOwner():ShowAwardMsg(Msg1)
	ZPartnerOwnera:GetOwner():ChangeMoney(-1 * consumeMoney, 2);
	
	local RateDam = 1;
	local CritHit = {};
	local CritRate = 0;
	if Atk:IsBuffExist(2026) then
		CritRate = 20;
	end
	if Atk:IsBuffExist(2059) then
		CritRate = 35;
	end
	local lianji = 1;
	local Rate = 0;
	if Atk:IsBuffExist(2025) then
		Rate = 20;
	end
	if Atk:IsBuffExist(2058) then
		Rate = 35;
	end
	if math.random(1, 100) <= Rate then
		lianji = 2;
	end
	
	local i = 0;
	local j = 0;
	if lianji == 1 then
		
		while targetlist[j] ~= nil do
			
			local nDam = 1;		--是CBatActor类型 
			local nDam1 = 1;
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
								nDam1 = 1.03 ^ ZPartnerOwner:GetOwner():GetSkillLv(384);
							end
						end
					end
				end
			else
				nDam1 = 1.03 ^ Atk:GetSkillLv(378);
			end
			if targetlist[j]:IsParnter() then
				local pBatMob = targetlist[j]:ToBatMob();
				if pBatMob ~= nil then
					for ii=0, battle:GetActorCount() - 1 do
						local pActor = battle:GetActor(ii);
						if pActor:IsPlayer() then
							local pBatChar = pActor:ToBatChar();
							if pBatChar ~= nil and pBatChar:GetChar_id() == pBatMob:GetOwner_id() then
								PartnerOwner = pActor;
								nDam = nDam1 * 0.99 ^ PartnerOwner:GetOwner():GetSkillLv(385);
							end
						end
					end
				end
			else
				nDam = nDam1 * 0.99 ^ targetlist[j]:GetSkillLv(379);
			end
			
			if Atk:IsBuffExist(2027) then
				RateDam =  math.random(80, 120) / 100;
			end
			if Atk:IsBuffExist(2060) then
				RateDam =  math.random(100, 120) / 100;
			end
			
			local FinalDam = 1.35 * (Atk:GetPOW() - targetlist[j]:GetPOW() + (3.8 - 0.2 * count) * lv) * RateDam;
			
			if math.random(1, 100) <= CritRate then
				FinalDam = FinalDam * 2;
				CritHit[j] = 1;
			end
			
			if FinalDam <= 10 then
				FinalDam = math.random(1, 10);
			end
			
			targetlist[j]:ChangeHp(-1 * FinalDam);
			
			if CritHit[j] == 1 then
				targetlist[j]:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
			end
			
			local effectSPD = (1 - 0.05) * targetlist[j]:GetSPD();
			local HitRate = math.random(1, 100);
			
			if effectSPD <= 1 then
				effectSPD = 1;
			end
			
			if HitRate < 100 and targetlist[j]:IsBuffExist(1448) ~= true and targetlist[j]:GetHP() ~= 0 then
				targetlist[j]:AddBuff(1448, lv, effectSPD, 0, 2, 100);
			end
			
			battle:PushReactionActor(targetlist[j]);
			j = j + 1;
		end
	else		
		--local FinalDam = {0, 0};	
		local CritHit1 = {};
		while targetlist[j] ~= nil do
			
			i = 0;
			while i < lianji do
				
				local nDam = 1;		--是CBatActor类型 
				local nDam1 = 1;
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
									nDam1 = 1.03 ^ ZPartnerOwner:GetOwner():GetSkillLv(384);
								end
							end
						end
					end
				else
					nDam1 = 1.03 ^ Atk:GetSkillLv(378);
				end
				if targetlist[j]:IsParnter() then
					local pBatMob = targetlist[j]:ToBatMob();
					if pBatMob ~= nil then
						for ii=0, battle:GetActorCount() - 1 do
							local pActor = battle:GetActor(ii);
							if pActor:IsPlayer() then
								local pBatChar = pActor:ToBatChar();
								if pBatChar ~= nil and pBatChar:GetChar_id() == pBatMob:GetOwner_id() then
									PartnerOwner = pActor;
									nDam = nDam1 * 0.99 ^ PartnerOwner:GetOwner():GetSkillLv(385);
								end
							end
						end
					end
				else
					nDam = nDam1 * 0.99 ^ targetlist[j]:GetSkillLv(379);
				end
				
				if Atk:IsBuffExist(2027) then
					RateDam =  math.random(80, 120) / 100;
				end
				if Atk:IsBuffExist(2060) then
					RateDam =  math.random(100, 120) / 100;
				end
				
				local FinalDam = 1.35 * ((Atk:GetPOW() - targetlist[j]:GetPOW() + (3.8 - 0.2 * count) * lv + 300) * nDam - 150) * RateDam * 0.79;
				
				CritHit1[j] = 0;
				if math.random(1, 100) <= CritRate then
					FinalDam = FinalDam * 2;
					CritHit1[j] = 1;
				end
				
				if FinalDam <= 10 then
					FinalDam = math.random(1, 10);
				end	
				
				if CritHit1[j] == 1 then
					targetlist[j]:AddAttriChangeToLst(-1 * FinalDam, 0, 0, 0, LuaI.BATCMD_CRIT_HIT);
				else
					targetlist[j]:AddAttriChangeToLst(-1 * FinalDam, 0, 0, 0, LuaI.BATCMD_SKILL_HIT);
				end
				
				local effectSPD = (1 - 0.05) * targetlist[j]:GetSPD();
				local HitRate = math.random(1, 100);
				
				if effectSPD <= 1 then
					effectSPD = 1;
				end
				
				if HitRate < 100 and targetlist[j]:IsBuffExist(1448) ~= true and targetlist[j]:GetHP() ~= 0 then
					targetlist[j]:AddBuff(1448, lv, effectSPD, 0, 2, 100);
				end
				
				i = i + 1;
			end
			
			battle:PushReactionActor(targetlist[j]);
			j = j + 1;	
		end
	end
end

