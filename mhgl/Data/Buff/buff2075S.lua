--匿影藏行(遁形)

function buff2075Active(buff, Char, Other, Type) 

	if Type == DO_HITTING_ATTACKER then
		--判断DP有否增加      待程序suport
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
			skillForm == 1)) and Char:IsBuffExist(2003) ~= true and 
			Char:IsBuffExist(2076) ~= true and Char:IsBuffExist(2036) ~= true and
			Char:IsBuffExist(21003) ~= true and Char:IsBuffExist(21036) ~= true and 
			Other:GetReaction() ~= LuaI.BATCMD_MISS then 
			
			if reDam1 > 0 then
				if 0.8 * reDam1 < 1 then
					reDam1 = 1 / 0.8;
				end
				Other:ResetHP();
				Other:ChangeHp(-0.8 * reDam1);
			end
			if reDam2 > 0 then
				if 0.8 * reDam2 < 1 then
					reDam2 = 1 / 0.8;
				end
				Other:ResetSP();
				Other:ChangeSp(-0.8 * reDam2);
			end
			if reDam3 > 0 then
				if 0.8 * reDam3 < 1 then
					reDam3 = 1 / 0.8;
				end
				Other:ResetMHP();
				Other:ChangeMHp(-0.8 * reDam3);
			end
		end 
	end
end
