--高级生命持续恢复(真瑜伽术)

function buff21040Active(buff, Char, Other, Type) 
	
	if Type == TURN_END then
		if Char:GetHP() ~= 0 then
			local rec = Char:GetLevel();
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
