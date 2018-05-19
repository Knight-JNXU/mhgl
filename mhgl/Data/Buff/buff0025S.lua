--﻿--抢攻(长歌飞虹)

function buff0025Active(buff, Char, Other, Type) 
	if Type == DO_LEAD_REACTION then
		
		if Char:GetTeam() ~= Other:GetTeam() then
			
			if Other:GetAction() == LuaI.BATCMD_ATTACK or
				Other:GetAction() == LuaI.BATCMD_CRIT_ATTACK or
				Other:GetAction() == LuaI.BATCMD_SKILL or
				Other:GetAction() == LuaI.BATCMD_ITEM or
				Other:GetAction() == LuaI.BATCMD_SPECIAL then
				local maxspATK = math.floor(Char:GetMaxSP() / 100) * 3;
				local maxspDEF = math.floor(Other:GetMaxSP() / 100) * 2;
				local wDam = Char:GetSkillLv(376) - Other:GetSkillLv(377);
				local randomDam = 1.2 - (math.random(100, 300) / 1000);
				local critDam = 1.5;
				local FinalDef = Other:GetDEF();
				if 0.8 * Char:GetATK() > Other:GetDEF() then
					if math.random(1, 100) <= 5 then
						FinalDef = Other:GetDEF() / 2;
					end
				end
				
				local FinalDam = 0;
				local CritHit = 0;
	
				if math.random(1,100) <= 5 then
					FinalDam = (( Char:GetATK() - FinalDef + maxspATK - maxspDEF) * 1.05 ^ wDam) * randomDam * critDam;
					CritHit = 1;
				else
					FinalDam = (( Char:GetATK() - FinalDef + maxspATK - maxspDEF) * 1.05 ^ wDam) * randomDam;
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
