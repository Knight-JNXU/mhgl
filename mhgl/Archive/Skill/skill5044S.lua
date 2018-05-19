--MOB疾光电影

function skill5044CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5044Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local nDamskill1 = 0;
	local targetlist = {};
	local maxTargetCount = math.floor((Lv + 10 - 25) / 25) + 2;
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
	    maxTargetCount = math.floor((Lv - 15)/ 25) + 3;
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
		
		local hpChange = ((Atk:GetPOW() - targetlist[i]:GetPOW()) * 0.8 + (1.7 - 0.1 * count) * (Lv + 10) + 260 + nDamsBonus1 * Lv)  * nDam - 250;
		--[[if LuaI.GetGameTime(0) == 1 then
			hpChange = hpChange * 1.3;
		end]]
		
		if hpChange < 1 then
			hpChange = math.random(1, 10);
		end
		local result = skillCanHit(Atk, targetlist[i]);
		
		if result == 2 then
			targetlist[i]:MissSkill();
		else
			targetlist[i]:ChangeHp(-1 * hpChange);
			targetlist[i]:ChangeMHp(-1 * hpChange / 3);
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

