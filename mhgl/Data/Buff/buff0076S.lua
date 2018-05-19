--ƒ⁄…À(¥Û ÷”°)

function buff0076Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING_ATTACKER then		
		local Dam1 = -1 * Other:GetDHP();
		local Dam2 = -1 * Other:GetDSP();
		local Dam3 = -1 * Other:GetDMHP();
		
		local SkillForm = 0;
		local csv = Char:GetSkillCsvData(Char:GetSubType());
		if csv ~= nil then
			SkillForm = csv.form;
		end
		
		if Char:GetAction() == LuaI.BATCMD_SKILL and SkillForm == 2 then
			
			local i = math.random(8, 10) / 10;
			Other:ResetHP();
			Other:ResetSP();
			Other:ResetMHP();
			Other:ChangeHp(-i * Dam1);
			Other:ChangeSp(-i * Dam2);
			Other:ChangeMHp(-i * Dam3);
		end
	end	
end