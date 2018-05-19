--吸收同伴伤害

function buff0298Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then		
		
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
		
		local skillForm = 0;
		local csv = Other:GetSkillCsvData(Other:GetSubType());
		if csv ~= nil then
			skillForm = csv.form;
		end
		
		if Char:GetTeam() ~= Other:GetTeam() then 
			if Other:IsParnter() and (reDam1 > 0 or reDam2 > 0) and Char:GetReaction() ~= LuaI.BATCMD_MISS then				
				if reDam1 > 0 then
			--		Char:ResetMHP();
					Char:ResetHP();					
					Char:ChangeHp(reDam1);
				end
				if reDam2 > 0 then
					Char:ResetSP();								
					Char:ChangeSp(reDam2);
				end							
			end	
		end
	end
end
