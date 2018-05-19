--﻿--MOB抢攻(先声夺人)

function buff1814Active(buff, Char, Other, Type) 
	if Type == DO_LEAD_REACTION then
		
		if Char:GetTeam() ~= Other:GetTeam() and Char:GetHP() ~= 0 and 
			(Char:IsBuffExist(1300) or Char:IsBuffExist(1302)) ~= true then
			
			if (Other:GetAction() == LuaI.BATCMD_ATTACK or 
				Other:GetAction() == LuaI.BATCMD_CRIT_ATTACK) and 
				((Char:IsBuffExist(2006) or Char:IsBuffExist(2039) or Char:IsBuffExist(1807)) or 
				(Other:IsBuffExist(1700) or Other:IsBuffExist(1701) or Other:IsBuffExist(2005) or 
				Other:IsBuffExist(2038)) == false) then 
				
				local Lv = Char:GetLevel();				
				local randomDam = 1.2 - (math.random(100, 300) / 1000);
				--local weaponDam = 0.25 * (Char:GetHIT() - Char:GetAGI() * 1.7 - 6);
				local critDam = 2;
				local FinalDef = Other:GetDEF();
				if 0.8 * Char:GetATK() > Other:GetDEF() then
					if math.random(1, 100) <= 5 then
						FinalDef = Other:GetDEF() / 2;
					end
				end
				
				local wDam = 1;
				local PartnerOwner;			--是CBatActor类型 
				if Other:IsParnter() then
					local pBatMob = Other:ToBatMob();
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
					wDam =0.98 ^ Other:GetSkillLv(377);
				end
				
				local FinalDam = 0;
				local CritHit = 0;
				if math.random(1,100) <= 5 then
					FinalDam = ((Char:GetATK() - FinalDef + 250) * wDam - 250) * randomDam * critDam;
					CritHit = 1;
				else
					FinalDam = ((Char:GetATK() - FinalDef + 250) * wDam - 250) * randomDam;
				end
				
				if FinalDam <= 10 then
					FinalDam = math.random(1, 10);
				end
				
				if CritHit == 1 then
					Other:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
				end
				
				Char:DoDefaultAttack(Other, FinalDam, CritHit);	
			end
		end
	end
end
