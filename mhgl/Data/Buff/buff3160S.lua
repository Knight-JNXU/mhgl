--°×ÔÆ³Ç¸´»îà¶†ªAI

function buff3160Active(buff, Char, Other, Type)
	
	if Type == DO_HITTING then
		local i = buff:GetBuffValue2();
		i = i + 1;
		buff:SetBuffValue2(i);
		local charhp = Char:GetHP();
		if charhp ~= 0 then
			local DotDam1 = Char:GetMaxHP() * 0.23;
			
			if DotDam1 <= 1 then
				DotDam1 = 1;
			end
			
			if DotDam1 >= charhp then
				Char:ChangeHp(-1 * charhp );
			else
				Char:ChangeHp(-1 * DotDam1);
			end
			
			Char:BuffActive();
		end
	end
end