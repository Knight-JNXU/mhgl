--蓝外伤(天魔解體)

function buff1004Active(buff, Char, Other, Type) 
	
	if Type == TURN_START then
		
		local DotDam = buff:GetBuffValue2() + Char:GetSP() * 0.03;
		local DotLv = 7.5 * buff:GetBuffValue1();
		
		if Char:GetHP() ~= 0 then
			
			if DotDam <= 1 then
				DotDam = 1;
			end
			if DotDam > DotLv then
				DotDam = DotLv;
			end
			
			Char:ChangeSp(-1 * DotDam);
			Char:BuffActive();
		end
	end
end
