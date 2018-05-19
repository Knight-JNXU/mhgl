--铁心兰被攻击后会反馈一个被铁战攻击的buff

function buff1537Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING or Type == DO_PROTECTTING then
		
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
		local reDam3 = -1 * Char:GetDMHP();
		
		if Char:GetTeam() ~= Other:GetTeam() then
			
			if (reDam1 > 0 or reDam2 > 0 or reDam3 > 0) then
				
				Other:AddBuff(1538, 1, 1, 0, 150, 100);	
			end			
		end		
	end	
end
