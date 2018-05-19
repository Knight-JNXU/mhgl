--持续恢复内力(气疗术)

function buff1203Active(buff, Char, Other, Type)
	
	if Type == TURN_START then
		if Char:GetHP() ~= 0 then
			if Char:GetSP() < Char:GetMaxSP() then
				Char:ChangeSp(buff:GetBuffValue2());
			end
			Char:BuffActive();
		end
	end
end
