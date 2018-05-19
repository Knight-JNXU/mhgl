--被铁战攻击的buff

function buff1538Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then
	
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
		local reDam3 = -1 * Char:GetDMHP();
		local NowReAtkCount = buff:GetBuffValue2();
		if (Other:GetAction() == LuaI.BATCMD_ATTACK or 
			Other:GetAction() == LuaI.BATCMD_CRIT_ATTACK or 
			Other:GetAction() == LuaI.BATCMD_SKILL or 
			Other:GetAction() == LuaI.BATCMD_ITEM) and 
			(reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and 
			Char:GetReaction() ~= LuaI.BATCMD_MISS then 
			if Other:HasSkill(5300) then
				buff:SetBuffValue2(NowReAtkCount - 1);
			end
			if buff:GetBuffValue2() == 0 then
				Char:RemoveBuff(1538);
			end
		end
	end
end
