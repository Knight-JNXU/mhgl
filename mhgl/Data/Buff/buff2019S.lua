--克复活返魂

function buff2019Active(buff, Char, Other, Type) 
	
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
			(skillForm == 1 or skillForm == 2 or skillForm == 4))) and (reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and 
			not Char:IsBuffExist(2052) and not Char:IsBuffExist(21052) and Other:GetReaction() ~= LuaI.BATCMD_MISS then
			
			if (Other:IsBuffExist(2020) or Other:IsBuffExist(2053) or Other:IsBuffExist(21020) or Other:IsBuffExist(21053)) then
				
				if reDam1 > 0 then
					Other:ResetHP();
					Other:ChangeHp(-1.5 * reDam1);
				end
				if reDam2 > 0 then
					Other:ResetSP();
					Other:ChangeSp(-1.5 * reDam2);
				end
				if reDam3 > 0 then
					Other:ResetMHP();
					Other:ChangeMHp(-1.5 * reDam3);
				end
				if Other:GetHP() == 0 then
					Other:RemoveBuff(2020);
					Other:RemoveBuff(2053);
					Other:RemoveBuff(21020);
					Other:RemoveBuff(21053);
				end
			elseif (Other:IsBuffExist(2021) or Other:IsBuffExist(2054) or Other:IsBuffExist(21021) or Other:IsBuffExist(21054)) then
				if reDam1 > 0 then
					Other:ResetHP();
					Other:ChangeHp(-1.15 * reDam1);
				end
				if reDam2 > 0 then
					Other:ResetSP();
					Other:ChangeSp(-1.15 * reDam2);
				end
				if reDam3 > 0 then
					Other:ResetMHP();
					Other:ChangeMHp(-1.15 * reDam3);
				end
			end
		end
	end	
end
