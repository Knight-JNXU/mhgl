--10回合后自动死亡

function buff63522Active(buff, Char, Other, Type)
	
	if Type == DO_ACTION then
		local Eflag = 0;
		local i = buff:GetBuffValue2();
		if Char:GetHP() > 0 then
			if i >= 10 then
				Eflag = 1;
				Char:InputCommand(LuaI.BATCMD_ESCAPE, 0, 0, 0);
			else
				i = i + 1;
				buff:SetBuffValue2(i);
			end
		end
	end
	
	if Type == DO_HITTING_ATTACKER then
		
		local Dam1 = Other:GetDHP();
		local Dam2 = Other:GetDSP();
		local Dam3 = Other:GetDMHP();
		
		local skillForm = 0;
		local csv = Char:GetSkillCsvData(Char:GetSubType());
		if csv ~= nil then
			skillForm = csv.form;
		end
		
		if ((Char:GetAction() == LuaI.BATCMD_SKILL or Char:GetAction() == LuaI.BATCMD_CRIT_SKILL) and 
			skillForm == 5) and Other:GetReaction() ~= LuaI.BATCMD_MISS then
			
			Other:ResetMHP();
			Other:ResetHP();
		--	Other:ResetSP();
			Other:ChangeHp(0.7 * Dam1);
		--	Other:ChangeSp(0.7 * Dam2);
			Other:ChangeMHp(0.7 * Dam3);
		end
	end
end
