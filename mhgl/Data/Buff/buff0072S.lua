--蓝外伤(游魂丝)

function buff0072Active(buff, Char, Other, Type) 
	
	if Type == TURN_END then
		if Char:GetHP() ~= 0 then
			local DotDam = Char:GetSP() * 0.03;
			if DotDam <= 0 then
				DotDam = 1;
			end
			
			Char:ChangeSp(-1 * DotDam);
			Char:BuffActive();
		end
	end
end
