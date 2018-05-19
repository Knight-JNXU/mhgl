--少年叶孤城天外飞仙

function skill0631CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill0631Use(Atk, Target, battle, skillLv)
	
	local lv = Atk:GetLevel();
	local targetlist = {};
	local skill = Atk:GetSkillLv(5300);
	local nDamskill1 = 0;
	local DamBonus1 = {0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9,9.5,10,11,12,13,14,15,16,17,18,19,20};
	local nDamsBonus1 = 0;
	local i = 1;
	while i <= 30 do
	    nDamskill1 = Atk:GetSkillLv(5430 + i - 1);
		if nDamskill1 == 1 then 
            nDamsBonus1 = nDamsBonus1 + DamBonus1[i];
		end
		i = i + 1;
	end	

	local maxTargetCount = math.floor(lv / 30) + 1;
	if maxTargetCount > 3 then
		maxTargetCount = 3;
	elseif maxTargetCount < 1 then
		maxTargetCount = 1;
	end
	
	if skill == 1 then
	    maxTargetCount = math.floor(lv / 30) + 2;
	    if maxTargetCount > 5 then
		    maxTargetCount = 5;
	    elseif maxTargetCount < 2 then
		    maxTargetCount = 2;
	    end
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local consumeSp = 30 * count;
	
	local Msg = string.format("\#W[战斗讯息]：内力不足\#G%d\#W，无法施展天外飞仙", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	
	local RateDam = 1;
	local CritHit = 0;
	local CritRate = 0;
	local randomDam = 1.2 - math.random(150, 250) / 1000;
	if Atk:IsBuffExist(2026) then
		CritRate = 10;
	end
	if Atk:IsBuffExist(2059) then
		CritRate = 20;
	end

	local j = 0;	
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
		
		local FinalDam = 1.3 * ((Atk:GetPOW() - targetlist[j]:GetPOW() + (3.4 - 0.3 * count) * lv + nDamsBonus1 * lv + 250) * nDam - 250) * RateDam * randomDam;
		
		if math.random(1, 100) <= CritRate then
			FinalDam = FinalDam * 2;
			CritHit = 1;
		end
		
		if FinalDam <= 1 then
			FinalDam = 1;
		end
		
		targetlist[j]:ChangeHp(-1 * FinalDam);
		
		if CritHit == 1 then
			targetlist[j]:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
		end
		
		if math.random(1,100) <= 5 and targetlist[j]:IsBuffExist(1126) ~= true and targetlist[j]:GetHP() ~= 0 then 
			targetlist[j]:AddBuff(1126, lv, 0, 0, 2, 100);
		end
		
		battle:PushReactionActor(targetlist[j]);
		j = j + 1;
	end
end

