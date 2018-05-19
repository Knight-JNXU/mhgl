--受到-5%速度+10%(阵法)

function buff0006Attri(Char, buff, Attri)
	
	Attri:SetSpd(Attri:GetSpd() * 1.1);
	
end

function buff0006Active(buff, Char, Other, Type) 
	
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
				reDam1 = reDam1 * 0.95;
				Char:ChangeHp(-1 * reDam1);
			end
			if reDam2 > 0 then
				Char:ResetSP();
				reDam2 = reDam2 * 0.95;
				Char:ChangeSp(-1 * reDam2);
			end
			if reDam3 > 0 then
				Char:ResetMHP();
				reDam3 = reDam3 * 0.95;
				Char:ChangeMHp(-1 * reDam3);
			end
		end
	end
end
