 
--Ð¡Óñ
function buff20199Add(buff, Char) 

end

function buff20199Attri(Char, buff, Attri)

	
end

function buff20199Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
