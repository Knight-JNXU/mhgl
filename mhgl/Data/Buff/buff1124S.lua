--所有攻击无效

function buff1124Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then		
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
		
		local SkillForm = 0;
		local csv = Other:GetSkillCsvData(Other:GetSubType());
		if csv ~= nil then
			SkillForm = csv.form;
		end
				 
		if (reDam1 > 0 or reDam2 > 0) and Char:GetReaction() ~= LuaI.BATCMD_MISS then				
			Char:ResetMHP();
			Char:ResetHP();
			Char:ResetSP();
		end
	end
end
