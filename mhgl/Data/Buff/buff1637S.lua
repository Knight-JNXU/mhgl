--只受新手技能，方式错误会回满血

function buff1637Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then		
		local reDam = -1 * Char:GetDHP();
		local hp = Char:GetHP();		
		local rec = Char:GetMaxHP();		
		
		local SkillID = 0;
		local csv = Other:GetSkillCsvData(Other:GetSubType());
		if csv ~= nil then
			SkillID = csv.id;
		end
		
		if Char:GetTeam() ~= Other:GetTeam() then 
			if Other:GetAction() == LuaI.BATCMD_SKILL and (SkillID == 401 or SkillID == 421 or
			SkillID == 441 or SkillID == 461) and reDam > 0 and Char:GetReaction() ~= LuaI.BATCMD_MISS then
			--	Char:ResetMHP();
				Char:ResetHP();
				Char:ChangeHp(-1 * reDam);
			else
			--	Char:ResetMHP();
				Char:ResetHP();
				Char:ChangeHp(rec - hp);
			end	
		end
	end
end
