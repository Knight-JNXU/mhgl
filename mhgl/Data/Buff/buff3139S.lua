--顽皮的雪人红灯

function buff3139Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then		
		local reDam = -1 * Char:GetDHP();		
		
		if reDam > 0 and Char:GetReaction() ~= LuaI.BATCMD_MISS then
			Char:AddBuff(3141, 1, 0, 0, 1, 100);	
		end
	end
end 