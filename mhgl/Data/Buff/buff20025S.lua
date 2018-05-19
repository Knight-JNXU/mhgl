 
--¬Û¿œπ„
function buff20025Active(buff, Char, Other, Type) 

end

function buff20025Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
