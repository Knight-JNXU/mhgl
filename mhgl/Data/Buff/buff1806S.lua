--冰盾(玉冰障)

function buff1806Active(buff, Char, Other, Type) 
	if Type == DO_HITTING then
		
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
		local reDam3 = -1 * Char:GetDMHP();
		
		local SkillForm = 0;
		local csv = Other:GetSkillCsvData(Other:GetSubType());
		if csv ~= nil then
			SkillForm = csv.form;
		end
		
		if Char:GetTeam() ~= Other:GetTeam() then
			
			if (Other:GetAction() == LuaI.BATCMD_ATTACK or 
				Other:GetAction() == LuaI.BATCMD_CRIT_ATTACK or 
				((Other:GetAction() == LuaI.BATCMD_SKILL or 
				Other:GetAction() == LuaI.BATCMD_CRIT_SKILL or Other:GetAction() == LuaI.BATCMD_SPECIAL) and SkillForm == 1)) and 
				(reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and 
				Char:GetReaction() ~= LuaI.BATCMD_MISS then
				
				if 0 < reDam1 and 0.85 * reDam1 < 1 then
					reDam1 = 1 / 0.85;
				end
				if 0 < reDam2 and 0.85 * reDam2 < 1 then
					reDam2 = 1 / 0.85;
				end
				if 0 < reDam3 and 0.85 * reDam3 < 1 then
					reDam3 = 1 / 0.85;
				end
				
				local sectrate = 0.85;
				if Char:IsBuffExist(1710) then
					sectrate = 0.95
				end
				Char:ResetMHP();
				Char:ResetHP();
				Char:ResetSP();
				Char:ChangeHp(-sectrate * reDam1);
				Char:ChangeSp(-sectrate * reDam2);
				Char:ChangeMHp(-sectrate * reDam3);
			end
		end
	end
end
