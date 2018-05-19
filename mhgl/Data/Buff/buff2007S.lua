--生命持续恢复(瑜伽术)

function buff2007Active(buff, Char, Other, Type)
	
	if Type == TURN_END then
		if Char:GetHP() ~= 0 then
			local rec = Char:GetLevel() / 2;
			if rec <= 1 then
				rec = 1;
			end
			
			if Char:GetHP() < Char:GetMaxHP() then
				Char:ChangeHp(rec);	
			end
			Char:BuffActive();
		end
	end	
end
