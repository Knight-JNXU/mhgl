--(减伤吸收伤害)大慈无悔

function buff0079Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then		
		local reDam = -1 * Char:GetHP();
		local DotLv = buff:GetBuffValue1();
		
		if Char:GetTeam() ~= Other:GetTeam() then			
			if (Other:GetAction() == LuaI.BATCMD_SKILL or Other:GetAction() == LuaI.BATCMD_ATTACK)  and 
				--(Other:GetAction() == LuaI.BATCMD_ITEM and itemType == 11) 
				reDam > 0 and Char:GetReaction() ~= LuaI.BATCMD_MISS then
				DotDam = (math.floor((DotLv - 35 )/ 25)) * 0.1 + 0.1;
				
				Char:ResetHP();
				Char:ChangeHp(-DotDam * reDam);				
			end			
		end		
	end	
end
