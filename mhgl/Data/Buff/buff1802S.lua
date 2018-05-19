--﻿--﻿--反击(云龙探爪)

function buff1802Active(buff, Char, Other, Type) 
	if Type == DO_HITTING then
		
		if Char:GetTeam() ~= Other:GetTeam() and Char:GetHP() ~= 0 and 
			Char:IsBuffExist(1303) ~= true then
			
			local reDam1 = -1 * Char:GetDHP();
			local reDam2 = -1 * Char:GetDSP();
			local reDam3 = -1 * Char:GetDMHP();
			
			if (Other:GetAction() == LuaI.BATCMD_ATTACK or 
				Other:GetAction() == LuaI.BATCMD_CRIT_ATTACK) and 
				(reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and 
				((Char:IsBuffExist(2006) or Char:IsBuffExist(2039) or Char:IsBuffExist(1807)) or 
				(Other:IsBuffExist(1700) or Other:IsBuffExist(1701) or Other:IsBuffExist(2005) or 
				Other:IsBuffExist(2038)) == false) and 
				Char:GetReaction() ~= LuaI.BATCMD_MISS and Char:GetHP() ~= 0 then 
				
				local wDam = 1;		--是CBatActor类型 
				local PartnerOwner;			--是CBatActor类型 
				local battle = Char:GetBattle();
				if Other:IsParnter() then
					local pBatMob = Other:ToBatMob();
					if pBatMob ~= nil then
						for ii=0, battle:GetActorCount() - 1 do
							local pActor = battle:GetActor(ii);
							if pActor:IsPlayer() then
								local pBatChar = pActor:ToBatChar();
								if pBatChar ~= nil and pBatChar:GetChar_id() == pBatMob:GetOwner_id() then
									PartnerOwner = pActor;
									wDam = 1.02 ^ Char:GetSkillLv(376) * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(383);
								end
							end
						end
					end
				else
					wDam = 1.02 ^ Char:GetSkillLv(376) * 0.98 ^ Other:GetSkillLv(377);
				end
				local randomDam = 1.2 - (math.random(100, 300) / 1000);
				local weaponDam = 0.25 * (Char:GetHIT() - Char:GetAGI() * 1.7 - 6);
				local critDam = 2.0;
				local FinalDef = Other:GetDEF();
				if 0.8 * Char:GetATK() > Other:GetDEF() then
					if math.random(1, 100) <= 5 then
						FinalDef = Other:GetDEF() / 2;
					end
				end
				
				local FinalDam = 0;
				
				local CritHit = 0;
				if math.random(1,100) <= 5 then
					FinalDam = ((Char:GetATK() - FinalDef + weaponDam + 250) * wDam - 250) * randomDam * critDam;
					CritHit = 1;
				else
					FinalDam = ((Char:GetATK() - FinalDef+ weaponDam + 250) * wDam - 250) * randomDam;
				end
				
				if CritHit == 1 then
					Other:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
				end
				
				if FinalDam <= 10 then
					FinalDam = math.random(1, 10);
				end
				
				local reDam = Other:GetFinalValue(-FinalDam, Char, LuaI.BATCMD_ATTACK, 1);
				if -reDam < 1 then
					reDam = -1;
				end
				Other:ChangeHp(reDam);
				
				--反击杀死龟息功
				if  (Other:IsBuffExist(2020) or Other:IsBuffExist(2053)) and 
					Other:GetHP() <= -reDam then
					Other:AddBuff(2066, 0, 0, 0, 5, 100);
				end
				
				if Char:GetAction() == LuaI.BATCMD_DEFEND then
					Char:SetTempReaction(LuaI.BATCMD_COUNTER_ATTACK_DEF_HIT);
				else
					Char:SetTempReaction(LuaI.BATCMD_COUNTER_ATTACK_HIT);
				end
			end
		end
	end
end
