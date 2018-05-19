 
--Ð»Ð¡Óñ
function buff20061Add(buff, Char) 

end

function buff20061Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
