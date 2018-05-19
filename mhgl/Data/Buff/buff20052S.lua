 
--”ÒÛÔµ¿»À
function buff20052Active(buff, Char, Other, Type) 

end

function buff20052Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
