--双抗减免60%

function buff5572Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then		
		
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
		local reDam3 = -1 * Char:GetDMHP();
		
		local skillForm = 0;
		local csv = Other:GetSkillCsvData(Other:GetSubType());
		if csv ~= nil then
			skillForm = csv.form;
		end
		
		if (Other:GetAction() == LuaI.BATCMD_ATTACK or Other:GetAction() == LuaI.BATCMD_CRIT_ATTACK or
			((Other:GetAction() == LuaI.BATCMD_SKILL or Other:GetAction() == LuaI.BATCMD_CRIT_SKILL) and
			skillForm == 1 or skillForm == 2)) and 
			(reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and				
			Char:GetReaction() ~= LuaI.BATCMD_MISS then
			
			--Char:ResetHP();
			if reDam1 > 0 then
				reDam1 = reDam1 * 0.4;
			end
			if reDam2 > 0 then
				reDam2 = reDam2 * 0.4;
			end
			if reDam3 > 0 then
				reDam3 = reDam3 * 0.4;
			end
			if reDam1 > Char:GetHP() then 
                local res1 = Char:GetHP();
				Char:ChangeHp(-1 * res1);
			else
				Char:ChangeHp(-1 * reDam1);
			end
			if reDam2 > Char:GetSP() then
				local res2 = Char:GetSP();
				Char:ChangeSp(-1 * res2);
			else
				Char:ChangeSp(-1 * reDam2);
			end
			if reDam3 > Char:GetMHP() then
				local res3 = Char:GetMHP();
				Char:ChangeMHp(-1 * res3);
			else
				Char:ChangeMHp(-1 * reDam3);
			end			
			
		end
	end
end
