--毒蛇吐信毒(毒蛇吐信、真·毒蛇吐信)

function buff1003Active(buff, Char, Other, Type) 
	
	if Type == TURN_START then
		local charhp = Char:GetHP();
		if charhp ~= 0 then
			local DotDam1 = Char:GetHP() * 0.1;
			local DotDam2 = Char:GetSP() * 0.05;
			local DotLv = 15 * buff:GetBuffValue1();
			
			if DotDam1 <= 1 then
				DotDam1 = 1;
			elseif DotDam2 <= 1 then
				DotDam2 = 1;
			end
			if DotLv ~= 0 then
				if DotDam1 > DotLv then
					DotDam1 = DotLv;
				end
			else
				if DotDam1 > 15 * Char:GetLevel() then			
					DotDam1 = 15 * Char:GetLevel();
				end
			end
			
			if Char:IsBuffExist(1709) and DotDam1 >= charhp then
				Char:ChangeHp(- charhp + 1);
			else
				Char:ChangeHp(-1 * DotDam1);
			end
			Char:ChangeSp(-1 * DotDam2);
			if (Char:IsBuffExist(2020) or Char:IsBuffExist(2053)) and DotDam1 >= charhp then
				Char:AddBuff(2066, 0, 0, 0, 5, 100);
			end
			Char:BuffActive();
		end
	end
end
