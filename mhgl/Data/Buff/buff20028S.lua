 
--¿Óªµ
function buff20028Active(buff, Char, Other, Type) 

end

function buff20028Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
