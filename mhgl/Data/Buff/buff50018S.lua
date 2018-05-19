
--Ò°¹í
function buff50018Active(buff, Char, Other, Type)  

end

function buff50018Add(buff, Char) 
end

function buff50018Attri(Char, buff, Attri)
     Attri:SetPow(Attri:GetPow()-(Attri:GetPow() * 0.05)) 
end


function buff50018Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
