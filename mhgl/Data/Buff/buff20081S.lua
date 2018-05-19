 
--Âé×Ó
function buff20081Add(buff, Char) 

end

function buff20081Add(buff, Char) 
	Char:SetSpeed(170)
end


function buff20081Attri(Char, buff, Attri)

	local Pow = Attri:GetPow()-100
	if Pow > 5 then
		Attri:SetPow(Pow)
	elseif Pow <= 5 then
		Attri:SetPow(5)
	end
end
function buff20081Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
	Char:SetSpeed(150)
end
