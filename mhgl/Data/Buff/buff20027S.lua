 
--Ð¡Âí
function buff20027Active(buff, Char, Other, Type) 

end

function buff20027Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
