--扼逆众伤

function buff2077Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then
		
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
		local reDam3 = -1 * Char:GetDMHP();
		
		local skillForm = 0;
		local csv = Other:GetSkillCsvData(Other:GetSubType());
		if csv ~= nil then
			skillForm = csv.form;
		end
		
		if (Other:GetAction() == LuaI.BATCMD_ATTACK or Other:GetAction() == LuaI.BATCMD_CRIT_ATTACK or
			((Other:GetAction() == LuaI.BATCMD_SKILL or Other:GetAction() == LuaI.BATCMD_CRIT_SKILL or Other:GetAction() == LuaI.BATCMD_SPECIAL) and
			(skillForm == 1 or skillForm == 2))) and 
			(reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and 
			Char:GetReaction() ~= LuaI.BATCMD_MISS then
			
			local Rate = (Char:GetHP() + reDam1) / Char:GetMaxHP();
			if Rate > 1 then
				Rate = 1;
			end
			local DamRate = 1 - math.floor((1 - Rate) / 0.2) * 0.03;
			if reDam1 > 0 then
				Char:ResetHP();	
				reDam1 = reDam1 * DamRate;
				Char:ChangeHp(-1 * reDam1);
			end
			if reDam2 > 0 then
				Char:ResetSP();
				reDam2 = reDam2 * DamRate;
				Char:ChangeSp(-1 * reDam2);
			end
			if reDam3 > 0 then
				Char:ResetMHP();
				reDam3 = reDam3 * DamRate;
				Char:ChangeMHp(-1 * reDam3);
			end
		end
	end
end
