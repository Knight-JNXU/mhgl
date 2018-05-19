 
--Ë¼Äï
function buff20092Add(buff, Char) 

end

function buff20092Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
