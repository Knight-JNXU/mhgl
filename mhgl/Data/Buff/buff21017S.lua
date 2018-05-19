--防御修正(十三太保横练)

function buff21017Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING_ATTACKER then		
		
		local reDam1 = -1 * Other:GetDHP();
		local reDam2 = -1 * Other:GetDSP();
		local reDam3 = -1 * Other:GetDMHP();
		
		local skillForm = 0;
		local csv = Char:GetSkillCsvData(Char:GetSubType());
		if csv ~= nil then
			skillForm = csv.form;
		end
		
		if ((Char:GetAction() == LuaI.BATCMD_SKILL or Char:GetAction() == LuaI.BATCMD_CRIT_SKILL) and 
			skillForm == 2) and Char:IsBuffExist(2050) ~= true and 
			Char:IsBuffExist(2025) ~= true and Char:IsBuffExist(2058) ~= true and 
			Char:IsBuffExist(21050) ~= true and 
			Char:IsBuffExist(21025) ~= true and Char:IsBuffExist(21058) ~= true and
			Other:GetReaction() ~= LuaI.BATCMD_MISS then 
			
			if reDam1 > 0 then
				if 0.9 * reDam1 < 1 then
					reDam1 = 1 / 0.9;
				end
				Other:ResetHP();
				Other:ChangeHp(-0.9 * reDam1);
			end
			if reDam2 > 0 then
				if 0.9 * reDam2 < 1 then
					reDam2 = 1 / 0.9;
				end
				Other:ResetSP();
				Other:ChangeSp(-0.9 * reDam2);
			end
			if reDam3 > 0 then
				if 0.9 * reDam3 < 1 then
					reDam3 = 1 / 0.9;
				end
				Other:ResetMHP();
				Other:ChangeMHp(-0.9 * reDam3);
			end
		end		
	end	
end
