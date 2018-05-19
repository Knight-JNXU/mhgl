

function buff0800Active(buff, Char, Other, Type)
	
	if Type == TURN_END then
		
		local i = buff:GetBuffValue2();
		i = i + 1;
		buff:SetBuffValue2(i);
		if i >= 3 then
			Char:RemoveBuff(800);
		end		
		Char:BuffActive();
	end
	
	if Type == DO_HITTING then
		
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
		
		local skillForm = 0;
		local csv = Other:GetSkillCsvData(Other:GetSubType());
		if csv ~= nil then
			skillForm = csv.form;
		end
		
		if Char:GetTeam() ~= Other:GetTeam() then 
			if Other:IsPlayer() or Other:IsParnter() or Other:IsMob() or Other:IsBoss() and (reDam1 > 0 or reDam2 > 0) and Char:GetReaction() ~= LuaI.BATCMD_MISS then	
			local mofa = Char:GetSP() * 0.5;
			local shanghai = reDam1 * 0.5;
				if mofa > shanghai then
				    --Char:ResetMHP();
					Char:ResetHP();					
					Char:ChangeHp(-1*shanghai);
					Char:ResetSP();					
					Char:ChangeSp(-1*shanghai);
				else
			--		Char:ResetMHP();
					Char:ResetHP();					
					Char:ChangeHp(-1*reDam1);
				end
				if reDam2 > 0 then
					Char:ResetSP();								
					Char:ChangeSp(-1*reDam2);
				end							
	    end		
		end		
	end		
end	
