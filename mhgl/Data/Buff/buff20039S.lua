 
--”·≈Â”Ò
function buff20039Active(buff, Char, Other, Type) 

end

function buff20039Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
