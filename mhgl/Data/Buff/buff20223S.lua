 
--Õ¿ΩøΩø
function buff20223Add(buff, Char) 

end

function buff20223Add(buff, Char) 
	Char:SetSpeed(170)
end

function buff20223Attri(Char, buff, Attri)
	
	Attri:SetDef(Attri:GetDef()+80)

end


function buff20223Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
	Char:SetSpeed(150)
end
