--近身闪避(惊雪无常)
function buff1520Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then
		
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
		local reDam3 = -1 * Char:GetDMHP();
		
		local SkillForm = 0;
		local csv = Other:GetSkillCsvData(Other:GetSubType());
		if csv ~= nil then
			SkillForm = csv.form;
		end
		
		if (Other:GetAction() == LuaI.BATCMD_ATTACK  or ((Other:GetAction() == LuaI.BATCMD_SKILL or 
			Other:GetAction() == LuaI.BATCMD_CRIT_SKILL or Other:GetAction() == LuaI.BATCMD_SPECIAL) and 
			SkillForm == 1)) and (reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and 
			Char:GetReaction() ~= LuaI.BATCMD_MISS then
			
			if math.random(1, 100) <= 15 then
				Char:ResetMHP();
				Char:ResetHP();
				Char:ResetSP();
				Char:MissSkill();
			end
		end		
	end	
end
