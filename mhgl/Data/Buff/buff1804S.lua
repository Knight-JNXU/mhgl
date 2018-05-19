--毒砂护体(鬼门阵)

function buff1804Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then
		
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
		local reDam3 = -1 * Char:GetDMHP();
		
		local SkillForm = 0;
		local csv = Other:GetSkillCsvData(Other:GetSubType());
		if csv ~= nil then
			SkillForm = csv.form;
		end
		
		local NowReAtkCount = buff:GetBuffValue2();
		
		local SkillLv = buff:GetBuffValue1();
		if Char:GetTeam() ~= Other:GetTeam() then			
			if (Other:GetAction() == LuaI.BATCMD_ATTACK or
				Other:GetAction() == LuaI.BATCMD_CRIT_ATTACK or
				((Other:GetAction() == LuaI.BATCMD_SKILL or Other:GetAction() == LuaI.BATCMD_CRIT_SKILL or Other:GetAction() == LuaI.BATCMD_SPECIAL)
				and SkillForm == 1)) and
				(reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and (Other:IsBuffExist(1001) ~= true) and
				Char:GetReaction() ~= LuaI.BATCMD_MISS then
				
				Other:AddBuff(1001, SkillLv, 0, 0, 4, 100);
				buff:SetBuffValue2(NowReAtkCount - 1); 
				if buff:GetBuffValue2() == 0 then
					Char:RemoveBuff(1804);
				end				
			end
		end
	end
end
