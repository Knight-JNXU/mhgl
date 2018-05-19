--血内毒(毒砂护体BUFF)

function buff0014Active(buff, Char, Other, Type) 
	
	if Type == TURN_START then
		if Char:GetHP() ~= 0 then
			local DotDam1 = Char:GetHP() * 0.05;
			local DotDam2 = Char:GetSP() * 0.03;
			local DotLv = buff:GetBuffValue1();
			
			if Char:IsBuffExist(35) then
				local buff = Char:FindBuff(35);
				local RecLv = buff:GetBuffValue1();
				RecPoint = (DotLv - RecLv) * 5;
				if RecPoint >= 50 then
					RecPoint = 50;
				elseif RecPoint <= 25 then
					RecPoint = 25;
				end
			else
				RecPoint = 100;
			end
			
			DotDam1 = RecPoint / 100 * DotDam1;
			DotDam2 = RecPoint / 100 * DotDam2;
			if DotDam1 <= 1 then
				DotDam1 = 1;
			elseif DotDam2 <= 1 then
				DotDam2 = 1;
			end
			
			Char:ChangeHp(-1 * DotDam1);
			Char:ChangeSp(-1 * DotDam2);
			Char:BuffActive();
		end
	end
end
