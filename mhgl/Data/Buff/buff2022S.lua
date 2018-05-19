-----内功伤害修正(罗浮玄奇)

function buff2022Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING_ATTACKER then
	
		local Dam1 = -1 * Other:GetDHP();
		local Dam2 = -1 * Other:GetDSP();
		local Dam3 = -1 * Other:GetDMHP();
		
		local SkillForm = 0;
		local csv = Char:GetSkillCsvData(Char:GetSubType());
		if csv ~= nil then
			SkillForm = csv.form;
		end
		
		if ((Char:GetAction() == LuaI.BATCMD_SKILL or 
			Char:GetAction() == LuaI.BATCMD_CRIT_SKILL) and SkillForm == 2 ) and 
			(Dam1 > 0 or Dam2 > 0 or Dam3 > 0) and 
			Other:GetReaction() ~= LuaI.BATCMD_MISS then
			
			if Dam1 > 0 then
				Other:ResetHP();
				Other:ChangeHp(-1.1 * Dam1);
			end
			if Dam2 > 0 then
				Other:ResetSP();
				Other:ChangeSp(-1.1 * Dam2);
			end
			if Dam3 > 0 then
				Other:ResetMHP();
				Other:ChangeMHp(-1.1 * Dam3);
			end
		end
	end	
end
