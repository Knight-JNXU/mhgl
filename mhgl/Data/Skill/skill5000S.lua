--MOB万马奔腾

function skill5000CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5000Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local Lv = Atk:GetLevel();
	local maxTargetCount = math.floor((Lv - 25)/ 20) + 2;
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
	
	if maxTargetCount > 7 then
		maxTargetCount = 7;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end

	if skill == 1 then
		maxTargetCount = math.floor((Lv - 25)/ 20) + 3;
	    if maxTargetCount > 8 then
		    maxTargetCount = 8;
	    elseif maxTargetCount < 3 then
		    maxTargetCount = 3;
	    end
	end
	
	--注意，获取mob_id前一定要先判断是否为mob
	if Atk:GetMob_id() == 10420 then
		maxTargetCount = 3;
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end	
	
	local i = 0;
	while targetlist[i] ~= nil do
		--local nDam = 1.02 ^ (math.floor((Lv+100)/173) * math.floor((Lv-73)/3));
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
		
		local hpChange = (Atk:GetPOW() - targetlist[i]:GetPOW() + (2.1 - 0.1 * count) * (Lv + 10) + 270 + nDamsBonus1 * Lv)  * nDam - 250;
		local Rate = 10 + math.floor(Lv / 10);
		if Rate < 10 then
			Rate = 10;
		elseif Rate > 80  then
			Rate = 80;
		end
		
		if math.random(1, 100) <= Rate then
			hpChange = (Atk:GetPOW() - 0.9 * targetlist[i]:GetPOW() + (2.1 - 0.1 * count) * (Lv + 10) + 270 + nDamsBonus1 * Lv)  * nDam - 250;
		end
		if  hpChange < 1 then
			hpChange = math.random(1, 10);
		end
		
		local result = skillCanHit(Atk, targetlist[i]);
		if result == 2 then
			targetlist[i]:MissSkill();
		else
			targetlist[i]:ChangeHp(-1 * hpChange);
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

