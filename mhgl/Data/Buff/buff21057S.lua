--高级全状态免疫(真丹心术 )

function buff21057Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
		local reDam3 = -1 * Char:GetDMHP();
		
		local SkillForm = 0;
		local csv = Other:GetSkillCsvData(Other:GetSubType());
		if csv ~= nil then
			SkillForm = csv.form;
		end
		
		if (Other:GetAction() == LuaI.BATCMD_ATTACK or Other:GetAction() == LuaI.BATCMD_CRIT_ATTACK or 
			((Other:GetAction() == LuaI.BATCMD_SKILL or Other:GetAction() == LuaI.BATCMD_CRIT_SKILL) and 
			(skillForm == 1 or skillForm == 4))) and (reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and 
			Char:GetReaction() ~= LuaI.BATCMD_MISS and (Other:IsBuffExist(2020) or Other:IsBuffExist(2053) or Other:IsBuffExist(21020) or Other:IsBuffExist(21053)) then
			
			if reDam1 > 0 then
				Char:ResetHP();
				Char:ChangeHp(-1.5 * reDam1);
			end
			if reDam2 > 0 then
				Char:ResetSP();
				Char:ChangeSp(-1.5 * reDam2);
			end
			if reDam3 > 0 then
				Char:ResetMHP();
				Char:ChangeMHp(-1.5 * reDam3);
			end	
		elseif ((Other:GetAction() == LuaI.BATCMD_SKILL or 
			Other:GetAction() == LuaI.BATCMD_CRIT_SKILL) and SkillForm == 2 ) and 
			(reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and 
			Char:GetReaction() ~= LuaI.BATCMD_MISS then
			
			if Other:IsBuffExist(2020) or Other:IsBuffExist(2053) or Other:IsBuffExist(21020) or Other:IsBuffExist(21053) then
				if reDam1 > 0 then
					Char:ResetHP();
					Char:ChangeHp(-1.2 * reDam1);
				end
				if reDam2 > 0 then
					Char:ResetSP();
					Char:ChangeSp(-1.2 * reDam2);
				end
				if reDam3 > 0 then
					Char:ResetMHP();
					Char:ChangeMHp(-1.2 * reDam3);
				end
			else
				if reDam1 > 0 then
					if 0.8 * reDam1 < 1 then
						reDam1 = 1 / 0.8;
					end
					Char:ResetHP();
					Char:ChangeHp(-0.8 * reDam1);
				end
				if reDam2 > 0 then
					if 0.8 * reDam2 < 1 then
						reDam2 = 1 / 0.8;
					end
					Char:ResetSP();
					Char:ChangeSp(-0.8 * reDam2);
				end
				if reDam3 > 0 then
					if 0.8 * reDam3 < 1 then
						reDam3 = 1 / 0.8;
					end
					Char:ResetMHP();
					Char:ChangeMHp(-0.8 * reDam3);
				end
			end
		end	
	end
end
