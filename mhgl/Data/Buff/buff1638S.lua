--只受同伴攻击，方式错误会回满血

function buff1638Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then		
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
		local hp = Char:GetHP();
		local sp = Char:GetSP();
		local rec1 = Char:GetMaxHP();
		local rec2 = Char:GetMaxSP();
		
		local SkillForm = 0;
		local csv = Other:GetSkillCsvData(Other:GetSubType());
		if csv ~= nil then
			SkillForm = csv.form;
		end
		
		if Char:GetTeam() ~= Other:GetTeam() then 
			if Other:IsPlayer() and (reDam1 > 0 or reDam2 > 0) and Char:GetReaction() ~= LuaI.BATCMD_MISS then				
				if reDam1 > 0 then
			--		Char:ResetMHP();
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
end 