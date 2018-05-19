--神魔惊天谴

function buff1633Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then
		
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
		local reDam3 = -1 * Char:GetDMHP();
		
		local SkillForm = 0;
		local csv = Other:GetSkillCsvData(Other:GetSubType());
		if csv ~= nil then
			SkillForm = csv.form;
		end
		
		local NowReAtkCount = buff:GetBuffValue2();
		
		if Char:GetTeam() ~= Other:GetTeam() then
			if (Other:GetAction() == LuaI.BATCMD_ATTACK or Other:GetAction() == LuaI.BATCMD_CRIT_ATTACK or 
				((Other:GetAction() == LuaI.BATCMD_SKILL or Other:GetAction() == LuaI.BATCMD_CRIT_SKILL or 
				Otherg:GetAction() == LuaI.BATCMD_SPECIAL) and SkillForm == 1)) and 
				(reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and Char:GetReaction() ~= LuaI.BATCMD_MISS then
				
				if NowReAtkCount < 30 then
					buff:SetBuffValue2(NowReAtkCount + 1); 
				end
				local addsion = 1.15;
				if reDam1 > 0 then
					Char:ResetHP();
					Char:ChangeHp(- addsion * reDam1);
				end
				if reDam2 > 0 then
					Char:ResetSP();
					Char:ChangeSp(- addsion * reDam2);
				end
				if reDam3 > 0 then
					Char:ResetMHP();
					Char:ChangeMHp(- addsion * reDam3);
				end
				if Char:GetHP() == 0 then
					Char:RemoveBuff(1633)
				end
			end
		end
	end
	
	if Type == DO_HITTING_ATTACKER then
		
		local reDam1 = -1 * Other:GetDHP();
		local reDam2 = -1 * Other:GetDSP();
		local reDam3 = -1 * Other:GetDMHP();
		
		local SkillForm = 0;
		local csv = Char:GetSkillCsvData(Char:GetSubType());
		if csv ~= nil then
			SkillForm = csv.form;
		end
		
		if Char:GetTeam() ~= Other:GetTeam() then
			if (Char:GetAction() == LuaI.BATCMD_ATTACK or Char:GetAction() == LuaI.BATCMD_CRIT_ATTACK or 
				((Char:GetAction() == LuaI.BATCMD_SKILL or Char:GetAction() == LuaI.BATCMD_CRIT_SKILL or 
				Char:GetAction() == LuaI.BATCMD_SPECIAL) and SkillForm == 1)) and 
				(reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and Other:GetReaction() ~= LuaI.BATCMD_MISS then
				
				local addsion = 1 + buff:GetBuffValue2() / 100;
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
			end
		end
	end
end
