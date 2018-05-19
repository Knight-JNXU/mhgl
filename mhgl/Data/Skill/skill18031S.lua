--五雷咒

function skill18031CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需先天无极功修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill18031Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	
	local maxTargetCount = math.floor((skillLv - 25) / 25) + 2;
	
	if maxTargetCount > 1 then
		maxTargetCount = 1;
	elseif maxTargetCount < 1 then
		maxTargetCount = 1;
	end

	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	local MSSLv = math.floor((skillLv - 25)/ 25) * 25 + 25;
	local consumeSp = ((1.2 * MSSLv + 10) / maxTargetCount) * count ;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展五雷咒", consumeSp);
	
	if Atk:GetSP() < consumeSp then
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
		
		local weaponDam = 0.25 * Atk:GetWeaponATK();
		local skillDam = (Atk:GetSkillLv(2600) + Atk:GetSkillLv(2610) + Atk:GetSkillLv(2620) 
						+ Atk:GetSkillLv(2630) + Atk:GetSkillLv(2640)) * 0.48 + (Atk:GetSkillLv(2600) ^ 2 
						+ Atk:GetSkillLv(2610) ^ 2 + Atk:GetSkillLv(2620) ^ 2 + Atk:GetSkillLv(2630) ^ 2 
						+ Atk:GetSkillLv(2640) ^ 2 ) * 0.0016 + 20 ;
		local hpChange = ((Atk:GetPOW() + weaponDam - (1 - math.floor(Atk:GetSkillLv(2650) /5)/100) * targetlist[i]:GetPOW()) 
						* 0.8 + 2 * skillLv + 0.1 * skillDam + 280) * nDam - 250;
		if (targetlist[i]:IsBuffExist(2020) or targetlist[i]:IsBuffExist(2021) or targetlist[i]:IsBuffExist(2053) 
			or targetlist[i]:IsBuffExist(2054)) == true then 
			hpChange = 2 * hpChange;
		end
		
		if hpChange <= 1 then
			hpChange = 1;
		end
		if Atk:GetSkillLv(394) > 0 then
		   hpChange = hpChange + (hpChange * Atk:GetSkillLv(394) * 0.03)
		end
		targetlist[i]:ChangeHp(-1 * hpChange);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end
