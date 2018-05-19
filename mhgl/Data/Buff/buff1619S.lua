--只受8、13号位攻击

function buff1619Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then		
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
		--local weizhi = Other:GetPosition();
		local SkillForm = 0;
		local csv = Other:GetSkillCsvData(Other:GetSubType());
		if csv ~= nil then
			SkillForm = csv.form;
		end
				 
		if (reDam1 > 0 or reDam2 > 0) and Char:GetReaction() ~= LuaI.BATCMD_MISS then	
			if Other:GetPosition() ~= 8 and Other:GetPosition() ~= 13 then
		--		Char:ResetMHP();
				Char:ResetHP();
				Char:ResetSP();
			else
		--		Char:ResetMHP();
				Char:ResetHP();
				Char:ResetSP();
				Char:ChangeHp(-1 * reDam1);
				Char:ChangeSp(-1 * reDam2);
			end
		end
	end
end 