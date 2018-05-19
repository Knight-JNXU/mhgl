--毒砂护体(鬼门阵)

function buff0013Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then
		
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
		local reDam3 = -1 * Char:GetDMHP();
		local reDam4 = -1 * Char:GetDMSP();
		
		local animation = 0;
		local csv = Other:GetSkillCsvData(Other:GetSubType());
		if csv ~= nil then
			animation = csv.animation_Type;
		end
		
		local NowReAtkCount = buff:GetBuffValue2();
		
		if Char:GetTeam() ~= Other:GetTeam() then			
			if (Other:GetAction() == LuaI.BATCMD_ATTACK or
				Other:GetAction() == LuaI.BATCMD_CRIT_ATTACK or
				(Other:GetAction() == LuaI.BATCMD_SKILL and animation == 2)) and
				(reDam1 > 0 or reDam2 > 0 or reDam3 > 0 or reDam4 > 0) and
				Char:GetReaction() ~= LuaI.BATCMD_MISS then
				
				Other:AddBuff(14, 0, 0, 0, 2, 100);
				buff:SetBuffValue2(NowReAtkCount - 1);				
				if buff:GetBuffValue2() == 0 then
					Char:RemoveBuff(13);
				end				
			end
		end
	end
end
