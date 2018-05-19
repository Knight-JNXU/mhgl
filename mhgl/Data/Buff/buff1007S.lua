--蓝毒(12%)

function buff1007Active(buff, Char, Other, Type) 
	
	if Type == TURN_START then
		
		local DotDam = Char:GetSP() * 0.12;
		
		if Char:GetHP() ~= 0 then
			
			if DotDam <= 1 then
				DotDam = 1;
			end
			
			Char:ChangeSp(-1 * DotDam);
			Char:BuffActive();
		end
	end
end
