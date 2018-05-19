--匿影藏行(遁形)

function buff21005Active(buff, Char, Other, Type) 
	
	if Type == TURN_START then
		
		local i = buff:GetBuffValue2();
		if i == 0 then
			local consumeSp = 50;
			if consumeSp <= Char:GetSP() then
				Char:ChangeSp(consumeSp, false);
			else
				Char:RemoveBuff(2005);
			end
		elseif i > 0 then
			local TurnConsumeSp = 0.16 * Char:GetLevel() + 6;
			if TurnConsumeSp <= Char:GetSP() then
				Char:ChangeSp(TurnConsumeSp, false);
			else
				Char:RemoveBuff(2005);
			end
		end
		Char:BuffActive();
	end	
	
	if Type == TURN_END then
		if Char:HasSkill(5624) then
			Char:RemoveBuff(2005);
		elseif Char:HasSkill(5643) then
			local i = buff:GetBuffValue2();
			i = i + 1;
			buff:SetBuffValue2(i);
			if i == 10 then
				Char:RemoveBuff(2005);
			end
		else
			local i = buff:GetBuffValue2();
			i = i + 1;
			buff:SetBuffValue2(i);
			if i == 2 then
				if math.random(1, 10) < 5 then
					Char:RemoveBuff(2005);
				end
			elseif i >= 3 then
				Char:RemoveBuff(2005);
			end
		end
		Char:BuffActive();
	end
end 