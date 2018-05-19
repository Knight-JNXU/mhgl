 
--ÐÄÃ¼
function buff20077Add(buff, Char) 

end

function buff20077Add(buff, Char) 
	Char:SetSpeed(170)
end

function buff20077Attri(Char, buff, Attri)

	Attri:SetPow(Attri:GetPow()+60)
	
end

function buff20077Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
	Char:SetSpeed(150)
end
