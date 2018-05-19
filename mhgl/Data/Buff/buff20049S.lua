 
--ÎÞ»¨
function buff20049Active(buff, Char, Other, Type) 

end

function buff20049Add(buff, Char) 
	Char:SetSpeed(180)
end

function buff20049Attri(Char, buff, Attri)

	Attri:SetPow(Attri:GetPow()+120)
	Attri:SetMaxHp(Attri:GetMaxHp()-300) 
	Attri:SetMaxSp(Attri:GetMaxSp()+80)
	
end

function buff20049Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
	Char:SetSpeed(150)
end
