--4下左右杀死友军单位

function buff3158Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING_ATTACKER then
		
		if Other:GetTeam() == Char:GetTeam() and Other:GetReaction() ~= LuaI.BATCMD_MISS then
			local reDam = Other:GetMaxHP();	
			local r = math.random(9, 11)
			if Char:GetAction() == LuaI.BATCMD_ATTACK then
				Other:ResetHP();
				Other:ChangeHp(-0.025 * r * reDam);
			elseif Char:GetAction() == LuaI.BATCMD_CRIT_ATTACK then
				Other:ResetHP();
				Other:ChangeHp(-0.05 * r * reDam);
			end
		end
	end
end
