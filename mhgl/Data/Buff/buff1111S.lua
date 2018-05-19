--圣贼睡眠封(弛纵心猿秘法)

function buff1111Active(buff, Char, Other, Type) 
	
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
			
			buff:SetBuffValue2(NowReAtkCount - 1);
			
			if buff:GetBuffValue2() == 0 then
				Char:RemoveBuff(1111);
			end
		end
	end
end
