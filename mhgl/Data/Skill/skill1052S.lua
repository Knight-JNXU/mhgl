--白虹贯日式

function skill1052CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需天罡正气修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
	
end

function skill1052Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local maxTargetCount = 2;
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, RandomSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	local consumeSp = (0.4 * skillLv + 5) * count;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展白虹贯日式",consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
		
		local nDam = 1;		--是CBatActor类型 
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
							nDam = 1.02 ^ Atk:GetSkillLv(378) * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(385);
						end
					end
				end
			end
		else
			nDam = 1.02 ^ Atk:GetSkillLv(378) * 0.98 ^ targetlist[i]:GetSkillLv(379);
		end
		
		local skillDam = (Atk:GetSkillLv(1000) + Atk:GetSkillLv(1010) + Atk:GetSkillLv(1020) 
						+ Atk:GetSkillLv(1030) + Atk:GetSkillLv(1040)) * 0.48 + (Atk:GetSkillLv(1000) ^ 2 
						+ Atk:GetSkillLv(1010) ^ 2 + Atk:GetSkillLv(1020) ^ 2 + Atk:GetSkillLv(1030) ^ 2 
						+ Atk:GetSkillLv(1040) ^ 2 ) * 0.0016 + 20 ;
		local weaponDam = Atk:GetWeaponATK();
		local hpChange = (0.6 * (Atk:GetPOW() - 0.5 * targetlist[i]:GetPOW()) + 0.25 * weaponDam + (1.6 - 0.2 * count) 
						* skillLv + 0.1 * skillDam + 270)  * nDam - 250;
		if hpChange <= 10 then
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

