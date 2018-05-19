--持续恢复生命和生命上限(碧水清茗)

function buff1201Active(buff, Char, Other, Type) 
	
	if Type == TURN_START then
		if Char:GetHP() ~= 0 then
			if Char:IsBuffExist(1112) then
				do return end
			end
			if Char:GetMHP() < Char:GetMaxHP() then
				Char:ChangeMHp(buff:GetBuffValue3());
			end
			if Char:GetHP() < Char:GetMaxHP() then
				Char:ChangeHp(buff:GetBuffValue2());
			end
			Char:BuffActive();
		end
	end
end
