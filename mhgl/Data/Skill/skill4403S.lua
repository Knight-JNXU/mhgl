--怒斩千关

function skill4403CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4403Use(Atk, Target, battle, skillLv)
	
	local sLv = Atk:GetLevel();
	local targetlist = {};
	local maxTargetCount = math.floor((sLv - 10) / 10) + 2;
	
	if maxTargetCount > 6 then
		maxTargetCount = 6;
	elseif maxTargetCount < 3 then
		maxTargetCount = 3;
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, RandomSort, bufflist, 0);
	
	local MSSLv = math.floor((sLv - 30)/ 30) * 30 + 30;
	local consumeSp = 1.2 * MSSLv / maxTargetCount;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#P%d\#W，无法施展神·怒斩千关", consumeSp);
	
	local KillFlag = 0;
	local i = 0;
	while targetlist[i] ~= nil do
		if  Atk:GetSP() < consumeSp then
			Atk:SkillFail(Msg);
			break
		end
		
		Atk:ChangeSp(-1 * consumeSp, false);
		
		local Thp = targetlist[i]:GetHP();
		local wDam = 1;		--是CBatActor类型 
		local wDam1 = 1;
		local ZPartnerOwner;			--是CBatActor类型
		local PartnerOwner;			--是CBatActor类型
		if Atk:IsParnter() then
			local ZpBatMob = Atk:ToBatMob();
			if ZpBatMob ~= nil then
				for jj=0, battle:GetActorCount() - 1 do
					local ZpActor = battle:GetActor(jj);
					if ZpActor:IsPlayer() then
						local ZpBatChar = ZpActor:ToBatChar();
						if ZpBatChar ~= nil and ZpBatChar:GetChar_id() == ZpBatMob:GetOwner_id() then
							ZPartnerOwner = ZpActor;
							wDam1 = 1.02 ^ ZPartnerOwner:GetOwner():GetSkillLv(383);
						end
					end
				end
			end
		else
			wDam1 = 1.02 ^ Atk:GetSkillLv(378);
		end
		if targetlist[i]:IsParnter() then
			local pBatMob = targetlist[i]:ToBatMob();
			if pBatMob ~= nil then
				for ii=0, battle:GetActorCount() - 1 do
					local pActor = battle:GetActor(ii);
					if pActor:IsPlayer() then
						local pBatChar = pActor:ToBatChar();
						if pBatChar ~= nil and pBatChar:GetChar_id() == pBatMob:GetOwner_id() then
							PartnerOwner = pActor;
							wDam = wDam1 * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(385);
						end
					end
				end
			end
		else
			wDam = wDam1 * 0.98 ^ targetlist[i]:GetSkillLv(378);
		end
		
		local randomDam = 1.2 - (math.random(100, 300) / 800);
		local critDam = 2.0;
		local FinalDef = targetlist[i]:GetDEF();
		if 1.38 * Atk:GetATK() > targetlist[i]:GetDEF() then
			if math.random(1, 100) <= 100 then
				FinalDef = targetlist[i]:GetDEF() / 2;
			end
		end
		
		local FinalDam = 0;
		local CritHit = 0;
		local CritRate =  5;
		if Atk:IsBuffExist(1925) then
			CritRate = 55;
		elseif Atk:IsBuffExist(2043) then
			CritRate = 25;
		end
		if math.random(1,100) <= CritRate then
			FinalDam = ((1.52 * Atk:GetATK() - FinalDef + 250) * wDam - 250) * randomDam * critDam;
			CritHit = 1;
		else
			FinalDam = ((1.52 * Atk:GetATK() - FinalDef + 250) * wDam - 250) * randomDam;
		end
		
		if FinalDam <= 10 then
			FinalDam = math.random(1, 10);
		end
		
		local reDam = targetlist[i]:GetFinalValue(-FinalDam, Atk, Atk:GetAction(), 1);
		
		if targetlist[i]:GetCommand() == LuaI.BATCMD_DEFEND then
			FinalDam = FinalDam / 2;
			reDam = reDam / 2;
			
			if CritHit == 1 then
				targetlist[i]:AddAttriChangeToLst(-1 * FinalDam, 0, 0, 0, LuaI.BATCMD_DEFEND_CRIT_HIT);
			else
				targetlist[i]:AddAttriChangeToLst(-1 * FinalDam, 0, 0, 0, LuaI.BATCMD_DEFEND_HIT);
			end
		else
			if CritHit == 1 then
				targetlist[i]:AddAttriChangeToLst(-1 * FinalDam, 0, 0, 0, LuaI.BATCMD_CRIT_HIT);
			else
				targetlist[i]:AddAttriChangeToLst(-1 * FinalDam, 0, 0, 0, LuaI.BATCMD_SKILL_HIT);
			end
		end
		
		battle:PushReactionActor(targetlist[i]);
		
		if -reDam >= Thp then
			i = i + 1;
		else
			break
		end	
	end	
end
