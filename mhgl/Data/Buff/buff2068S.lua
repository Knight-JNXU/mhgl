--嗜血狂魔

function buff2068Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING_ATTACKER then
		
		local reDam = -1 * Other:GetDHP();
		local Dam = Other:GetFinalValue(-reDam, Char, Char:GetAction(), 1);
		local Lv = Char:GetLevel();
		
		local skillForm = 0;
		local csv = Char:GetSkillCsvData(Char:GetSubType());
		if csv ~= nil then
			skillForm = csv.form;
		end
		
		if (Char:GetAction() == LuaI.BATCMD_ATTACK or Char:GetAction() == LuaI.BATCMD_CRIT_ATTACK or 
			((Char:GetAction() == LuaI.BATCMD_SKILL or Char:GetAction() == LuaI.BATCMD_CRIT_SKILL) and 
			skillForm == 1)) and reDam > 0 and not Char:IsBuffExist(2069) and not Char:IsBuffExist(21067) and
			(Other:HasSkill(268) or Other:HasSkill(306)) ~= true and 
			Other:GetReaction() ~= LuaI.BATCMD_MISS then
			
			Char:ChangeHp(-Dam * 0.25);
			
			if Other:IsBuffExist(1000) or Other:IsBuffExist(1001) or 
				Other:IsBuffExist(1002) or Other:IsBuffExist(1003) then
				
				Char:AddBuff(1003, Lv, 0, 0, 3, 100);
			end
			
		end		
	end	
end
