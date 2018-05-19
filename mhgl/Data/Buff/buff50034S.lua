
--天将
function buff50034Active(buff, Char, Other, Type)  

end

function buff50034Add(buff, Char) 
end

function buff50034Attri(Char, buff, Attri)
     Attri:SetPow(Attri:GetPow()-(Attri:GetPow() * 0.08)) 

end


function buff50034Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
