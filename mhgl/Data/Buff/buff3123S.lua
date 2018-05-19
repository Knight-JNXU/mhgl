--嗜血狂魔

function buff3123Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then		
		
		local reDam = -1 * Char:GetDHP();
		
		local SkillElement = 0;
		local csv = Other:GetSkillCsvData(Other:GetSubType());
		if csv ~= nil then
			SkillElement = csv.skill_UseElement;
		end
		
		if ((Other:GetAction() == LuaI.BATCMD_SKILL or 
			Other:GetAction() == LuaI.BATCMD_CRIT_SKILL) and 
			SkillElement == 3 ) and reDam > 0 and 
			Char:GetReaction() ~= LuaI.BATCMD_MISS then
			
			Char:ResetHP();	
			Char:ChangeHp(reDam);
			
		end
	end
	
	if Type == DO_HITTING_ATTACKER then
		
		local reDam = -1 * Other:GetDHP();		
		local Lv = Char:GetLevel();		
		local csv = Char:GetSkillCsvData(Char:GetSubType());
		if csv ~= nil then
			skillForm = csv.form;
			skillId = csv.id;
		end
		
		if (Char:GetAction() == LuaI.BATCMD_ATTACK or Char:GetAction() == LuaI.BATCMD_CRIT_ATTACK or 
			(Char:GetAction() == LuaI.BATCMD_SKILL or Char:GetAction() == LuaI.BATCMD_CRIT_SKILL) and skillId == 5252) and reDam > 0 and 
			Other:GetReaction() ~= LuaI.BATCMD_MISS then
			
			if math.random(1, 100) <= 30 then
				Char:AddBuff(3124, Lv, 0, 0, 120, 100);
			end						
		end		
	end	
end
