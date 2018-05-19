--匿影藏行(遁形)

function buff3159Active(buff, Char, Other, Type) 
	
	if Type == TURN_END then
		
		local i = buff:GetBuffValue2();
		i = i + 1;
		buff:SetBuffValue2(i);
		if i == 2 then
			Char:RemoveBuff(3159);
		end
		
		Char:BuffActive();
	end
end 