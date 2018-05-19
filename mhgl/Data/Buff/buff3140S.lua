--顽皮的雪人绿灯

function buff3140Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then		
		local reDam = -1 * Char:GetDHP();		
		
		if reDam > 0 and Char:GetReaction() ~= LuaI.BATCMD_MISS then
			Char:AddBuff(3141, 1, 0, 0, 1, 100);	
		end
	end
end 