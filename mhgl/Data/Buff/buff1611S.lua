--内功无穷吸收

function buff1611Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then		
		
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
		local reDam3 = -1 * Char:GetDMHP();
		local hp = Char:GetHP();
		local sp = Char:GetSP();
		local rec1 = Char:GetMaxHP();
		local rec2 = Char:GetMaxSP();
		
		local skillForm = 0;
		local csv = Other:GetSkillCsvData(Other:GetSubType());
		if csv ~= nil then
			skillForm = csv.form;
		end
		
		if (Other:GetAction() == LuaI.BATCMD_SKILL or Other:GetAction() == LuaI.BATCMD_CRIT_SKILL) and			
			(reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and Char:GetReaction() ~= LuaI.BATCMD_MISS then
			
			--Char:ResetHP();
			if reDam1 > 0 then
			--	Char:ResetMHP();
				Char:ResetHP();					
				Char:ChangeHp(rec1 - hp);
			end
			if reDam2 > 0 then
				Char:ResetSP();								
				Char:ChangeSp(rec2 - sp);
			end								
		end
	end
end
