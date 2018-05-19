--反物理伤害

function buff3120Active(buff, Char, Other, Type) 

	if Type == TURN_START then
		if Char:GetHP() ~= 0 then
			if Char:GetMHP() < Char:GetMaxHP() then
				Char:ChangeMHp(Char:GetMaxHP()/10);
			end
			if Char:GetHP() < Char:GetMaxHP() then
				Char:ChangeHp(Char:GetMaxHP()/10);
			end
			Char:BuffActive();
		end
	end

	if Type == DO_HITTING then

		local reDam1 = -1 * Char:GetDHP();		
		local reDam2 = -1 * Char:GetDSP();
		local reDam3 = -1 * Char:GetDMHP();		
		local SkillId = 0;
		local skillForm = 0;		
		local csv = Other:GetSkillCsvData(Other:GetSubType());
		if csv ~= nil then
			SkillId = csv.id;
			skillForm = csv.form;
		end		
		if Char:GetTeam() ~= Other:GetTeam() then	
			if (Other:GetAction() == LuaI.BATCMD_ATTACK or Other:GetAction() == LuaI.BATCMD_CRIT_ATTACK or
			((Other:GetAction() == LuaI.BATCMD_SKILL or Other:GetAction() == LuaI.BATCMD_CRIT_SKILL or Other:GetAction() == LuaI.BATCMD_SPECIAL) and
			skillForm == 1 )) and (reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and Char:GetReaction() ~= LuaI.BATCMD_MISS then																																									
				if reDam1 > 0 then
					Char:ResetHP();	
					Other:ChangeHp(-1 * reDam1);
				end
				if reDam2 > 0 then
					Char:ResetSP();	
					Other:ChangeSp(-1 * reDam2);
				end
				if reDam3 > 0 then
					Char:ResetMHP();	
					Other:ChangeMHp(-1 * reDam3);
				end
				Other:SetTempReaction(LuaI.BATCMD_NORM_HIT);
				battle:PushExtraActor(Other);
			elseif (reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and Char:GetReaction() ~= LuaI.BATCMD_MISS then	
				if reDam1 > 0 then
					Char:ResetHP();	
					Char:ChangeHp(-1 * reDam1);
				end
				if reDam2 > 0 then
					Char:ResetSP();
					Char:ChangeSp(-1 * reDam2);
				end
				if reDam3 > 0 then
					Char:ResetMHP();
					Char:ChangeMHp(-1 * reDam3);
				end
			end
		end
	end
end
				
				
	


	

