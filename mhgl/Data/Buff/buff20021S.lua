 
--СопЈ
function buff20021Active(buff, Char, Other, Type) 
	
end



function buff20021Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
