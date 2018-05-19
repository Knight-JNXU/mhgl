--持续恢复生命(凝血术)

function buff1202Active(buff, Char, Other, Type) 
	
	if Type == TURN_START then
		if Char:GetHP() ~= 0 then
			if Char:IsBuffExist(1112) then
				do return end
			end
			if Char:GetHP() < Char:GetMaxHP() then
				Char:ChangeHp(buff:GetBuffValue2());
			end
			Char:BuffActive();
		end
	end
end
