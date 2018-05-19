--毒蛇回血（每过3回合回生命上限的1/3气血）

function buff1397Active(buff, Char, Other, Type) 
	
	if Type == TURN_START then
		local i = buff:GetBuffValue2();
		if i%3 == 0 and i ~= 0 then
			local Sp = Char:GetMaxSP() * 0.05;
			if Char:GetSP() > 0 then
				Char:ChangeSp(Sp);
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
		Char:BuffActive();
	end
	
end
