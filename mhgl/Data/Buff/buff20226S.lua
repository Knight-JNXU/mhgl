 
--ÐùÔ¯Èý¹â
function buff20226Add(buff, Char) 

end

function buff20226Add(buff, Char) 
	Char:SetSpeed(170)
end

function buff20226Attri(Char, buff, Attri)
	
end

function buff20226Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
	Char:SetSpeed(150)
end
