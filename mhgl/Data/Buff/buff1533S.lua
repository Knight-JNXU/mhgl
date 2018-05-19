--持续恢复内力(化血凝神)

function buff1533Active(buff, Char, Other, Type)
	
	if Type == TURN_START then
		Hp = Char:GetMaxHP() * 0.5
		Char:ChangeMHp(Hp)
		Char:ChangeHp(Hp)
		Char:BuffActive()
	end
end
