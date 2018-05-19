 
--∏µ∫Ï—©
function buff20046Active(buff, Char, Other, Type) 

end

function buff20046Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
