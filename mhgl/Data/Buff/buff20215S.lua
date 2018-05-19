 
-- Øπ€“Ù
function buff20215Add(buff, Char) 

end

function buff20215Add(buff, Char) 
	Char:SetSpeed(175)
end

function buff20215Attri(Char, buff, Attri)

	Attri:SetDef(Attri:GetDef()+150)
	
end

function buff20215Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
	Char:SetSpeed(150)
end
