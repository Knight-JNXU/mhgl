--夺命追魂

function skill2041CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需白氏剑法修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill2041Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local maxTargetCount = 3;
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, RandomSort, bufflist, 0);
	
	
	local consumeSp = 0.8 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展夺命追魂", consumeSp);
	
	if Atk:GetSP() < consumeSp then
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
			local randomDam = 1.2 - (math.random(100, 300) / 1000);
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
			if math.random(1,100) <= 5 then
				FinalDam = ((1.15 * Atk:GetATK() - FinalDef + weaponDam + 250) * wDam - 250) * randomDam * critDam;
				CritHit = 1;
			else
				FinalDam = ((Atk:GetATK() - FinalDef + weaponDam + 250) * wDam - 250) * randomDam;	
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
			
			local LvDif = skillLv - targetlist[i]:GetLevel();
			
			local turn = 3 + math.floor(LvDif / 10);
			if turn < 1 then
				turn = 1;
			elseif turn > 5 then
				trun = 5;
			end
			
			if targetlist[i]:GetHP() ~= 0 and (targetlist[i]:IsBuffExist(1000) == false) and  math.random(1, 100) <= 15 then
				targetlist[i]:AddBuff(1000, skillLv, reDam * -0.3, 0, turn, 100); 
			end
			
			battle:PushReactionActor(targetlist[i]);
		end
		
		i = i + 1;
	end
	
	local DefEffect = 0.9 * Atk:GetDEF();
	local PowEffect = 0.9 * Atk:GetPOW();
	Atk:AddBuff(1304, skillLv, DefEffect, PowEffect, 1, 100);
	
end

