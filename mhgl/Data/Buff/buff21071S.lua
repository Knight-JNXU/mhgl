----真·暗夜破

function buff21071Active(buff, Char, Other, Type) 
	
	if Char:GetTeam() ~= Other:GetTeam() and LuaI.GetGameTime(0) == 1 then
		
		if Type == DO_HITTING_ATTACKER then
			
			local Dam1 = Other:GetDHP();
			local Dam2 = Other:GetDSP();
			local Dam3 = Other:GetDMHP();
			
			local skillForm = 0;
			local csv = Char:GetSkillCsvData(Char:GetSubType());
			if csv ~= nil then
				skillForm = csv.form;
			end
			
			if (Char:GetAction() == LuaI.BATCMD_ATTACK or Char:GetAction() == LuaI.BATCMD_CRIT_ATTACK or 
				((Char:GetAction() == LuaI.BATCMD_SKILL or Char:GetAction() == LuaI.BATCMD_CRIT_SKILL) and 
				skillForm == 1)) and (Dam1 < 0 or Dam2 < 0 or Dam3 < 0) and Other:GetReaction() ~= LuaI.BATCMD_MISS then
				
				Other:ResetMHP();				
				Other:ResetHP();
				Other:ResetSP();
				Other:ChangeHp(1.15 * Dam1);
				Other:ChangeSp(1.15 * Dam2);
				Other:ChangeMHp(1.15 * Dam3);
			end 
		end	
		
		if Type == DO_HITTING then
			
			local reDam1 = -1 * Char:GetDHP();
			local reDam2 = -1 * Char:GetDSP();
			local reDam3 = -1 * Char:GetDMHP();
			
			local SkillForm = 0;
			local csv = Other:GetSkillCsvData(Other:GetSubType());
			if csv ~= nil then
				SkillForm = csv.form;
			end
			
			if (Other:GetAction() == LuaI.BATCMD_ATTACK or 
				Other:GetAction() == LuaI.BATCMD_CRIT_ATTACK or 
				((Other:GetAction() == LuaI.BATCMD_SKILL or 
				Other:GetAction() == LuaI.BATCMD_CRIT_SKILL or Other:GetAction() == LuaI.BATCMD_SPECIAL) and SkillForm == 1)) and 
				Char:GetReaction() ~= LuaI.BATCMD_MISS then
				
				if reDam1 > 0 then
					if 0.925 * reDam1 < 1 then
						reDam1 = 1 / 0.925;
					end
					Char:ResetHP();
					Char:ChangeHp(-0.925 * reDam1);
				end
				if reDam2 > 0 then
					if 0.925 * reDam2 < 1 then
						reDam2 = 1 / 0.925;
					end
					Char:ResetSP();
					Char:ChangeSp(-0.925 * reDam2);
				end
				if reDam3 > 0 then
					if 0.925 * reDam3 < 1 then
						reDam3 = 1 / 0.925;
					end
					Char:ResetMHP();
					Char:ChangeMHp(-0.925 * reDam3);
				end
			end
		end
	end	
end
