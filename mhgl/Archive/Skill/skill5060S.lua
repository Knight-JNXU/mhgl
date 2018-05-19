--MOB

function skill5060CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5060Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();	
	local randomDam = 1.2 - math.random(100, 300) / 1000;
	local critDam = 2.0;
	local FinalDef = Target:GetDEF();
	if 0.8 * Atk:GetATK() > Target:GetDEF() then
		if math.random(1, 100) <= 5 then
			FinalDef = Target:GetDEF() / 2;
		end
	end
	local consumeHp = 0.1 * Atk:GetHP() * math.random(9, 11) / 10;
	
	if consumeHp <= 1 then
		consumeHp = 1;
	end
	
	local reqHp = Atk:GetMaxHP() * 0.5;
	if Atk:GetHP() < reqHp then
		Atk:SkillFail("\#W[战斗讯息]：生命不足\#G50\%\#W，无法施展风雷七星斩");
		do return end
	end
	local FinalDam = {0, 0, 0};
	local CritHit = {0, 0, 0};
	local DamRate = {1.1, 1.3, 1.5};
	
	local i = 1;
	while i <= 3 do
		local wDam = 1;
		local PartnerOwner;			--是CBatActor类型 
		if Target:IsParnter() then
			local pBatMob = Target:ToBatMob();
			if pBatMob ~= nil then
				for ii=0, battle:GetActorCount() - 1 do
					local pActor = battle:GetActor(ii);
					if pActor:IsPlayer() then
						local pBatChar = pActor:ToBatChar();
						if pBatChar ~= nil and pBatChar:GetChar_id() == pBatMob:GetOwner_id() then
							PartnerOwner = pActor;
							wDam = 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(383);
						end
					end
				end
			end
		else
			wDam =0.98 ^ Target:GetSkillLv(377);
		end
		
		local result = skillCanHit(Atk,Target);
		if result == 2 then
			Target:MissSkill();		
		elseif math.random(1,100) <= 15 then
			FinalDam[i] = ((DamRate[i] * Atk:GetATK() - 0.85 * FinalDef + 250) * wDam - 250) * randomDam * critDam;
			CritHit[i] = 1;
		else
			FinalDam[i] = ((DamRate[i] * Atk:GetATK() - 0.85 * FinalDef + 250) * wDam - 250) * randomDam;
		end
		
		--if KillFlag == 0 then
			if Target:GetCommand() == LuaI.BATCMD_DEFEND then
				FinalDam[i] = FinalDam[i] / 2;
				
				if FinalDam[i] <= 10 then
					FinalDam[i] = math.random(1, 10);
				end
				
				--[[if nDamsBonus * FinalDam[i] >= TargetHP then
					KillFlag = 1;
				end]]
				
				if CritHit[i] == 1 then
					Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_DEFEND_CRIT_HIT);
				else
					Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_DEFEND_HIT);
				end
				--TargetHP = TargetHP - nDamsBonus * FinalDam[i];
			else
				if FinalDam[i] <= 10 then
					FinalDam[i] = math.random(1, 10);
				end
				
				--[[if nDamsBonus * FinalDam[i] >= TargetHP then
					KillFlag = 1;
				end]]
				
				if CritHit[i] == 1 then
					Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_CRIT_HIT);
				else
					Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_SKILL_HIT);
				end
				--TargetHP = TargetHP - nDamsBonus * FinalDam[i];
			end
		--end
		
		--[[if KillFlag == 1 then
			break;
		end]]
		
		i = i + 1;
	end
	
	local DefEffect = (0.8 + math.floor((Lv + 10) / 10) / 100) * Atk:GetDEF();
	local PowEffect = (0.8 + math.floor((Lv + 10) / 10) / 100) * Atk:GetPOW();
	battle:PushReactionActor(Target);
	Atk:AddBuff(1300, (Lv + 10), 0, 0, 1, 100);
	Atk:AddBuff(1301, (Lv + 10), DefEffect, PowEffect, 1, 100);
	
end

