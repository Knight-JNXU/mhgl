--流云叠影(12侠客)

function buff1900Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING_ATTACKER and Char:GetOwner():GetSkillHide(1251) == 0 then
		
		local reDam1 = -1 * Other:GetDHP();
		local reDam2 = -1 * Other:GetDSP();
		local reDam3 = -1 * Other:GetDMHP();
		
		local SkillForm = 0;
		local csv = Char:GetSkillCsvData(Char:GetSubType());
		if csv ~= nil then
			SkillForm = csv.form;
		end
		
		local NowReAtkCount = buff:GetBuffValue2();
		
		if Char:GetTeam() ~= Other:GetTeam() then
			if ((Char:GetAction() == LuaI.BATCMD_SKILL or Char:GetAction() == LuaI.BATCMD_CRIT_SKILL or 
				Char:GetAction() == LuaI.BATCMD_SPECIAL) and SkillForm == 2) and 
				(reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and Other:GetReaction() ~= LuaI.BATCMD_MISS then
				
				local addsion = 1 + NowReAtkCount / 100;
				if reDam1 > 0 then
					Other:ResetHP();
					Other:ChangeHp(- addsion * reDam1);
				end
				if reDam2 > 0 then
					Other:ResetSP();
					Other:ChangeSp(- addsion * reDam2);
				end
				if reDam3 > 0 then
					Other:ResetMHP();
					Other:ChangeMHp(- addsion * reDam3);
				end
				if NowReAtkCount < 30 then
					buff:SetBuffValue2(NowReAtkCount + 1); 
				end				
				if Char:GetHP() == 0 then
					buff:SetBuffValue2(0); 
				end
			end
		end
	end
end
