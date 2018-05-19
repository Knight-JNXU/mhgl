--真·嗜血狂魔

function buff2069Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING_ATTACKER then
		
		local reDam = -1 * Other:GetDHP();
		local Dam = Other:GetFinalValue(-reDam, Char, Char:GetAction(), 1);
		
		local skillForm = 0;
		local csv = Char:GetSkillCsvData(Char:GetSubType());
		if csv ~= nil then
			skillForm = csv.form;
		end
		
		if (Char:GetAction() == LuaI.BATCMD_ATTACK or Char:GetAction() == LuaI.BATCMD_CRIT_ATTACK or 
			((Char:GetAction() == LuaI.BATCMD_SKILL or Char:GetAction() == LuaI.BATCMD_CRIT_SKILL) and 
			skillForm == 1)) and reDam > 0 and 
			(Other:HasSkill(268) or Other:HasSkill(306)) ~= true and 
			Other:GetReaction() ~= LuaI.BATCMD_MISS then
			
			Char:ChangeHp(-Dam * 0.3);
			
		end
	end	
end
