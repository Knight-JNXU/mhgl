 
--ÍæÅ¼ÊéÉú
function buff20202Add(buff, Char) 

end

function buff20202Attri(Char, buff, Attri)

	local Pow = Attri:GetPow()-65
	if Pow > 5 then
		Attri:SetPow(Pow)
	elseif Pow <= 5 then
		Attri:SetPow(5)
	end
	
end

function buff20202Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
