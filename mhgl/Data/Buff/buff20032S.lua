
--уещ╪
function buff20032Active(buff, Char, Other, Type) 

end

function buff20032Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
