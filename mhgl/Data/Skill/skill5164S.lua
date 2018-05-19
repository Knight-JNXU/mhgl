--MOB大手印

function skill5164CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5164Use(Atk, Target, battle, skillLv)
	local targetlist = {};
	local maxTargetCount = 1;
	local Lv = Atk:GetLevel();
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
	
	if skill == 1 then
	    maxTargetCount = math.floor(Lv / 60) + 1;
	    if maxTargetCount > 3 then
		    maxTargetCount = 3;
	    elseif maxTargetCount < 1 then
		    maxTargetCount = 1;
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
		
		local hpChange = ((Atk:GetPOW() - (1 - math.floor((Lv + 10) / 500)) * targetlist[i]:GetPOW()) * 0.8 + 2 * (Lv + 10) + 280 + nDamsBonus1 * Lv) * nDam - 250;
		if (targetlist[i]:IsBuffExist(2020) or targetlist[i]:IsBuffExist(2021) or targetlist[i]:IsBuffExist(2053) 
			or targetlist[i]:IsBuffExist(2054)) == true then 
			hpChange = 2 * hpChange;
		end
		
		if hpChange < 1 then
			hpChange = math.random(1, 10);
		end
		targetlist[i]:ChangeHp(-1 * hpChange);
		battle:PushReactionActor(targetlist[i]);	
		 i = i + 1;
	end
end
