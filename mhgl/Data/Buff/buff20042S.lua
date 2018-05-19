 
--»¨ÎÞÈ±
function buff20042Active(buff, Char, Other, Type) 

end

function buff20042Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
