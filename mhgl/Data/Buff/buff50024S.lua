
--ºÚÐÜ¾«
function buff50024Active(buff, Char, Other, Type)  

end

function buff50024Add(buff, Char) 
end

function buff50024Attri(Char, buff, Attri)

     Attri:SetDef(Attri:GetDef()-(Attri:GetDef() * 0.1)) 
end


function buff50024Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
