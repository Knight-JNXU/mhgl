

function buff1938Active(buff, Char, Other, Type)
	
	if Type == TURN_END then
		
		local i = buff:GetBuffValue2();
		i = i + 1;
		buff:SetBuffValue2(i);
		if i >= 1 then
			Char:RemoveBuff(1938);
		end		
		Char:BuffActive();
	end
	
	if Type == DO_HITTING then
		
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
		local reDam3 = -1 * Char:GetDMHP();
		
		local skillForm = 0;
		local csv = Other:GetSkillCsvData(Other:GetSubType());
		if csv ~= nil then
			skillForm = csv.form;
		end
		
		if ((Other:GetAction() == LuaI.BATCMD_SKILL or Other:GetAction() == LuaI.BATCMD_CRIT_SKILL or 
			Other:GetAction() == LuaI.BATCMD_SPECIAL) and skillForm == 2) and 
			(reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and 
			Char:GetReaction() ~= LuaI.BATCMD_MISS then
			
			if reDam1 > 0 then
				Char:ResetHP();	
				reDam1 = reDam1 * 1;
				Char:ChangeHp(-0 * reDam1);
			end
			if reDam2 > 0 then
				Char:ResetSP();
				reDam2 = reDam2 * 1;
				Char:ChangeSp(-0 * reDam2);
			end
			if reDam3 > 0 then
				Char:ResetMHP();
				reDam3 = reDam3 * 1;
				Char:ChangeMHp(-0 * reDam3);
			end
		end
	end
end
