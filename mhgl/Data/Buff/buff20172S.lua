 
--ÀÖÀÖÉ½
function buff20172Add(buff, Char) 

end

function buff20172Attri(Char, buff, Attri)

	local Pow = Attri:GetPow()-80
	if Pow > 5 then
		Attri:SetPow(Pow)
	elseif Pow <= 5 then
		Attri:SetPow(5)
	end
end

function buff20172Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
