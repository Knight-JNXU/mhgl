--持续恢复内力(化血凝神)

function buff1200Active(buff, Char, Other, Type)
	
	if Type == TURN_START then
		if Char:GetHP() ~= 0 then
			if Char:GetSP() < Char:GetMaxSP() then
				Char:ChangeSp(buff:GetBuffValue2());
				Char:BuffActive();
			end
		end
	end
end
