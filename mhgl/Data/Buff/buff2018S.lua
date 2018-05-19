--附毒攻击(毒蛇吐信)

function buff2018Active(buff, Char, Other, Type)
	
	if Type == DO_HITTING_ATTACKER then
		
		local reDam1 = -1 * Other:GetDHP();
		local reDam2 = -1 * Other:GetDSP();
		local reDam3 = -1 * Other:GetDMHP();
		
		local skillForm = 0;
		local csv = Char:GetSkillCsvData(Char:GetSubType());
		if csv ~= nil then
			skillForm = csv.form;
		end
		
		if (Char:GetAction() == LuaI.BATCMD_ATTACK or Char:GetAction() == LuaI.BATCMD_CRIT_ATTACK or 
			((Char:GetAction() == LuaI.BATCMD_SKILL or Char:GetAction() == LuaI.BATCMD_CRIT_SKILL) and 
			skillForm == 1 )) and (reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and 
			Other:GetReaction() ~= LuaI.BATCMD_MISS then
			
			local Lv = Char:GetLevel();
			if math.random(1, 100) <= 15 and 
				Other:GetHP() ~= 0 and Other:IsBuffExist(1003) == false then
				
				Other:AddBuff(1003, Lv, 0, 0, 3, 100);
			end
		end
	end
end
