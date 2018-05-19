--高级必杀(真神刀化血)

function buff2043Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING_ATTACKER then
		local Dam = -1 * Other:GetDHP();
		local HitRate = math.random(1, 100);
		
		if Char:GetAction() == LuaI.BATCMD_ATTACK and 
			Other:GetReaction() ~= LuaI.BATCMD_MISS and 
			Other:IsBuffExist(2011) ~= true and 
			Other:IsBuffExist(2044) ~= true and
			Other:IsBuffExist(21011) ~= true and 
			Other:IsBuffExist(21044) ~= true and
			HitRate <= 20 then
			
	--		Other:ResetMHP();
			Other:ResetHP();
			Other:ChangeHp(-2 * Dam);
			Other:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
			if Other:GetAction() == LuaI.BATCMD_DEFEND then
				Other:SetTempReaction(LuaI.BATCMD_DEFEND_CRIT_HIT);
			end
		elseif Char:GetAction() == LuaI.BATCMD_CRIT_ATTACK and 
			Other:GetReaction() ~= LuaI.BATCMD_MISS and 
			Other:IsBuffExist(2011) ~= true and 
			Other:IsBuffExist(2044) ~= true and
			Other:IsBuffExist(21011) ~= true and 
			Other:IsBuffExist(21044) ~= true and
			HitRate <= 20 then
			
	--		Other:ResetMHP();
			Other:ResetHP();
			Other:ChangeHp(-1.5 * Dam );
			Other:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
			if Other:GetAction() == LuaI.BATCMD_DEFEND then
				Other:SetTempReaction(LuaI.BATCMD_DEFEND_CRIT_HIT);
			end
		end
	end
end
