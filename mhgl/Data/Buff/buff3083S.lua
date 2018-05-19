-----高级不死·改(真罗中返魂大法·改)

function buff3083Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then
		local reDam = -1 * Char:GetDHP();
		local Rate = math.random(1, 100);
		
		if reDam > 0 and Char:GetHP() == 0 and 
			--Char:IsBuffExist(2020) ~= true and 
			--Char:IsBuffExist(2053) ~= true and 
			Rate <= 100 then
			
			local rec = Char:GetMaxHP();
			Char:ChangeHp(rec);
		end		
	end
end
