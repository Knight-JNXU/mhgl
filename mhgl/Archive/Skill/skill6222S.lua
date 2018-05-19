--MOB气撼九重天

function skill6222CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill6222Use(Atk, Target, battle, skillLv)
	
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local hitRateBase = 75;
	local maxTargetCount = 5;
	local bufflist = {1113, 1114};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, RandomSort, bufflist, 2);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local i = 0;
	while targetlist[i] ~= nil do
		
		local lvdiff = Lv +10 - targetlist[i]:GetLevel();
		local nDam = 1;
		local PartnerOwner;			--是CBatActor类型 
		if targetlist[i]:IsParnter() then
			local pBatMob = targetlist[i]:ToBatMob();
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
			nDam =0.98 ^ targetlist[i]:GetSkillLv(379);
		end
		
		if lvdiff > 0 then
			hitRate = (hitRateBase + 2 * lvdiff ^ 0.5) * nDam;
		else
			hitRate = (hitRateBase + 2.2 * lvdiff) * nDam;
		end
		
		if targetlist[i]:IsBuffExist(1807) then
			hitRate = hitRate * 0.9;
		end
		
		if hitRate < 1 then
			hitRate = 1;
		elseif hitRate > 100 then
			hitRate = 100;
		end
		
		
		
		
		if math.random(1, 100) > hitRate then
			targetlist[i]:MissSkill();
			battle:PushReactionActor(targetlist[i]);
			--do return end
		end
		
		local turn = 0;
		turn = 1 + math.floor((Lv + 10) / 50) + math.floor((Lv + 10 - targetlist[i]:GetLevel()) / 10);
		if turn < 1 then
			turn = 1;
		elseif turn > 5 then
			turn = 5;
		end
		
		local result = skillCanHit(Atk, targetlist[i]);	
		if result == 2 then
			targetlist[i]:MissSkill();
		else	
			if math.random(1, 100) <= 35 then
				targetlist[i]:AddBuff(1114, (Lv + 10), 0, 0, turn, 100); 
			else
				targetlist[i]:AddBuff(1113, (Lv + 10), 0, 0, turn, 100); 
			end
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end 