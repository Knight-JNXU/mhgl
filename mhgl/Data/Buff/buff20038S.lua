 
--ио╧ы╫П╨Г
function buff20038Active(buff, Char, Other, Type) 

end

function buff20038Add(buff, Char) 
	Char:SetSpeed(185)
end

function buff20038Attri(Char, buff, Attri)

	
	Attri:SetMaxHp(Attri:GetMaxHp()+600) 
	
end

function buff20038Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
	Char:SetSpeed(150)
end
