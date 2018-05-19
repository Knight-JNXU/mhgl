 
--Ã¿“∞
function buff20089Add(buff, Char) 

end

function buff20089Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
