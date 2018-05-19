--红外伤(夺命追魂)

function buff1000Active(buff, Char, Other, Type) 
	
	if Type == TURN_START then
		local nDot = buff:GetBuffValue2() + Char:GetHP() * 0.05;
		local DotLv = 7.5 * buff:GetBuffValue1();
		local charhp = Char:GetHP();
		if charhp ~= 0 then
			--if Char:GetHP() < nDot then
			--	nDot = Char:GetHP();
			if nDot < 1 then
				nDot = 1
			end
			if nDot > DotLv then
				nDot = DotLv;
			end
			if Char:IsBuffExist(1709) and nDot >= charhp then
				Char:ChangeHp(- charhp + 1);
			else
				Char:ChangeHp(-1 * nDot);
			end
			if (Char:IsBuffExist(2020) or Char:IsBuffExist(2053)) and nDot >= charhp then
				Char:AddBuff(2066, 0, 0, 0, 5, 100);
			end
			
			Char:BuffActive();
		end
	end
end
