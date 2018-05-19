--高级内力持续恢复(真黄教密宗)

function buff2041Active(buff, Char, Other, Type) 
	
	if Type == TURN_END then
		if Char:GetHP() ~= 0 then
			local rec = Char:GetLevel() / 2;
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
