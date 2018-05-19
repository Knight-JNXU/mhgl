--MOB蝎子毒

function skill6512CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill6512Use(Atk, Target, battle, skillLv)
	local targetlist = {};
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local BuffRate = 101;
	local BuffRateBase = 62;
	local maxTargetCount = 1;
	

	
	if skill == 1 then 
		BuffRateBase = 100;
	end
	
	local bufflist = {1112, 2024, 2057, 2020, 2023, 2045, 2053, 2056};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, HPUpSort, bufflist, 8);
	
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
		
		
		if math.random(1, 100) > BuffRate then
			targetlist[i]:MissSkill();
			battle:PushReactionActor(targetlist[i]);
			do return end
		end
		
		local turn = 150
		
		
		local result = skillCanHit(Atk, targetlist[i]);	
		if result == 2 then
			targetlist[i]:MissSkill();
		else	
			targetlist[i]:AddBuff(1531, (Lv + 10), 0, 0, turn, 100);
		end
		battle:PushReactionActor(targetlist[i]);
	    i = i + 1;
	end
end

