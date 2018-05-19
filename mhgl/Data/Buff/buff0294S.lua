--镇帮神器：剑侍一定回合内无敌
function buff0294Active(buff, Char, Other, Type) 	
	if Type == DO_HITTING then		
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
				 
		if (reDam1 > 0 or reDam2 > 0) and Char:GetReaction() ~= LuaI.BATCMD_MISS then
			Char:ResetHP();
			Char:ResetSP();
		end
	end
end
