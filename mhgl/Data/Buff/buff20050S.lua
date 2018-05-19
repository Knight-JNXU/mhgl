 
--ÑûÔÂ¹¬Ö÷
function buff20050Active(buff, Char, Other, Type) 

end

function buff20050Add(buff, Char) 
	Char:SetSpeed(185)
end

function buff20050Attri(Char, buff, Attri)

	Attri:SetAtk(Attri:GetAtk()+70)
	Attri:SetHit(Attri:GetHit()+58)
	
end

function buff20050Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
	Char:SetSpeed(150)
end
