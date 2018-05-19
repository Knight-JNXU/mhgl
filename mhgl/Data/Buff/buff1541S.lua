--减血内毒(MOB,满天花雨,漫雪飘飞)

function buff1541Active(buff, Char, Other, Type) 
	
	if Type == TURN_START then
		
		local charhp = Char:GetHP();
		if charhp ~= 0 then
			local sx = 0.1;
			
			if buff:GetBuffValue2() ~= 0 then
			sx = buff:GetBuffValue2()
			end
			
			local DotDam1 = Char:GetHP() * sx;
			local DotDam2 = Char:GetSP() * 0.05;
			local DotLv = 5 * buff:GetBuffValue1();
			if DotDam1 <= 1 then
				DotDam1 = 1;
			end
			if DotDam2 <= 1 then
				DotDam2 = 1;
			end
			if DotDam1 > DotLv then
				DotDam1 = DotLv + math.random(1, 10);
			end
			
			if Char:IsBuffExist(1709) and DotDam1 >= charhp then
				Char:ChangeHp(-1 * (charhp + 1));
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
