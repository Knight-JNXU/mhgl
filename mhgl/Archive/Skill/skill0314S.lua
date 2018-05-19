--离火燎天

function skill0314CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill0314Use(Atk, Target, battle, skillLv)
	
	local lv = Atk:GetLevel();
	local targetlist = {};
	
	local maxTargetCount = math.floor( lv / 30) + 1;
	if maxTargetCount > 3 then
		maxTargetCount = 3;
	elseif maxTargetCount < 1 then
		maxTargetCount = 1;
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local consumeSp = 30 * count;
	
	local Msg = string.format("\#W[战斗讯息]：内力不足\#G%d\#W，无法施展离火燎天", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local RateDam = 1;
	local CritHit = {};
	local CritRate = 0;
	if Atk:IsBuffExist(2026) then
		CritRate = 10;
	end
	if Atk:IsBuffExist(2059) then
		CritRate = 20;
	end
	local lianji = 1;
	local Rate = 0;
	if Atk:IsBuffExist(2025) then
		Rate = 15;
	end
	if Atk:IsBuffExist(2058) then
		Rate = 25;
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
								nDam1 = 1.02 ^ ZPartnerOwner:GetOwner():GetSkillLv(384);
							end
						end
					end
				end
			else
				nDam1 = 1.02 ^ Atk:GetSkillLv(378);
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
								nDam = nDam1 * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(385);
							end
						end
					end
				end
			else
				nDam = nDam1 * 0.98 ^ targetlist[j]:GetSkillLv(379);
			end
			
			if Atk:IsBuffExist(2027) then
				RateDam =  math.random(80, 120) / 100;
			end
			if Atk:IsBuffExist(2060) then
				RateDam =  math.random(80, 130) / 100;
			end
			
			local FinalDam = ((Atk:GetPOW() - targetlist[j]:GetPOW() + (3.0 - 0.2 * count) * lv + 250) * nDam - 250) * RateDam;
			
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
			
			local effectPOW = (1 - 0.05) * targetlist[j]:GetPOW();
			local HitRate = math.random(1, 100);
			
			if effectPOW <= 1 then
				effectPOW = 1;
			end
			
			if HitRate < 20 and targetlist[j]:IsBuffExist(1407) ~= true and targetlist[j]:GetHP() ~= 0 then
				targetlist[j]:AddBuff(1407, lv, effectPOW, 0, 3, 100);
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
									nDam1 = 1.02 ^ ZPartnerOwner:GetOwner():GetSkillLv(384);
								end
							end
						end
					end
				else
					nDam1 = 1.02 ^ Atk:GetSkillLv(378);
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
									nDam = nDam1 * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(385);
								end
							end
						end
					end
				else
					nDam = nDam1 * 0.98 ^ targetlist[j]:GetSkillLv(379);
				end
				
				if Atk:IsBuffExist(2027) then
					RateDam =  math.random(80, 120) / 100;
				end
				if Atk:IsBuffExist(2060) then
					RateDam =  math.random(80, 130) / 100;
				end
				
				local FinalDam = ((Atk:GetPOW() - targetlist[j]:GetPOW() + (3.0 - 0.2 * count) * lv + 250) * nDam - 250) * RateDam * 0.75;
				
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
				
				local effectPOW = (1 - 0.05) * targetlist[j]:GetPOW();
				local HitRate = math.random(1, 100);
				
				if effectPOW <= 1 then
					effectPOW = 1;
				end
				
				if HitRate < 8 and targetlist[j]:IsBuffExist(1407) ~= true and targetlist[j]:GetHP() ~= 0 then
					targetlist[j]:AddBuff(1407, lv, effectPOW, 0, 3, 100);
				end
				
				i = i + 1;
			end
			
			battle:PushReactionActor(targetlist[j]);
			j = j + 1;	
		end
	end
end
	


