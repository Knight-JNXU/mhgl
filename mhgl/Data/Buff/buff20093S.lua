 
--¶«¹ùÏÈÉú
function buff20093Add(buff, Char) 

end

function buff20093Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
