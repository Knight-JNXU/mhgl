-----不死(罗中返魂大法)

function buff21021Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING or Type == DO_PROTECTTING then
		local reDam = -1 * Char:GetDHP();
		local Rate = math.random(1, 100);
		
		if reDam > 0 and Char:GetHP() == 0 and 
			Char:IsBuffExist(2020) ~= true and 
			Char:IsBuffExist(2053) ~= true and 
			Char:IsBuffExist(21020) ~= true and 
			Char:IsBuffExist(21053) ~= true and 
			Rate <= 15 then
			
			local rec = 0.5 * Char:GetMaxHP();
			Char:ChangeMHp(rec);
			Char:ChangeHp(rec);
		end		
	end
end
