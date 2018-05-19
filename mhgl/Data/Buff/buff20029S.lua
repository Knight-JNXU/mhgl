 
--Ò¶¿ª
function buff20029Active(buff, Char, Other, Type) 

end

function buff20029Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
