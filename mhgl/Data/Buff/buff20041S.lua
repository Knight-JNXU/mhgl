 
--°×ÔÆÉú
function buff20041Active(buff, Char, Other, Type) 

end

function buff20041Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
