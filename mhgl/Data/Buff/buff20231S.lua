 
--自动从蹴鞠场弹回京城buff
function buff20231Add(buff, Char) 

end

function buff20231Add(buff, Char) 
	Char:SetSpeed(165)
end

function buff20231Attri(Char, buff, Attri)
	Attri:SetAtk(Attri:GetAtk()+100)
	local Pow = Attri:GetPow()-80
	if Pow > 5 then
		Attri:SetPow(Pow)
	elseif Pow <= 5 then
		Attri:SetPow(5)
	end
end

function buff20231Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
	Char:SetSpeed(150)
end
