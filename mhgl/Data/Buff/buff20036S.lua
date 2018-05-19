 
--Ä½ÈÝÇïÝ¶
function buff20036Active(buff, Char, Other, Type) 

end

function buff20036Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
