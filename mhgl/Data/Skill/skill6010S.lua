--MOB逼魂指

function skill6010CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill6010Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local maxTargetCount = math.floor( Lv / 30) + 1;
	if maxTargetCount > 3 then
		maxTargetCount = 3;
	elseif maxTargetCount < 1 then
		maxTargetCount = 1;
	end
	
	local targetlist = {};
	local skill = Atk:GetSkillLv(5300);
	local BuffRate = 0;
	local BuffRateBase = 64;
	
	local bufflist = {1101,1104,1109};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 3);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	if skill == 1 then
		BuffRateBase = 85;
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
		
		local LvDif = Lv + 10 - targetlist[j]:GetLevel();
		if LvDif > 0 then
			BuffRate = (BuffRateBase + 2 * LvDif ^ 0.5) * nDam;
		else
			BuffRate = (BuffRateBase + 2.2 * LvDif) * nDam;
		end
		if targetlist[j]:IsBuffExist(1807) then
			BuffRate = BuffRate * 0.9;
		end
		if BuffRate < 1 then
			BuffRate = 1;
		elseif BuffRate > 100 then
			BuffRate = 100;
		end
		
		if targetlist[j]:IsMob() then
			if targetlist[j]:GetMob_id() == 10493 then
				BuffRate = 100;
			end
		end
		
		
		if math.random(1, 100) > BuffRate then
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
			targetlist[j]:AddBuff(1109, (Lv + 10), 0, 0, turn, 100);
		end
		battle:PushReactionActor(targetlist[j]);
		j = j + 1;
	end
end

