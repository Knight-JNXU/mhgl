--血毒(12%)

function buff1008Active(buff, Char, Other, Type) 
	
	if Type == TURN_START then
		
		local DotDam = Char:GetHP() * 0.12;
		local DotLv = 18 * Char:GetLevel();
		local charhp = Char:GetHP();
		if Char:GetHP() ~= 0 then
			
			if DotDam <= 1 then
				DotDam = 1;
			end
			if DotDam > DotLv then
				DotDam = DotLv;
			end
			
			if Char:IsBuffExist(1709) and DotDam >= charhp then
				Char:ChangeHp(- charhp + 1);
			else
				Char:ChangeHp(-1 * DotDam);
			end
			Char:BuffActive();
		end
	end
end
