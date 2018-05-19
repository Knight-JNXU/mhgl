--红外伤(无影鬼羽)

function buff0071Active(buff, Char, Other, Type) 
	
	if Type == TURN_END then
		if Char:GetHP() ~= 0 then
			local DotDam = Char:GetHP() * 0.05;
			if DotDam <= 0 then
				DotDam = 1;
			end
			
			Char:ChangeHp(-1 * DotDam);
			Char:BuffActive();
		end
	end
end
