--一触即死

function buff3128Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then		
		local reDam = -1 * Char:GetDHP();
		local dead = Char:GetHP();
		
		if reDam > 0 and Char:GetReaction() ~= LuaI.BATCMD_MISS then
			Char:ResetHP();
			Char:ChangeHp(-10 * dead);
		end
	end
end
