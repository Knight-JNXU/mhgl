--万毒归心(唐医)

function buff1005Active(buff, Char, Other, Type) 
	
	if Type == TURN_START then
		if Char:GetHP() ~= 0 then
			local DotDam1 = Char:GetDP() * 0.1;
			local DotDam2 = Char:GetSP() * 0.05;
			if DotDam1 <= 1 then
				DotDam1 = 1;
			elseif DotDam2 <= 1 then
				DotDam2 = 1;
			end
			
			Char:ChangeDp(-1 * DotDam1);
			Char:ChangeSp(-1 * DotDam2);
			Char:BuffActive();
		end
	end
end
