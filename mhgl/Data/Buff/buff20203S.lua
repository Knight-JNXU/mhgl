 
--Å·ÑôÏ²
function buff20203Add(buff, Char) 

end

function buff20203Attri(Char, buff, Attri)

	
	local Pow = Attri:GetPow()-50
	if Pow > 5 then
		Attri:SetPow(Pow)
	elseif Pow <= 5 then
		Attri:SetPow(5)
	end
end

function buff20203Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
