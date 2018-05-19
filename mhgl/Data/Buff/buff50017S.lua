
--Ð¡ÁúÅ®
function buff50017Active(buff, Char, Other, Type)  

end

function buff50017Add(buff, Char) 
end

function buff50017Attri(Char, buff, Attri)
     Attri:SetAtk(Attri:GetAtk()-(Attri:GetAtk() * 0.05)) 

end


function buff50017Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
