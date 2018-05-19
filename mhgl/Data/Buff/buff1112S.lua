--禁疗(回天乏力)

function buff1112Active(buff, Char, Other, Type) 
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
end
