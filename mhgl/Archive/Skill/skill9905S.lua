--鹤翼天翔

function skill9905CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需嗜血功修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill9905Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	
	local maxTargetCount = math.floor((skillLv - 35) / 20) + 2;
	
	if maxTargetCount > 6 then
		maxTargetCount = 6;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local MSSLv = math.floor((skillLv - 35)/ 20) * 20 + 35;
	local consumeSp = ((0.5 * MSSLv + 10) / maxTargetCount) * count;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展寰宇魔气", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
		if targetlist[i]:GetIndex() ~= Atk:GetIndex() then			
			
			local wDam = 1;		--是CBatActor类型 
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
								wDam = 1.02 ^ Atk:GetSkillLv(382) * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(383);
							end
						end
					end
				end
			else
				wDam = 1.02 ^ Atk:GetSkillLv(382) * 0.98 ^ targetlist[i]:GetSkillLv(377);
			end
			local randomDam = 1.2 - math.random(100, 300) / 1000;
			local weaponDam = 0.25 * (Atk:GetHIT() - Atk:GetAGI() * 1.7 - 6);
			local critDam = 1.4;
			local FinalDef = targetlist[i]:GetDEF();
			if 0.8 * Atk:GetATK() > targetlist[i]:GetDEF() then
				if math.random(1, 100) <= 5 then
					FinalDef = targetlist[i]:GetDEF() / 2;
				end
			end
			
			local FinalDam = 0;
			local CritHit = 0;
			local CritRate =  math.floor(Atk:GetSkillLv(9905) / 10) + 2;
			if math.random(1,100) <= CritRate then
				FinalDam = ((1.45 * Atk:GetATK() - 0.8 * FinalDef + weaponDam + 250) * wDam - 250) * randomDam * critDam;
				CritHit = 1;
			else
				FinalDam = ((1.45 * Atk:GetATK() - 0.85 * FinalDef + weaponDam + 250) * wDam - 250) * randomDam;
			end
			
			
			if targetlist[i]:GetCommand() == LuaI.BATCMD_DEFEND then
				FinalDam = FinalDam / 2;
				if  FinalDam <= 10 then
					FinalDam = math.random(1, 10);
				end
				
				local result = skillCanHit(Atk,targetlist[i]);
				if result == 2 then
					targetlist[i]:MissSkill();
				else
					--targetlist[i]:ChangeHp(-1 * FinalDam);
					if CritHit == 1 then
						targetlist[i]:AddAttriChangeToLst(-1 * FinalDam, 0, 0, 0, LuaI.BATCMD_DEFEND_CRIT_HIT);
					else
						targetlist[i]:AddAttriChangeToLst(-1 * FinalDam, 0, 0, 0, LuaI.BATCMD_DEFEND_HIT);
					end
				end
			else
				if  FinalDam <= 10 then
					FinalDam = math.random(1, 10);
				end
				
				local result = skillCanHit(Atk,targetlist[i]);
				if result == 2 then
					targetlist[i]:MissSkill();
				else
					--targetlist[i]:ChangeHp(-1 * FinalDam);
					if CritHit == 1 then
						targetlist[i]:AddAttriChangeToLst(-1 * FinalDam, 0, 0, 0, LuaI.BATCMD_CRIT_HIT);
					else
						targetlist[i]:AddAttriChangeToLst(-1 * FinalDam, 0, 0, 0, LuaI.BATCMD_SKILL_HIT);
					end
				end
			end
			battle:PushReactionActor(targetlist[i]);
		end
		i = i + 1;
	end
	
	Atk:AddBuff(1303, 1, 0, 0, 1, 100);
end

