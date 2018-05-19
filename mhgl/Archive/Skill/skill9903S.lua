--万马奔腾

function skill9903CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需傲气决修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
	
end

function skill9903Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local maxTargetCount = math.floor((skillLv - 25)/ 20) + 2;
	
	if maxTargetCount > 10 then
		maxTargetCount = 10;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	local MSSLv = math.floor((skillLv - 25)/ 20) * 20 + 25;
	local consumeSp = ((1.5 * MSSLv + 10) / maxTargetCount) * count;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展正气乾坤",consumeSp);
	
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
							nDam = 1.02 ^ Atk:GetSkillLv(384) * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(385);
						end
					end
				end
			end
		else
			nDam = 1.02 ^ Atk:GetSkillLv(384) * 0.98 ^ targetlist[i]:GetSkillLv(379);
		end
		
		local skillDam = (Atk:GetSkillLv(9902) + Atk:GetSkillLv(9902) + Atk:GetSkillLv(9902) 
						+ Atk:GetSkillLv(9902) + Atk:GetSkillLv(9902)) * 0.48 + (Atk:GetSkillLv(9902) ^ 2 
						+ Atk:GetSkillLv(9902) ^ 2 + Atk:GetSkillLv(9902) ^ 2 + Atk:GetSkillLv(9902) ^ 2 
						+ Atk:GetSkillLv(9902) ^ 2 ) * 0.0016 + 20 ;
		local weaponDam = Atk:GetWeaponATK();
		local hpChange = (Atk:GetPOW() - targetlist[i]:GetPOW() + 0.25 * weaponDam + (2.1 - 0.1 * count) 
						* skillLv + 0.1 * skillDam + 270)  * nDam - 250;
		local Rate = 10 + math.floor(Atk:GetSkillLv(1050) / 10);
		if Rate < 10 then
			Rate = 10;
		elseif Rate > 80  then
			Rate = 80;
		end
		
		if math.random(1, 100) <= Rate then
			hpChange = (Atk:GetPOW() - 0.85 * targetlist[i]:GetPOW() + 0.25 * weaponDam + (2.1 - 0.1 * count) 
						* skillLv + 0.1 * skillDam + 270)  * nDam - 250;
		end
		if hpChange <= 10 then
			hpChange = math.random(1, 10);
		end
		
		--if hpChange > targetlist[i]:GetHP() then
		--	hpChange = targetlist[i]:GetHP();
		--end
		
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

