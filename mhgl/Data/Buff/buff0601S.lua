--吸收30%伤害

function buff0601Active(buff, Char, Other, Type) 
	
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
			((Other:GetAction() == LuaI.BATCMD_SKILL or Other:GetAction() == LuaI.BATCMD_CRIT_SKILL or 
			Other:GetAction() == LuaI.BATCMD_SPECIAL) and (SkillForm == 1 or SkillForm == 2))) and 
			(reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and
			Char:GetReaction() ~= LuaI.BATCMD_MISS then
			
			Char:ResetMHP();
			Char:ResetHP();
			Char:ResetSP();
			Char:ChangeHp(-0.7 * reDam1);
			Char:ChangeSp(-0.7 * reDam2);
			Char:ChangeMHp(-0.7 * reDam3);
		end
	end
end
