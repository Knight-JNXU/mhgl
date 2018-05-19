---﻿--增加攻击(破釜沉舟)

function buff2016Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING_ATTACKER then
		
		local reDam1 = -1 * Other:GetDHP();
		local reDam2 = -1 * Other:GetDSP();
		local reDam3 = -1 * Other:GetDMHP();
		
		local skillForm = 0;
		local csv = Char:GetSkillCsvData(Char:GetSubType());
		if csv ~= nil then
			skillForm = csv.form;
		end
		
		if (Char:GetAction() == LuaI.BATCMD_ATTACK or Char:GetAction() == LuaI.BATCMD_CRIT_ATTACK or 
			((Char:GetAction() == LuaI.BATCMD_SKILL or Char:GetAction() == LuaI.BATCMD_CRIT_SKILL) and 
			skillForm == 1)) and (Other:IsBuffExist(2017) or Other:IsBuffExist(2050) or Other:IsBuffExist(21017) or Other:IsBuffExist(21050)) and 
			(reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and  Other:GetReaction() ~= LuaI.BATCMD_MISS then
			
			if reDam1 > 0 then
				if 0.8 * reDam1 < 1 then
					reDam1 = 1 / 0.8;
				end
				Other:ResetHP();
				Other:ChangeHp(-0.8 * reDam1);
			end
			if reDam2 > 0 then
				if 0.8 * reDam2 < 1 then
					reDam2 = 1 / 0.8;
				end
				Other:ResetSP();
				Other:ChangeSp(-0.8 * reDam2);
			end
			if reDam3 > 0 then
				if 0.8 * reDam3 < 1 then
					reDam3 = 1 / 0.8;
				end
				Other:ResetMHP();
				Other:ChangeMHp(-0.8 * reDam3);
			end
		end
	end
end
