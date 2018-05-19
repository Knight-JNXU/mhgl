--MOB劈空掌

function skill5042CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5042Use(Atk, Target, battle, skillLv)
	local targetlist = {};	
	local Lv = Atk:GetLevel();
	local maxTargetCount = math.floor((Lv - 30) / 25) + 2;
	local skill = Atk:GetSkillLv(5300);
	local nDamskill1 = 0;
	local DamBonus1 = {0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9,9.5,10,11,12,13,14,15,16,17,18,19,20};
	local nDamsBonus1 = 0;
	local j = 1;
	while j <= 30 do
	    nDamskill = Atk:GetSkillLv(5430 + j - 1);
		if nDamskill == 1 then 
            nDamsBonus1 = nDamsBonus1 + DamBonus1[j];
		end
		j = j + 1;
	end	
	
	if maxTargetCount > 5 then
		maxTargetCount = 5;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	if skill == 1 then
	    maxTargetCount = math.floor((Lv - 30) / 25) + 3;
	    if maxTargetCount > 6 then
		    maxTargetCount = 6;
	    elseif maxTargetCount < 3 then
		    maxTargetCount = 3;
	    end
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
		if Target:IsParnter() then
			local pBatMob = Target:ToBatMob();
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
			nDam =0.98 ^ Target:GetSkillLv(379);
		end
		
		local hpChange = ((Atk:GetPOW() - targetlist[i]:GetPOW()) * 1 + 1.8 * (Lv + 10) + 260 + 1.2 * nDamsBonus1 * Lv) * nDam - 250;	
		
		if hpChange < 1 then
			hpChange = math.random(1, 10);
		end
		local result = skillCanHit(Atk, targetlist[i]);
		if result == 2 then
			targetlist[i]:MissSkill();
		else
			targetlist[i]:ChangeHp(-1 * hpChange);
		end
		
		if not targetlist[i]:IsBuffExist(1409) then 
			local turn = 3 + math.floor((Lv + 10 - targetlist[i]:GetLevel()) / 10);
			if turn < 1 then
				turn = 1;
			elseif turn > 5 then
				turn = 5;
			end
			
			local PowEffect = (1 - 0.05) * targetlist[i]:GetPOW();
			local Rate = 75;
			if skill == 1 then
			    Rate = 100;
			end
		    if math.random(1, 100) < Rate then
			    targetlist[i]:AddBuff(1409, (Lv + 10), PowEffect, 0, turn, 100);
			end	
		end
	    battle:PushReactionActor(targetlist[i]);
        i = i + 1;		
	end
end
