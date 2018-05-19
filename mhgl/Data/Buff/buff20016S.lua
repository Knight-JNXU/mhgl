
--…Ú¿À
function buff20016Active(buff, Char, Other, Type) 

end

function buff20016Add(buff, Char) 
	Char:SetSpeed(195)
end

function buff20016Attri(Char, buff, Attri)

	Attri:SetDef(Attri:GetDef()+103)
	Attri:SetPow(Attri:GetPow()+108)
	Attri:SetHit(Attri:GetHit()+87)
	
end


function buff20016Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
		
	end
	Char:SetSpeed(150)
end
