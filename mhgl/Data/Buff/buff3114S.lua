--冥思·改

function buff3114Active(buff, Char, Other, Type) 
	
	if Type == TURN_END then
		if Char:GetHP() ~= 0 then
			local rec = Char:GetLevel();
			if rec <= 1 then
				rec = 1;
			end
			
			if Char:GetSP() < Char:GetMaxSP() then
				Char:ChangeSp(rec);
			end
			Char:BuffActive();
		end
	end
end
