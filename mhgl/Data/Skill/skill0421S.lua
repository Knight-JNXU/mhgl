--牛刀小试

function skill0421CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill0421Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	
	local maxTargetCount = 3
	
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local MSSLv = math.floor((skillLv - 35)/ 20) * 20 + 35;
	local consumeSp = 10
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展牛刀小试", consumeSp);
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
			
			local FinalDam = 0;
			local CritHit = 0;
			local CritRate =  math.floor(Atk:GetSkillLv(1850) / 10) + 2;
			if math.random(1,100) <= CritRate then
				FinalDam = ((1.05 * Atk:GetATK() - FinalDef + weaponDam + 250) * wDam - 250) * randomDam * critDam;
				CritHit = 1;
			else
				FinalDam = ((1.05 * Atk:GetATK() - FinalDef + weaponDam + 250) * wDam - 250) * randomDam;
			end
			
			
			if targetlist[i]:GetCommand() == LuaI.BATCMD_DEFEND then
				FinalDam = FinalDam / 2;
				if  FinalDam <= 10 then
					FinalDam = math.random(1, 10);
				elseif FinalDam > 300 then
				  FinalDam = math.random(100,300)
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
				elseif FinalDam > 300 then
				  FinalDam = math.random(100,300)
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
	
end

