--天雷斩

function skill16061CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此技能需傲世诀修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此技能需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill16061Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	
	local maxTargetCount = math.floor((skillLv - 35) / 20) + 2;
	
	if maxTargetCount > 7 then
		maxTargetCount = 7;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	if Atk:GetSkillLv(394) > 0 then
	   maxTargetCount = maxTargetCount + 1;
	end
	
	if Target:IsParnter() or Target:IsPlayer() then
	  maxTargetCount = 1
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local MSSLv = math.floor((skillLv - 35)/ 20) * 20 + 35;
	local consumeSp = 20 * count;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展天雷斩", consumeSp);
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
								wDam = 1.02 ^ Atk:GetSkillLv(376) * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(383);
							end
						end
					end
				end
			else
				wDam = 1.02 ^ Atk:GetSkillLv(376) * 0.98 ^ targetlist[i]:GetSkillLv(377);
			end
			local randomDam = 1.2 - math.random(100, 300) / 1000;
			local weaponDam = 0.25 * (Atk:GetHIT() - Atk:GetAGI() * 1.7 - 6);
			local critDam = 2.0;
			local FinalDef = targetlist[i]:GetDEF();
			if 0.8 * Atk:GetATK() > targetlist[i]:GetDEF() then
				if math.random(1, 100) <= 5 then
					FinalDef = targetlist[i]:GetDEF() / 2;
				end
			end
			local sh = 1.25 * Atk:GetATK() - FinalDef ;
			local FinalDam = 0;
			local CritHit = 0;
			local CritRate =  math.floor(Atk:GetSkillLv(16060) / 10) + 2;
			if math.random(1,100) <= 5 then
				FinalDam =((1.2*Atk:GetATK() - targetlist[i]:GetDEF() + 250) * wDam - 250)  * randomDam * critDam;
				CritHit = 1;
			else
			    FinalDam =((1.2*Atk:GetATK() - targetlist[i]:GetDEF() + 250) * wDam - 250) * randomDam ;
				end
			
			FinalDam = FinalDam * 0.9 --强制降低
			if targetlist[i]:GetCommand() == LuaI.BATCMD_DEFEND then
				FinalDam = FinalDam / 1  ;
				if  FinalDam <= 10 then
					FinalDam = math.random(1, 10);
				end
				
				local result = skillCanHit(Atk,targetlist[i]);
				if result == 2 then
					targetlist[i]:MissSkill();
				else
					--targetlist[i]:ChangeHp(-1 * FinalDam);
					if CritHit == 1 then
						targetlist[i]:AddAttriChangeToLst(-2 * FinalDam, 0, 0, 0, LuaI.BATCMD_DEFEND_CRIT_HIT);
					else
						targetlist[i]:AddAttriChangeToLst(-2 * FinalDam, 0, 0, 0, LuaI.BATCMD_DEFEND_HIT);
					end
				end
			else
				if  FinalDam <= 10 then
					FinalDam = math.random(1, 10);
				end
				if Atk:GetSkillLv(394) > 0 then
				   FinalDam = FinalDam + (FinalDam * Atk:GetSkillLv(394) * 0.01)
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
			if targetlist[i]:IsBuffExist(6023) then
	targetlist[i]:AddBuff(6024, skillLv, 0, 0, 150, 100);
	
	elseif targetlist[i]:IsBuffExist(6022) then
	targetlist[i]:AddBuff(6023, skillLv, 0, 0, 150, 100);
	
	elseif targetlist[i]:IsBuffExist(6021) then
	targetlist[i]:AddBuff(6022, skillLv, 0, 0, 150, 100);
	
	elseif targetlist[i]:IsBuffExist(6020) then
	targetlist[i]:AddBuff(6021, skillLv, 0, 0, 150, 100);
	
	elseif targetlist[i]:IsBuffExist(6019) then
	targetlist[i]:AddBuff(6020, skillLv, 0, 0, 150, 100);
	
	elseif targetlist[i]:IsBuffExist(6018) then
	targetlist[i]:AddBuff(6019, skillLv, 0, 0, 150, 100);
	
	elseif targetlist[i]:IsBuffExist(6017) then
	targetlist[i]:AddBuff(6018, skillLv, 0, 0, 150, 100);
	
	elseif targetlist[i]:IsBuffExist(6016) then
	targetlist[i]:AddBuff(6017, skillLv, 0, 0, 150, 100);
	
	elseif targetlist[i]:IsBuffExist(6015) then
	targetlist[i]:AddBuff(6016, skillLv, 0, 0, 150, 100);
	
	elseif targetlist[i]:IsBuffExist(6014) then
	targetlist[i]:AddBuff(6015, skillLv, 0, 0, 150, 100);
	else
	targetlist[i]:AddBuff(6014, skillLv, 0, 0, 150, 100);
	end
			battle:PushReactionActor(targetlist[i]);
		end
		i = i + 1;
	end
	
	if Atk:IsBuffExist(5023) then
	Atk:AddBuff(5024, skillLv, 0, 0, 150, 100);
	
	elseif Atk:IsBuffExist(5022) then
	Atk:AddBuff(5023, skillLv, 0, 0, 150, 100);
	
	elseif Atk:IsBuffExist(5021) then
	Atk:AddBuff(5022, skillLv, 0, 0, 150, 100);
	
	elseif Atk:IsBuffExist(5020) then
	Atk:AddBuff(5021, skillLv, 0, 0, 150, 100);
	
	elseif Atk:IsBuffExist(5019) then
	Atk:AddBuff(5020, skillLv, 0, 0, 150, 100);
	
	elseif Atk:IsBuffExist(5018) then
	Atk:AddBuff(5019, skillLv, 0, 0, 150, 100);
	
	elseif Atk:IsBuffExist(5017) then
	Atk:AddBuff(5018, skillLv, 0, 0, 150, 100);
	
	elseif Atk:IsBuffExist(5016) then
	Atk:AddBuff(5017, skillLv, 0, 0, 150, 100);
	
	elseif Atk:IsBuffExist(5015) then
	Atk:AddBuff(5016, skillLv, 0, 0, 150, 100);
	
	elseif Atk:IsBuffExist(5014) then
	Atk:AddBuff(5015, skillLv, 0, 0, 150, 100);
	else
	Atk:AddBuff(5014, skillLv, 0, 0, 150, 100);
	end
	
end

