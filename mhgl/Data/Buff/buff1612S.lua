--只受暗器伤害

function buff1612Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then		
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
		local SkillForm = 0;
		local csv = Other:GetSkillCsvData(Other:GetSubType());
		if csv ~= nil then
			SkillForm = csv.form;
		end
		
		if Char:GetTeam() ~= Other:GetTeam() then 
			if (Other:GetAction() == LuaI.BATCMD_ITEM or 
				(Other:GetAction() == LuaI.BATCMD_SKILL and SkillForm == 3)) and 
				(reDam1 > 0 or reDam2 > 0) and Char:GetReaction() ~= LuaI.BATCMD_MISS then
				if reDam1 > 0 then
			--		Char:ResetMHP();
					Char:ResetHP();
					Char:ChangeHp(-10 * reDam1);
				end
				if reDam2 > 0 then
					Char:ResetSP();
				end
			else
			--	Char:ResetMHP();
				Char:ResetHP();
				Char:ResetSP();
			end	
		end
	end
end
