--MOB天佛伏魔

function skill6515CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill6515Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local lv = Atk:GetLevel();
	local maxTargetCount = 3
	local skill = Atk:GetSkillLv(5300);
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
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, HPUpSort, bufflist, 0);
	
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
		
		local FinalDam = (((Atk:GetPOW() - targetlist[i]:GetPOW()) * 1.1 + 3.4 * lv + nDamsBonus1 * lv + 250) * nDam - 250) ;
		
		if FinalDam <= 10 then
			FinalDam = math.random(1, 10);
		end	
		local result = skillCanHit(Atk, targetlist[i]);
		if result == 2 then
			targetlist[i]:MissSkill();
		else
			targetlist[i]:ChangeHp(-1 * FinalDam);
		end
	
		local HitRate = math.random(1, 100);
		if HitRate < 26 then
			if targetlist[i]:IsBuffExist(1003) ~= true and targetlist[i]:GetHP() ~= 0 then 
				targetlist[i]:AddBuff(1003, lv, 0, 0, 4, 100);
			end
		elseif HitRate < 51 then
			if targetlist[i]:IsBuffExist(1401) ~= true and targetlist[i]:GetHP() ~= 0 then 
				targetlist[i]:AddBuff(1401, lv, 0, 0, 4, 100);
			end
		elseif HitRate < 76 then
			if targetlist[i]:IsBuffExist(1005) ~= true and targetlist[i]:GetHP() ~= 0 then 
				targetlist[i]:AddBuff(1005, lv, 0, 0, 4, 100);
			end
		else
			if targetlist[i]:IsBuffExist(1106) ~= true and targetlist[i]:GetHP() ~= 0 then 
				targetlist[i]:AddBuff(1106, lv, 0, 0, 4, 100);
			end
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end
