--高级招式消耗降低(真龙心神诀)

function buff2042Active(buff, Char, Other, Type)	
	
	if Type == DO_HITTING_ATTACKER then
		local consumeSp = -1 * Char:GetDSP();
		
		if (Char:GetAction() == LuaI.BATCMD_SKILL or
			Char:GetAction() == LuaI.BATCMD_CRIT_SKILL) then 
			
			Char:ResetSP();
			Char:ChangeSp(-0.5 * consumeSp, false);
		end
	end
end
