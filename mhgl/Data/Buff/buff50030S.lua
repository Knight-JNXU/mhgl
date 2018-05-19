
--蝴蝶仙子
function buff50030Active(buff, Char, Other, Type)  

end

function buff50030Add(buff, Char) 
end

function buff50030Attri(Char, buff, Attri)

     Attri:SetDef(Attri:GetDef()-(Attri:GetDef() * 0.1)) 
end


function buff50030Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
