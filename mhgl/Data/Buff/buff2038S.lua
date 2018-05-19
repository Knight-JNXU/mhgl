--真匿影藏行(高级遁形)

function buff2038Active(buff, Char, Other, Type) 
	
	if Type == TURN_START then
		
		local i = buff:GetBuffValue2();
		if i == 0 then
			local consumeSp = 50;
			if consumeSp <= Char:GetSP() then
				Char:ChangeSp(consumeSp, false);
			else
				Char:RemoveBuff(2038);
			end
		elseif i > 0 then
			local TurnConsumeSp = 0.16 * Char:GetLevel() + 6;
			if TurnConsumeSp <= Char:GetSP() then
				Char:ChangeSp(TurnConsumeSp, false);
			else
				Char:RemoveBuff(2038);
			end
		end
		Char:BuffActive();
	end	
	
	if Type == TURN_END then
		
		local i = buff:GetBuffValue2();
		i = i + 1;
		buff:SetBuffValue2(i);
		if i == 3 or i == 4 then
			if math.random(1, 10) < 5 then
				Char:RemoveBuff(2038);
			end
		elseif i >= 5 then
			Char:RemoveBuff(2038);
		end		
		Char:BuffActive();
	end
	
end
