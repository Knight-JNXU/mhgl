
--Â½Ð¡·ï
function buff20012Active(buff, Char, Other, Type) 

end

function buff20012Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
