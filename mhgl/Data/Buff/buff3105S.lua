--被屠戮目标

function buff3105Active(buff, Char, Other, Type) 
	
	--[[if Type == TURN_START then
		
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
	end	]]
	
	if Type == TURN_END then		
		local i = buff:GetBuffValue2();
		i = i + 1;
		buff:SetBuffValue2(i);
		
		if not Char:IsBuffExist(1111) then
			if i == 1 then
				if math.random(1, 10) < 3 then
					Char:RemoveBuff(3105);
					Char:AddBuff(3106, 1, 0, 0, 120, 100);
				end
			elseif i == 2 then
				if math.random(1, 10) < 3 then
					Char:RemoveBuff(3105);
					Char:AddBuff(3106, 1, 0, 0, 120, 100);
				end
			elseif i == 3 then
				if math.random(1, 10) < 3 then
					Char:RemoveBuff(3105);
					Char:AddBuff(3106, 1, 0, 0, 120, 100);
				end
			elseif i == 4 then
				if math.random(1, 10) < 3 then
					Char:RemoveBuff(3105);
					Char:AddBuff(3106, 1, 0, 0, 120, 100);
				end
			elseif i >= 5 then
				Char:RemoveBuff(3105);
				Char:AddBuff(3106, 1, 0, 0, 120, 100);		
			end
		end
	end
	Char:BuffActive();
end 