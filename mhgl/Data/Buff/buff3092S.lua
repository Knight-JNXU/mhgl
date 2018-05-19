--普攻附带万毒萦绕

function buff3092Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING_ATTACKER then
		if (Char:GetAction() == LuaI.BATCMD_ATTACK or Char:GetAction() == LuaI.BATCMD_CRIT_ATTACK) and 
			Other:GetReaction() ~= LuaI.BATCMD_MISS then
			
			local Lv = Char:GetLevel();
			if math.random(1, 100) <= 100 and 
				Other:GetHP() ~= 0 and Other:IsBuffExist(1002) == false then				
				Other:AddBuff(1002, Lv, 0, 0, 3, 100);
			end
		end
	end
end
