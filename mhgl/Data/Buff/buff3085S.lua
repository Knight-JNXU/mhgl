--2回合后自动复活

function buff3085Active(buff, Char, Other, Type) 
	
	if Type == TURN_END then
		local i = buff:GetBuffValue2();
		
		if Char:GetHP() == 0 then
			if i >= 2 then
				local rec = Char:GetMaxHP();
				Char:ChangeHp(rec);
				Char:RemoveBuff(3085);
			else
				i = i + 1;
				buff:SetBuffValue2(i);
			end
		end
		Char:BuffActive();
	end	
	
	if Type == DO_HITTING then
		
		if (Other:GetAction() == LuaI.BATCMD_ITEM or 
			Other:GetAction() == LuaI.BATCMD_SKILL) and 
			Char:GetHP() == 0 then
			
			Char:ResetHP();	
		end
	end
end