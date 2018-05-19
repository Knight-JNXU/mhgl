--﻿--﻿--MOB反击(云龙探爪)

function buff2101Active(buff, Char, Other, Type) 
	if Type == DO_HITTING then
		
		if Char:GetTeam() ~= Other:GetTeam() and Char:GetHP() ~= 0 and 
			Char:IsBuffExist(1303) ~= true then
			
			local reDam1 = -1 * Char:GetDHP();
			local reDam2 = -1 * Char:GetDSP();
			local reDam3 = -1 * Char:GetDMHP();
			
			local Lv = Char:GetLevel();
	        local skill = Char:GetSkillLv(5300);
			
			local animation = 0;
			local csv = Other:GetSkillCsvData(Other:GetSubType());
			if csv ~= nil then
				animation = csv.animation_Type;
			end
			
			if (Other:GetAction() == LuaI.BATCMD_ATTACK or 
				Other:GetAction() == LuaI.BATCMD_CRIT_ATTACK) and 
				(reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and 
				Char:GetReaction() ~= LuaI.BATCMD_MISS and Char:GetHP() ~= 0 then 
			
				local wDam = 1.02 ^ (math.floor((Lv+100)/170) * math.floor((Lv-73)/3)) * 0.98 ^ Other:GetSkillLv(377);
				local randomDam = 1.2 - (math.random(100, 300) / 1000);
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
					FinalDam = ((Char:GetATK() - FinalDef + 250) * wDam - 250) * randomDam * critDam;
					CritHit = 1;
				else
					FinalDam = ((Char:GetATK() - FinalDef + 250) * wDam - 250) * randomDam;
				end
				
				if CritHit == 1 then
					Other:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
				end
				if FinalDam <= 10 then
					FinalDam = math.random(1, 10);
				end
				
				Other:ChangeHp(-1 * FinalDam);
				
				if Char:GetAction() == LuaI.BATCMD_DEFEND then
					Char:SetTempReaction(LuaI.BATCMD_COUNTER_ATTACK_DEF_HIT);
				else
					Char:SetTempReaction(LuaI.BATCMD_COUNTER_ATTACK_HIT);
				end
			end
		end
	end
end
