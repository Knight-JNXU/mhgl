--冰盾(玉冰障)

function buff1815Active(buff, Char, Other, Type) 
	if Type == DO_HITTING then
		
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
		local reDam3 = -1 * Char:GetDMHP();
		
		local SkillForm = 0;
		local csv = Other:GetSkillCsvData(Other:GetSubType());
		if csv ~= nil then
			SkillForm = csv.form;
		end
		
		if Char:GetTeam() ~= Other:GetTeam() then
			
			if (Other:GetAction() == LuaI.BATCMD_ATTACK or 
				Other:GetAction() == LuaI.BATCMD_CRIT_ATTACK or 
				((Other:GetAction() == LuaI.BATCMD_SKILL or 
				Other:GetAction() == LuaI.BATCMD_CRIT_SKILL or Other:GetAction() == LuaI.BATCMD_SPECIAL) and SkillForm == 1)) and 
				(reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and 
				Char:GetReaction() ~= LuaI.BATCMD_MISS then
				
				local XXatkDam1 = buff:GetBuffValue1() + buff:GetBuffValue2();
				local XXatkDam2 = buff:GetBuffValue1() + buff:GetBuffValue2();
				local XXatkDam3 = buff:GetBuffValue1() + buff:GetBuffValue2();
			
				local atkDam1 = math.max(XXatkDam1, 0.85 * reDam1 / 3);
				local atkDam2 = math.max(XXatkDam2, 0.85 * reDam2 / 3);
				local atkDam3 = math.max(XXatkDam3, 0.85 * reDam3 / 3);
				
				if Char:GetHP() ~= 0 then
					if Other:IsMob() then
						if Other:GetMob_id() ~= 10493 then
							if reDam1 > 0 and math.random(1, 100) < 54 then
								Other:ChangeHp(-1 * atkDam1);
							end
							if reDam2 > 0 and math.random(1, 100) < 54 then
								Other:ChangeSp(-1 * atkDam2);
							end
							if reDam3 > 0 and math.random(1, 100) < 54 then
								Other:ChangeMHp(-1 * atkDam3);
							end
						else
							if reDam1 > 0 then
								Other:ChangeHp(-1 * atkDam1);
							end
							if reDam2 > 0 then
								Other:ChangeSp(-1 * atkDam2);
							end
							if reDam3 > 0 then
								Other:ChangeMHp(-1 * atkDam3);
							end
						end
					else
						if reDam1 > 0 and math.random(1, 100) < 54 then
							Other:ChangeHp(-1 * atkDam1);
						end
						if reDam2 > 0 and math.random(1, 100) < 54 then
							Other:ChangeSp(-1 * atkDam2);
						end
						if reDam3 > 0 and math.random(1, 100) < 54 then
							Other:ChangeMHp(-1 * atkDam3);
						end
					end
				end
			end
		end
	end
end
