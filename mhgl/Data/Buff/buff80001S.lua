-----方寸法宝 复活一次

function buff2054Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING or Type == DO_PROTECTTING then
		local reDam = -1 * Char:GetDHP();
		
		if reDam > 0 and Char:GetHP() == 0 then
			
			local rec = Char:GetMaxHP();
			Char:ChangeMHp(rec);
			Char:ChangeHp(rec);
			Char:RemoveBuff(80001);
		end		
	end
end
