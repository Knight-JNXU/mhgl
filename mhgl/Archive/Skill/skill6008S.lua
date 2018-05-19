--MOB子母锁喉针

function skill6008CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill6008Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local maxTargetCount = math.floor( Lv / 30) + 1;
	if maxTargetCount > 3 then
		maxTargetCount = 3;
	elseif maxTargetCount < 1 then
		maxTargetCount = 1;
	end
	
	local targetlist = {};
	
	local skill = Atk:GetSkillLv(5300);
	local HitRate = 0;
	local HitRateBase = 68;
	
	if skill == 1 then
		HitRateBase = 95;
	end
	
	local bufflist = {1101,1104,1109};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 3);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local nDam = 1;
	local PartnerOwner;			--是CBatActor类型 
	local j = 0;
	while targetlist[j] ~= nil do
		if targetlist[j]:IsParnter() then
			local pBatMob = targetlist[j]:ToBatMob();
			if pBatMob ~= nil then
				for ii=0, battle:GetActorCount() - 1 do
					local pActor = battle:GetActor(ii);
					if pActor:IsPlayer() then
						local pBatChar = pActor:ToBatChar();
						if pBatChar ~= nil and pBatChar:GetChar_id() == pBatMob:GetOwner_id() then
							PartnerOwner = pActor;
							nDam = 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(385);
						end
					end
				end
			end
		else
			nDam =0.98 ^ targetlist[j]:GetSkillLv(379);
		end
		
		if (Lv + 10) > targetlist[j]:GetLevel() then
			HitRate = (HitRateBase + 2 * ((Lv + 10) - targetlist[j]:GetLevel()) ^ 0.5) * nDam;
		else
			HitRate = (HitRateBase + 2.2 * ((Lv + 10) - targetlist[j]:GetLevel())) * nDam;
		end
		if targetlist[j]:IsBuffExist(1807) then
			HitRate = HitRate * 0.9;
		end
		if HitRate < 1 then
			HitRate = 1;
		elseif HitRate > 100 then
			HitRate = 100;
		end	
		
		if math.random(1, 100) > HitRate then
			targetlist[j]:MissSkill();
			battle:PushReactionActor(targetlist[j]);
			do return end
		end
		
		local turn = 0;
		turn = 1 + math.floor((Lv + 10) / 50) + math.floor((Lv + 10 - targetlist[j]:GetLevel()) / 10);
		if turn < 1 then
			turn = 1;
		elseif turn > 5 then
			turn = 5;
		end
		
		local result = skillCanHit(Atk, targetlist[j]);
		if result == 2 then
			targetlist[j]:MissSkill();
		else
			targetlist[j]:AddBuff(1101, (Lv + 10), 0, 0, turn, 100);
		end
		battle:PushReactionActor(targetlist[j]);
		j = j + 1 ;
	end
end

