-----高级内功伤害修正(真罗浮玄奇)

function buff21055Active(buff, Char, Other, Type) 
	
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
			
			Other:ResetMHP();
			Other:ResetHP();
			Other:ResetSP();
			Other:ChangeHp(-1.2 * Dam1);
			Other:ChangeSp(-1.2 * Dam2);
			Other:ChangeMHp(-1.2 * Dam3);
		end
	end	
end
