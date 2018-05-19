--翠烟遁形(遁形)

function buff1700Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING_ATTACKER then
		--判断DP有否增加      待程序suport
		local reDam = -1 * Other:GetDHP();
		
		if (Char:GetAction() == LuaI.BATCMD_ATTACK or
			Char:GetAction() == LuaI.BATCMD_CRIT_ATTACK) and
			reDam > 0  and
			Other:GetReaction() ~= LuaI.BATCMD_MISS then
			if 0.8 * reDam < 1 then
				reDam = math.random(1, 5) * 1.25;
			end
	--		Other:ResetMHP();
			Other:ResetHP();
			Other:ChangeHp(-0.8 * reDam);
		end 
	end
	
	if Type == DO_ACTION then
		
		if Char:GetAction() == LuaI.BATCMD_SPECIAL then
			Char:RemoveBuff(1700);
		end
	end
end

