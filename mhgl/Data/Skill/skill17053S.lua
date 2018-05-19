--似玉生香

function skill17053CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需倾国倾城修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill17053Use(Atk, Target, battle, skillLv)

local targetlist = {};
	
	local maxTargetCount = math.floor((skillLv - 35) / 100) + 2;
	
	if maxTargetCount > 2 then
		maxTargetCount = 2;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	 if Atk:IsBuffExist(8300) then
			maxTargetCount = 2;
	end
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	local MSSLv = math.floor((skillLv - 35)/ 25) * 25 + 35;
	local consumeSp = ((1.2 * MSSLv + 10) / maxTargetCount) * count ;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展", consumeSp);
	
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
		
		local skillDam = (Atk:GetSkillLv(1400) + Atk:GetSkillLv(1410) + Atk:GetSkillLv(1420) 
						+ Atk:GetSkillLv(1430) + Atk:GetSkillLv(1440)) * 0.0 + (Atk:GetSkillLv(1400) ^ 0 
						+ Atk:GetSkillLv(1410) ^ 0 + Atk:GetSkillLv(1420) ^ 0 + Atk:GetSkillLv(1430) ^ 0 
						+ Atk:GetSkillLv(1440) ^ 0 ) * 0.0001 + 0 ;
		local weaponDam = Atk:GetWeaponATK();
		local hpChange = ((Atk:GetPOW() - targetlist[i]:GetPOW() + 0.0 * weaponDam) * 0.0 + 0.0 
							* skillLv + 0.0 * skillDam + 0)  * nDam - 0;	
		if hpChange <= 10 then
			hpChange = math.random(1, 10);
		end
		
		local result = skillCanHit(Atk, targetlist[i]);
		if result == 2 then
			targetlist[i]:MissSkill();
		else
			targetlist[i]:ChangeHp(-1 * hpChange);
		end
		
		if not targetlist[i]:IsBuffExist(1109) then 
			local turn = 1 + math.floor((skillLv - targetlist[i]:GetLevel()) / 50);
			if turn < 2 then
				turn = 2;
			elseif turn > 2 then
				turn = 2;
			end		
			local DefEffect = (1 - 0.075) * targetlist[i]:GetDEF();
			local Rate = 60;
			if math.random(1, 100) < Rate then
				targetlist[i]:AddBuff(1109, skillLv, DefEffect, 0, turn, 100);
			end
		end
		
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end


