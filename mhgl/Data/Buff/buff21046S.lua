--高级近身闪避(真蝴蝶穿花)

function buff21046Active(buff, Char, Other, Type) 
	
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
			
			if math.random(1, 100) <= 30 then
				Char:ResetMHP();
				Char:ResetHP();
				Char:ResetSP();
				Char:MissSkill();
			end
		end		
	end	
end
