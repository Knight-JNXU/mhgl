---﻿--2连击(抽撤连环)

function buff21003Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING_ATTACKER then
		
		local HitRate = math.random(1, 100);
		local wDam = 1;		--是CBatActor类型 
		local wDam1 = 1;
		local ZPartnerOwner;			--是CBatActor类型
		local PartnerOwner;			--是CBatActor类型
		local battle = Char:GetBattle();
		if Char:IsParnter() then
			local ZpBatMob = Char:ToBatMob();
			if ZpBatMob ~= nil then
				for jj=0, battle:GetActorCount() - 1 do
					local ZpActor = battle:GetActor(jj);
					if ZpActor:IsPlayer() then
						local ZpBatChar = ZpActor:ToBatChar();
						if ZpBatChar ~= nil and ZpBatChar:GetChar_id() == ZpBatMob:GetOwner_id() then
							ZPartnerOwner = ZpActor;
							wDam1 = 1.02 ^ ZPartnerOwner:GetOwner():GetSkillLv(382);
						end
					end
				end
			end
		else
			wDam1 = 1.02 ^ Char:GetSkillLv(376);
		end
		if Other:IsParnter() then
			local pBatMob = Other:ToBatMob();
			if pBatMob ~= nil then
				for ii=0, battle:GetActorCount() - 1 do
					local pActor = battle:GetActor(ii);
					if pActor:IsPlayer() then
						local pBatChar = pActor:ToBatChar();
						if pBatChar ~= nil and pBatChar:GetChar_id() == pBatMob:GetOwner_id() then
							PartnerOwner = pActor;
							wDam = wDam1 * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(383);
						end
					end
				end
			end
		else
			wDam = wDam1 * 0.98 ^ Other:GetSkillLv(377);
		end
		
		if Char:GetTeam() ~= Other:GetTeam() then
			
			if (Char:GetAction() == LuaI.BATCMD_ATTACK or Char:GetAction() == LuaI.BATCMD_CRIT_ATTACK) and 
				Other:GetReaction() ~= LuaI.BATCMD_MISS and 
				Other:GetHP() > 0 and Char:IsBuffExist(2036) ~= true then
				
				-- restore the hp drop first
				--Other:ResetMHP();
				Other:ResetHP();
				
				local critDam = 2;
				local FinalDef = Other:GetDEF();
				if 0.8 * Char:GetATK() > Other:GetDEF() then
					if math.random(1, 100) <= 5 then
						FinalDef = Other:GetDEF() / 2;
					end
				end
				
				local FinalDam = {0};
				local lianji = 1;
				local CritRate = 5;
				
				if Other:IsBuffExist(2001) ~= true and 
					Other:IsBuffExist(2034) ~= true and 
					Other:IsBuffExist(2033) ~= true and 
					Other:IsBuffExist(2000) ~= true and 
					Other:IsBuffExist(1626) ~= true and 
					Other:IsBuffExist(21001) ~= true and 
					Other:IsBuffExist(21034) ~= true and 
					Other:IsBuffExist(21033) ~= true and 
					Other:IsBuffExist(21000) ~= true and
					HitRate <= 45 then
					FinalDam = {0, 0};
					lianji = 2;
				end
				if not Other:IsBuffExist(2011) and not Other:IsBuffExist(2044) and not Other:IsBuffExist(21011) and not Other:IsBuffExist(21044) then
					if Char:IsBuffExist(2043) then 
						CritRate = 25;
					elseif Char:IsBuffExist(2010) then
						CritRate = 15;
					elseif Char:IsBuffExist(21043) then 
						CritRate = 25;
					elseif Char:IsBuffExist(21010) then
						CritRate = 15;
					end
				end
				
				local TargetHP = Other:GetHP();
				local i = 1;
				while i <= lianji do
					
					local randomDam = 1.2 - (math.random(100, 300) / 1000);
					local CritHit = 0;
					if math.random(1,100) <= CritRate then
						FinalDam[i] = critDam * (((Char:GetATK() - FinalDef + 250) * wDam - 250) * randomDam) * 0.75;
						CritHit = 1;
					else
						FinalDam[i] = ((Char:GetATK() - FinalDef + 250) * wDam - 250) * randomDam  * 0.75;
					end
					
					if Other:GetCommand() == LuaI.BATCMD_DEFEND then
						
						FinalDam[i] = FinalDam[i] / 2;
						
						if FinalDam[i] <= 10 then
							FinalDam[i] = math.random(1, 10);
						end
						
						if CritHit == 1 then
							Other:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_DEFEND_CRIT_HIT);
						else
							Other:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_DEFEND_HIT);
						end
					else
						if FinalDam[i] <= 10 then
							FinalDam[i] = math.random(1, 10);
						end
						
						if CritHit == 1 then
							Other:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_CRIT_HIT);
						else
							Other:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_NORM_HIT);
						end
					end
					i = i + 1;
				end
				
				Char:CancelAction();
			end
		end	
	end	
end
