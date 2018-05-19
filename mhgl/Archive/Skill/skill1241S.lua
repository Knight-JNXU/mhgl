--万胜连环

function skill1241CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需连环神功修炼到\#P%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#P%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill1241Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local maxTargetCount = math.floor((skillLv - 30) / 20) + 3;
	
	if maxTargetCount > 6 then
		maxTargetCount = 6;
	elseif maxTargetCount < 3 then
		maxTargetCount = 3;
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, RandomSort, bufflist, 0);
	
	local MSSLv = math.floor((skillLv - 30)/ 20) * 20 + 30;
	local consumeSp = (1.6 * MSSLv + 10) / maxTargetCount;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#P%d\#W，无法施展万胜连环", consumeSp);
	
	local KillFlag = 0;
	local i = 0;
	while targetlist[i] ~= nil do
		if  Atk:GetSP() < consumeSp then
			Atk:SkillFail(Msg);
			break
		end
		
		Atk:ChangeSp(-1 * consumeSp, false);
		
		local Thp = targetlist[i]:GetHP();
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
		local skillDam = (Atk:GetSkillLv(1200) + Atk:GetSkillLv(1210) + Atk:GetSkillLv(1220) 
						+ Atk:GetSkillLv(1230) + Atk:GetSkillLv(1240)) * 0.48 + (Atk:GetSkillLv(1200) ^ 2 
						+ Atk:GetSkillLv(1210) ^ 2 + Atk:GetSkillLv(1220) ^ 2 + Atk:GetSkillLv(1230) ^ 2 
						+ Atk:GetSkillLv(1240) ^ 2 ) * 0.0016 + 20 ;
		local weaponDam = Atk:GetWeaponATK();
		local hpChange = ((Atk:GetPOW() - targetlist[i]:GetPOW() + 0.25 * weaponDam) * 0.8 + 2
						* skillLv + 0.1 * skillDam + 300)  * nDam - 250;
		if hpChange <= 10 then
			hpChange = math.random(1, 10);
		end
		
		battle:PushReactionActor(targetlist[i]);
		
		local reDam = targetlist[i]:GetFinalValue(-hpChange, Atk, Atk:GetAction(), 1);
		
		local result = skillCanHit(Atk, targetlist[i]);
		if result == 2 then
			targetlist[i]:MissSkill();
		else
			targetlist[i]:ChangeHp(-1 * hpChange);
		end
		
		if -reDam > Thp then
			i = i + 1;
		else
			break
		end	
	end	
end
