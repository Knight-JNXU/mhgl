--毒蛇回血（每过3回合回生命上限的1/3气血）

function buff1922Active(buff, Char, Other, Type) 
	
	if Type == TURN_START then
		local i = buff:GetBuffValue2();
		if i%1 == 0 and i ~= 0 then
			local Hp = Char:GetMaxHP() * 0.05;
			if Char:GetHP() > 0 then
				Char:ChangeHp(Hp);
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
