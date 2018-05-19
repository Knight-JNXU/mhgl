--蝎子毒

function buff1531Active(buff, Char, Other, Type) 
	if Type == DO_HITTING then		
		local rec1 = -1 * Char:GetDHP();
		local rec3 = -1 * Char:GetDMHP();
		
		if Char:GetTeam() == Other:GetTeam() and Char:GetHP() + rec1 ~= 0 then
			if (Other:GetAction() == LuaI.BATCMD_SKILL or 
				Other:GetAction() == LuaI.BATCMD_SPECIAL or 
				Other:GetAction() == LuaI.BATCMD_ITEM or 
				Char:GetAction() == LuaI.BATCMD_SKILL or 
				Char:GetAction() == LuaI.BATCMD_SPECIAL or 
				Char:GetAction() == LuaI.BATCMD_ITEM) and 
				(rec1 < 0 or rec3 < 0) then
				
				Char:ResetHP();
				Char:ResetMHP();				
			end
		end
	end
	
	
	if Type == TURN_START then
		local i = buff:GetBuffValue2();
		i = i + 1;
		buff:SetBuffValue2(i);
		local charhp = Char:GetHP();
		if charhp ~= 0 then
			local DotDam1 = Char:GetMaxHP() * 0.34;
			
			if DotDam1 <= 1 then
				DotDam1 = 1;
			end
			
			if DotDam1 >= charhp then
				Char:ChangeHp(-1 * charhp );
			else
				Char:ChangeHp(-1 * DotDam1);
			end
			
			Char:BuffActive();
		end
	end
end
