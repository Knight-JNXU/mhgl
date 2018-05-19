--自动清除减益(真佛降临 )

function buff21012Active(buff, Char, Other, Type) 
	
	if Type == TURN_END then		
		if Char:GetHP() ~= 0 then	
			local buffID = {1000, 1001, 1002, 1003, 1004, 1005, 1100, 1101, 1102, 1103, 1104, 1105, 1106, 1107, 
							1108, 1109, 1110, 1111, 1112, 1113, 1114, 1115, 1116, 1117, 1118, 1119, 1120, 1121, 
							1400, 1403, 1404, 1405, 1406, 1407, 1408, 1409, 1410, 3096, 3098, 3099, -1}			
			local i = 1;
			while buffID[i] > 0 do
				Char:RemoveBuff(buffID[i]);
				i = i + 1;
			end
		end
	end
	
	if Type == DO_HITTING_ATTACKER then
		
		local reDam1 = -1 * Other:GetDHP();
		local reDam2 = -1 * Other:GetDSP();
		local reDam3 = -1 * Other:GetDMHP();
		
		local skillForm = 0;
		local csv = Char:GetSkillCsvData(Char:GetSubType());
		if csv ~= nil then
			skillForm = csv.form;
		end
		
		if ((Char:GetAction() == LuaI.BATCMD_SKILL or Char:GetAction() == LuaI.BATCMD_CRIT_SKILL) and 
			skillForm == 2) and Char:IsBuffExist(2017) ~= true and Char:IsBuffExist(2050) ~= true and 
			Char:IsBuffExist(2025) ~= true and Char:IsBuffExist(2058) ~= true and 
			and Char:IsBuffExist(21017) ~= true and Char:IsBuffExist(21050) ~= true and 
			Char:IsBuffExist(21025) ~= true and Char:IsBuffExist(21058) ~= true and 
			--(reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and 
			Other:GetReaction() ~= LuaI.BATCMD_MISS then
			
			if reDam1 > 0 then
				if 0.95 * reDam1 < 1 then
					reDam1 = 1 / 0.95;
				end
				Other:ResetHP();
				Other:ChangeHp(-0.95 * reDam1);
			end
			if reDam2 > 0 then
				if 0.95 * reDam2 < 1 then
					reDam2 = 1 / 0.95;
				end
				Other:ResetSP();
				Other:ChangeSp(-0.95 * reDam2);
			end
			if reDam3 > 0 then
				if 0.95 * reDam3 < 1 then
					reDam3 = 1 / 0.95;
				end
				Other:ResetMHP();
				Other:ChangeMHp(-0.95 * reDam3);
			end
		end
	end	
end
