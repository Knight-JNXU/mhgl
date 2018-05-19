
--Ïº±ø
function buff50020Active(buff, Char, Other, Type)  

end

function buff50020Add(buff, Char) 
end

function buff50020Attri(Char, buff, Attri)
     Attri:SetAtk(Attri:GetAtk()-(Attri:GetAtk() * 0.1)) 
end


function buff50020Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
