--调息(迎风一刀斩)

function buff1302Attri(Char, buff, Attri) 
	Attri:SetSpd(Attri:GetSpd() + 3000);
end

function buff1302Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then
		
		if Char:GetTeam() ~= Other:GetTeam() then
			
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
				Other:GetAction() == LuaI.BATCMD_CRIT_SKILL or Other:GetAction() == LuaI.BATCMD_SPECIAL) and (SkillForm == 1 or SkillForm == 2))) and 
				(reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and 
				Char:GetReaction() ~= LuaI.BATCMD_MISS then 
				Char:ResetMHP();
				Char:ResetHP();
				Char:ResetSP();
				Char:ChangeHp(-1 * reDam1 / 2);
				Char:ChangeSp(-1 * reDam2 / 2);
				Char:ChangeMHp(-1 * reDam3 / 2);			
			end
		end
	end	
end
