-----高级不死(真罗中返魂大法)

function buff2054Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING or Type == DO_PROTECTTING then
		local reDam = -1 * Char:GetDHP();
		local Rate = math.random(1, 100);
		
		if reDam > 0 and Char:GetHP() == 0 and 
			Char:IsBuffExist(2020) ~= true and 
			Char:IsBuffExist(2053) ~= true and
			Char:IsBuffExist(21020) ~= true and 
			Char:IsBuffExist(21053) ~= true and
			Rate <= 30 then
			
			local rec = Char:GetMaxHP();
			Char:ChangeMHp(rec);
			Char:ChangeHp(rec);
		end		
	end
end
