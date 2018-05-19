--紧箍咒

function buff1002Active(buff, Char, Other, Type) 
	
	if Type == TURN_START then
		local charhp = Char:GetHP();
		if charhp ~= 0 then
			local DotDam1 = Char:GetHP();
			local DotDam2 = Char:GetMHP();
			
			local DotLv1 = buff:GetBuffValue1()+10;
			local DotLv2 = buff:GetBuffValue1()+10;
			if DotDam1 <= 1 then
			    DotDam1 = 1;
			end
			if DotDam2 <= 1 then
			    DotDam2 = 1;
			end
			
			if DotDam1 > DotLv1 then
				DotDam1 = DotLv1;
			end
			if DotDam2 > DotLv2 then
				DotDam2 = DotLv2;
			end
			
			if Char:IsBuffExist(1709) and DotDam1 >= charhp then
				Char:ChangeHp(-1 * (charhp+1));
			else
				Char:ChangeHp(-1 * DotDam1);
			end
			local charmhp = Char:GetMHP();
			if Char:IsBuffExist(1709) and DotDam2 >= charmhp then
				Char:ChangeMHp(-1 * (charhp+1));
			else
				Char:ChangeMHp(-1 * DotDam2);
			end
			
			if (Char:IsBuffExist(2020) or Char:IsBuffExist(2053)) and DotDam1 >= charhp then
				Char:AddBuff(2066, 0, 0, 0, 5, 100);
			end
			Char:BuffActive();
		end
	end
end
