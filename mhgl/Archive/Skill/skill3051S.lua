--摧心化毒掌

function skill3051CanUse(Atk, skillLv, reqSkillLv, reqCharLv)	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需乾天罡气修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill3051Use(Atk, Target, battle, skillLv)

	local targetlist = {};
	local maxTargetCount = 0;
	maxTargetCount = math.floor((skillLv - 20) / 20) + 3;
	if maxTargetCount > 6 then
		maxTargetCount = 6;
	elseif maxTargetCount < 3 then
		maxTargetCount = 3;
	end
	local consumeSp = 0.8 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展摧心化毒掌", consumeSp);
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, RandomSort, bufflist, 0);
	
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
		
		local BuffRate = 0;
		local LvDif = skillLv - targetlist[i]:GetLevel();
		if LvDif > 0 then
			BuffRate = (52 + 2 * LvDif ^ 0.5) * nDam;
		else
			BuffRate = (52 + 2.2 * LvDif) * nDam;
		end
		if BuffRate < 1 then
			BuffRate = 1;
		elseif BuffRate > 95 then
			BuffRate = 95;
		end
		
		if math.random(1, 100) > BuffRate then
			targetlist[i]:MissSkill();
		else
			local turn = 3 + math.floor((skillLv - targetlist[i]:GetLevel()) / 10);
			if turn < 1 then
				turn = 1;
			elseif turn > 5 then
				turn = 5;
			end
			
			local hpChange = targetlist[i]:GetHP() * 0.1;
			local spChange = targetlist[i]:GetSP() * 0.1;
			local dulv = 10 * skillLv;	
			targetlist[i]:ChangeHp(-1 * hpChange);
			targetlist[i]:ChangeSp(-1 * spChange);
			targetlist[i]:AddBuff(1001, skillLv, 0, 0, turn, 100);
		end
		
		battle:PushReactionActor(targetlist[i]);	
		i = i + 1;	
	end
	local skillDam = (Atk:GetSkillLv(3000) + Atk:GetSkillLv(3010) + Atk:GetSkillLv(3020) 
						+ Atk:GetSkillLv(3030) + Atk:GetSkillLv(3040)) * 0.48 + (Atk:GetSkillLv(3000) ^ 2 
						+ Atk:GetSkillLv(3010) ^ 2 + Atk:GetSkillLv(3020) ^ 2 + Atk:GetSkillLv(3030) ^ 2 
						+ Atk:GetSkillLv(3040) ^ 2 ) * 0.0016 + 20 ;
	local rec = 2.2 * skillLv + 0.5 * skillDam + 0.01 * Atk:GetMaxHP() + 0.1 * (Atk:GetPOW() + Atk:GetWeaponATK());
	Atk:ChangeHp(rec)
end

