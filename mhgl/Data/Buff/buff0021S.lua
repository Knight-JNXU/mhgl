--对敌伤害+10%速度+10%(阵法)

function buff0021Attri(Char, buff, Attri)
	
	Attri:SetSpd(Attri:GetSpd() * 1.1);
	
end

function buff0021Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING_ATTACKER then		
		if Other:GetTeam() ~= Char:GetTeam() then
			local reDam1 = -1 * Other:GetDHP();
			local reDam2 = -1 * Other:GetDSP();
			local reDam3 = -1 * Other:GetDMHP();
			
			local SkillForm = 0;
			local csv = Char:GetSkillCsvData(Char:GetSubType());
			if csv ~= nil then
				SkillForm = csv.form;
			end
			
			if (Char:GetAction() == LuaI.BATCMD_ATTACK or Char:GetAction() == LuaI.BATCMD_CRIT_ATTACK or 
				((Char:GetAction() == LuaI.BATCMD_SKILL or Char:GetAction() == LuaI.BATCMD_CRIT_SKILL or Char:GetAction() == LuaI.BATCMD_SPECIAL) and 
				(SkillForm == 1 or SkillForm == 2))) and (reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and 
				Other:GetReaction() ~= LuaI.BATCMD_MISS then
				
				if reDam1 > 0 then
					Other:ResetHP();		
					reDam1 = reDam1 * 1.1;
					Other:ChangeHp(-1 * reDam1);
				end
				if reDam2 > 0 then
					Other:ResetSP();
					reDam2 = reDam2 * 1.1;
					Other:ChangeSp(-1 * reDam2);
				end
				if reDam3 > 0 then
					Other:ResetMHP();
					reDam3 = reDam3 * 1.1;
					Other:ChangeMHp(-1 * reDam3);
				end
			end
		end
	end
end
