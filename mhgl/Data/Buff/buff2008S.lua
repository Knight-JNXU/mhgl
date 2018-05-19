--内力持续恢复(黄教密宗)

function buff2008Active(buff, Char, Other, Type) 
	
	if Type == TURN_END then
		if Char:GetHP() ~= 0 then
			local rec = Char:GetLevel() / 4;
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
