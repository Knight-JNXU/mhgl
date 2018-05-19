
--Ð»Ïþ·å
function buff20017Active(buff, Char, Other, Type) 

end

function buff20017Add(buff, Char) 
	Char:SetSpeed(195)
end


function buff20017Attri(Char, buff, Attri)

	
	Attri:SetPow(Attri:GetPow()+103) --ÄÚ¹¦
	Attri:SetMaxHp(Attri:GetMaxHp()+303)    
	Attri:SetEva(Attri:GetEva()+87) --ÉÁ±Ü
	
end

function buff20017Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
	Char:SetSpeed(150)
end
