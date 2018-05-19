--不受7、12号位攻击

function buff1623Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then		
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
		local hp = Char:GetHP();
		local sp = Char:GetSP();
		local rec1 = Char:GetMaxHP();
		local rec2 = Char:GetMaxSP();
		--local weizhi = Other:GetPosition();
		local SkillForm = 0;
		local csv = Other:GetSkillCsvData(Other:GetSubType());
		if csv ~= nil then
			SkillForm = csv.form;
		end
				 
		if (reDam1 > 0 or reDam2 > 0) and Char:GetReaction() ~= LuaI.BATCMD_MISS then	
			if Other:GetPosition() == 7 or Other:GetPosition() == 12 then
		--		Char:ResetMHP();
				Char:ResetHP();
				Char:ResetSP();
				Char:ChangeHp(rec1 - hp);
				Char:ChangeSp(rec2 - sp);
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