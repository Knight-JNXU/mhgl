--MOB破玉啸

function skill5006CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5006Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local maxTargetCount = 3;
	local nDamskill1 = 0;
	local DamBonus1 = {0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9,9.5,10,11,12,13,14,15,16,17,18,19,20};
	local nDamsBonus1 = 0;
	local j = 1;
	while j <= 30 do
	    nDamskill1 = Atk:GetSkillLv(5430 + j - 1);
		if nDamskill1 == 1 then 
            nDamsBonus1 = nDamsBonus1 + DamBonus1[j];
		end
		j = j + 1;
	end	
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end	
	
	local i = 0;
	while targetlist[i] ~= nil do
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
		
		local hpChange = (((Atk:GetPOW() - targetlist[i]:GetPOW()) * 1.2 + 2.5 * (Lv + 10) + 280 + 1.2 * nDamsBonus1 * Lv) * nDam - 250) * 0.75;
		
		if hpChange < 1 then
			hpChange = math.random(1, 10);
		end
		local result = skillCanHit(Atk, targetlist[i]);
		if result == 2 then
			targetlist[i]:MissSkill();
		else
			targetlist[i]:ChangeHp(-1 * hpChange);
		end
		
		local HitRate = 0;
		local HitRateBase = 24;
		
		if skill == 1 then
			HitRateBase = 50;
		end
		
		if (Lv + 10) > targetlist[i]:GetLevel() then
			HitRate = (HitRateBase + 2 * (Lv + 10- targetlist[i]:GetLevel()) ^ 0.5) * nDam;
		else
			HitRate = (HitRateBase + 2.2 * (Lv + 10 - targetlist[i]:GetLevel())) * nDam;
		end
		if HitRate < 10 then
			HitRate = 10;
		elseif HitRate > 100 then
			HitRate = 100;
		end
		
		if targetlist[i]:IsBuffExist(1807) then
			HitRate = HitRate * 0.9;
		end
		
		if math.random(1, 100) <= HitRate then
			if targetlist[i]:IsBuffExist(1106) == false and targetlist[i]:GetHP() ~= 0 then
				local turn = 2;
				targetlist[i]:AddBuff(1106, (Lv + 10), 0, 0, turn, 100);
			end
		end 
		
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end


