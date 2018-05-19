 
--гЃзг
function buff20059Active(buff, Char, Other, Type) 

end

function buff20059Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
