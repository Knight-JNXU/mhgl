-----极乐净土

function buff1709Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING or Type == DO_PROTECTTING then
		local reDam = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDMHP();
		local Rate = math.random(1, 100);
		
		if reDam > 0 and Char:GetHP() == 0 then
			
			--local rec = 0.5 * Char:GetMaxHP();
			Char:ChangeMHp(reDam2, false);
			Char:ChangeHp(1);
		end		
	end
end
