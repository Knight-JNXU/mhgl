
--Å£Ñý
function buff50016Active(buff, Char, Other, Type)  

end

function buff50016Add(buff, Char) 
end

function buff50016Attri(Char, buff, Attri)
     Attri:SetDef(Attri:GetDef()-(Attri:GetDef() * 0.05)) 
end


function buff50016Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
