--被屠戮目标

function buff3122Active(buff, Char, Other, Type) 
	
	
	if Type == TURN_END then	
		local rec1 = Char:GetMaxHP();
		--local i = buff:GetBuffValue2();
		--i = i + 1;
		--buff:SetBuffValue2(i);
		
		if not Char:IsBuffExist(1517) then
			--if math.fmod(i, 2) == 0 then	
				Char:ChangeHp(rec1 * 0.3)
				Char:AddBuff(1517, 1, 0, 0, 120, 100);				
			--end			
		end
	end
	Char:BuffActive();
end 