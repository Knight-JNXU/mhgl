-----内功效果加成12LV

function buff3021Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING_ATTACKER then
		
		local Dam1 = Other:GetDHP();
		local Dam2 = Other:GetDSP();
		local Dam3 = Other:GetDMHP();
		local Lv = Char:GetLevel();
		
		local DamBonus = {1.1, 1.2, 1.3, 1.4, 0.8, 0.6, 0.4, 0.2, 0.8, 0.6, 0.4, 0.2, 0.1};
		local nDamsBonus = 1;
		local buffid = {3050, 3051, 3052, 3053, 3060, 3061, 3062, 3063, 3070, 3071, 3072, 3073, 3074};
		local k = 1;
		while k <= 13 do
		    if Other:IsBuffExist(buffid[k]) then
	            nDamsBonus = DamBonus[k];
			end
			k = k + 1;
		end
		
		if Other:IsBuffExist(2071) and Other:IsBuffExist(2074) ~= true then
			nDamsBonus = nDamsBonus * 0.7;
		end
		if Other:IsBuffExist(2074) then
			nDamsBonus = nDamsBonus * 0.4;
		end
		if Other:IsBuffExist(1803) then
			nDamsBonus = nDamsBonus * 0.85;
		end
		if Other:IsBuffExist(2057) then
			nDamsBonus = nDamsBonus * 0.8;
		end
		
		local SkillForm = 0;
		local csv = Char:GetSkillCsvData(Char:GetSubType());
		if csv ~= nil then
			SkillForm = csv.form;
		end
		
		if Char:GetTeam() ~= Other:GetTeam() then
			
			if ((Char:GetAction() == LuaI.BATCMD_SKILL or 
				Char:GetAction() == LuaI.BATCMD_CRIT_SKILL) and 
				(SkillForm == 2 or SkillForm == 3 or SkillForm == 4 )) and 
				Other:GetReaction() ~= BATCMD_MISS then
				if Dam1 ~= 0 then
					Other:ResetHP();
					Other:ChangeHp(1.0 * Dam1 - 12 * nDamsBonus * Lv);
				end
				if Dam2 ~= 0 then 
					Other:ResetSP();
					Other:ChangeSp(1.0 * Dam2 - 12 * nDamsBonus * Lv);
				end
				if Dam3 ~= 0 then 
					Other:ResetMHP();
					Other:ChangeMHp(1.0 * Dam3 - 12 * nDamsBonus * Lv);
				end
			end
		else 
			
			if ((Char:GetAction() == LuaI.BATCMD_SKILL or 
				Char:GetAction() == LuaI.BATCMD_CRIT_SKILL) and
				SkillForm == 5) and
				Other:GetReaction() ~= BATCMD_MISS then
				if Dam1 ~= 0 then
					Other:ResetHP();
					Other:ChangeHp(1.0 * Dam1 + 12 * Lv);
				end
				if Dam2 ~= 0 then 
					Other:ResetSP();
					Other:ChangeSp(1.0 * Dam2 + 12 * Lv);
				end
				if Dam3 ~= 0 then 
					Other:ResetMHP();
					Other:ChangeMHp(1.0 * Dam3 + 12 * Lv);
				end
			end
		end
	end	
end
