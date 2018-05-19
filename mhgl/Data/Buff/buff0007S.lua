--受到+10%对敌伤害+15%（阵法）

function buff0007Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then		
		
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
		local reDam3 = -1 * Char:GetDMHP();
		
		local SkillForm = 0;
		local csv = Other:GetSkillCsvData(Other:GetSubType());
		if csv ~= nil then
			SkillForm = csv.form;
		end
		
		if (Other:GetAction() == LuaI.BATCMD_ATTACK or Other:GetAction() == LuaI.BATCMD_CRIT_ATTACK or 
			((Other:GetAction() == LuaI.BATCMD_SKILL or Other:GetAction() == LuaI.BATCMD_CRIT_SKILL or Other:GetAction() == LuaI.BATCMD_SPECIAL) and 
			(SkillForm == 1 or SkillForm == 2))) and (reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and	
			Char:GetReaction() ~= LuaI.BATCMD_MISS then
			
			if reDam1 > 0 then
				Char:ResetHP();	
				reDam1 = reDam1 * 1.1;
				Char:ChangeHp(-1 * reDam1);
			end
			if reDam2 > 0 then
				Char:ResetSP();
				reDam2 = reDam2 * 1.1;
				Char:ChangeSp(-1 * reDam2);
			end
			if reDam3 > 0 then
				Char:ResetMHP();
				reDam3 = reDam3 * 1.1;
				Char:ChangeMHp(-1 * reDam3);
			end
		end
	end
	
	if Type == DO_HITTING_ATTACKER then		
		if Other:GetTeam() ~= Char:GetTeam() then
			local Dam1 = -1 * Other:GetDHP();
			local Dam2 = -1 * Other:GetDSP();
			local Dam3 = -1 * Other:GetDMHP();
			
			local SkillForm = 0;
			local csv = Char:GetSkillCsvData(Char:GetSubType());
			if csv ~= nil then
				SkillForm = csv.form;
			end
			
			if (Char:GetAction() == LuaI.BATCMD_ATTACK or Char:GetAction() == LuaI.BATCMD_CRIT_ATTACK or 
				((Char:GetAction() == LuaI.BATCMD_SKILL or Char:GetAction() == LuaI.BATCMD_CRIT_SKILL or Char:GetAction() == LuaI.BATCMD_SPECIAL) and 
				(SkillForm == 1 or SkillForm == 2))) and (Dam1 > 0 or Dam2 > 0 or Dam3 > 0) and 
				Other:GetReaction() ~= LuaI.BATCMD_MISS then
				
				if Dam1 > 0 then
					Other:ResetHP();		
					Dam1 = Dam1 * 1.15;
					Other:ChangeHp(-1 * Dam1);
				end
				if Dam2 > 0 then
					Other:ResetSP();
					Dam2 = Dam2 * 1.15;
					Other:ChangeSp(-1 * Dam2);
				end
				if Dam3 > 0 then
					Other:ResetMHP();
					Dam3 = Dam3 * 1.15;
					Other:ChangeMHp(-1 * Dam3);
				end
			end
		end
	end
end
