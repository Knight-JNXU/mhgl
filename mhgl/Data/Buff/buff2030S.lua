--水吸收木伤害(天地无边 )

function buff2030Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then		
		
		local reDam = -1 * Char:GetDHP();
		
		local SkillElement = 0;
		local csv = Other:GetSkillCsvData(Other:GetSubType());
		if csv ~= nil then
			SkillElement = csv.skill_UseElement;
		end
		
		local Rate = 30;
		
		if ((Other:GetAction() == LuaI.BATCMD_SKILL or 
			Other:GetAction() == LuaI.BATCMD_CRIT_SKILL) and 
			SkillElement == 3 ) and reDam > 0 and 
			Char:GetReaction() ~= LuaI.BATCMD_MISS then
			
			if math.random(1, 100) <= Rate then
		--		Char:ResetMHP();
				Char:ResetHP();			
				--Char:ChangeHp(reDam);
			else 
				if 0.85 * reDam < 1 then
					reDam = 1 / 0.85;
				end
		--		Char:ResetMHP();
				Char:ResetHP();
				Char:ChangeHp(-0.85 * reDam);
			end
		end
	end
end
