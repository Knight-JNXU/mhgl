 
--ø›√∑¥Û ¶
function buff20069Add(buff, Char) 

end

function buff20069Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
