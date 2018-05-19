--﻿--MOB抢攻(先声夺人)

function buff2100Active(buff, Char, Other, Type) 
	if Type == DO_LEAD_REACTION then
		
		if Char:GetTeam() ~= Other:GetTeam() and Char:GetHP() ~= 0 and 
			(Char:IsBuffExist(1300) or Char:IsBuffExist(1302)) ~= true then
			
			if Other:GetAction() == LuaI.BATCMD_ATTACK or
				Other:GetAction() == LuaI.BATCMD_CRIT_ATTACK then 
				
				local Lv = Char:GetLevel();
	            local skill = Char:GetSkillLv(5300);
				local wDam = 1.02 ^ (math.floor((Lv+100)/170) * math.floor((Lv-73)/3)) * 0.98 ^ Other:GetSkillLv(377);
				local randomDam = 1.2 - (math.random(100, 300) / 1000);
				local critDam = 2;
				local FinalDef = Other:GetDEF();
				if 0.8 * Char:GetATK() > Other:GetDEF() then
					if math.random(1, 100) <= 5 then
						FinalDef = Other:GetDEF() / 2;
					end
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
