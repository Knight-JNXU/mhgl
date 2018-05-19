--招式消耗降低(龙心神诀)

function buff21009Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING_ATTACKER then
		local consumeSp = -1 * Char:GetDSP();
		if 0.75 * consumeSp < 1 then
			consumeSp = 1 / 0.75;
		end
		if Char:GetAction() == LuaI.BATCMD_SKILL or
			Char:GetAction() == LuaI.BATCMD_CRIT_SKILL then
			Char:ResetSP();
			Char:ChangeSp(-0.75 * consumeSp, false);
		end
	end
	
end
