
--ÑàÊ®Èý
function buff20019Active(buff, Char, Other, Type) 

end

function buff20019Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
