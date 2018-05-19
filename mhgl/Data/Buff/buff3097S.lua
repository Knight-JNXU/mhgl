--血攻反比

function buff3097Active(buff, Char, Other, Type)
	
	if Type == DO_HITTING_ATTACKER then
		local reDam1 = -1 * Other:GetDHP();	
		local AtkBonus = 1 - Char:GetHP()/Char:GetMaxHP();
		if reDam1 > 0 and Other:GetReaction() ~= LuaI.BATCMD_MISS then
	--		Other:ResetMHP();
			Other:ResetHP();
			Other:ChangeHp(-(1 + AtkBonus) * reDam1);					
		end
	end	
end
