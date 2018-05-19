--强暗器

function buff63520Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then		
		local reDam = -1 * Char:GetDHP();
		
		local SkillForm = 0;
		local csv = Other:GetSkillCsvData(Other:GetSubType());
		if csv ~= nil then
			SkillForm = csv.form;
		end
		
		if Char:GetTeam() ~= Other:GetTeam() then 
			if (Other:GetAction() == LuaI.BATCMD_ITEM or 
				(Other:GetAction() == LuaI.BATCMD_SKILL and SkillForm == 3)) and 
				reDam > 0 and Char:GetReaction() ~= LuaI.BATCMD_MISS then
		--		Char:ResetMHP();
				Char:ResetHP();
				Char:ChangeHp(-0.5 * reDam);
			end	
		end
	end
end
