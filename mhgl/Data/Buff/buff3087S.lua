--高级生命持续恢复·改(
function buff3087Active(buff, Char, Other, Type) 
	
	if Type == TURN_END then
		if Char:GetHP() ~= 0 then
			local recxs = 5;
			local skill = Char:GetSkillLv(5300);
			local recxs = 5;
			if skill == 1 then
				recxs = 10
			end
			
			local rec = recxs * Char:GetLevel();
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
