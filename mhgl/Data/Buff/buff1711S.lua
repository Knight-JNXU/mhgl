--俞放鹤隐遁 玩家易容成萧少英可破除


function buff1711Attri(Char, buff, Attri) 
	Attri:SetAtk(Attri:GetAtk() * 1.1);
end

function buff1711Active(buff, Char, Other, Type) 

	if Type == DO_HITTING then
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
		local reDam3 = -1 * Char:GetDMHP();
		
		if Char:GetTeam() ~= Other:GetTeam() then
			
			if (reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and 
				Char:GetReaction() ~= LuaI.BATCMD_MISS and Char:GetHP() ~= 0 and 
				Other:IsBuffExist(20024) == true   then
				Char:RemoveBuff(1711);
			end
		end
	end
end

