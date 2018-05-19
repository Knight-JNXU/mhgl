
--ºÚÐÜ
function buff50011Active(buff, Char, Other, Type)  

end

function buff50011Add(buff, Char) 
end

function buff50011Attri(Char, buff, Attri)
     Attri:SetPow(Attri:GetPow()-(Attri:GetPow() * 0.05)) 

end


function buff50011Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
