--MOB万胜连环

function skill5024CanUse(Atk, skillLv, reqSkillLv, reqCharLv)	
end

function skill5024Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local nDamskill1 = 0;
	local targetlist = {};
	local maxTargetCount = math.floor((Lv + 10 - 30) / 20) + 3;
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
	
	if maxTargetCount > 8 then
		maxTargetCount = 8;
	elseif maxTargetCount < 3 then
		maxTargetCount = 3;
	end
	
	if skill == 1 then
	    maxTargetCount = math.floor((Lv + 10 - 30) / 20) + 4;
	    if maxTargetCount > 9 then
		    maxTargetCount = 9;
	    elseif maxTargetCount < 4 then
		    maxTargetCount = 4;
	    end
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, RandomSort, bufflist, 0);

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
		
		local hpChange = ((Atk:GetPOW() - targetlist[i]:GetPOW()) * 0.8 + 2 * (Lv + 10) + 300 + nDamsBonus1 * Lv)  * nDam - 250;
		
		if hpChange < 1 then
			hpChange = math.random(1, 10);
		end
		local result = skillCanHit(Atk, targetlist[i]);
		if result == 2 then
			targetlist[i]:MissSkill();
		else
			targetlist[i]:ChangeHp(-1 * hpChange);
		end
		
		battle:PushReactionActor(targetlist[i]);
		
		if targetlist[i]:GetHP() == 0 then
			i = i + 1;
		else
			break
		end	
	end	
end
