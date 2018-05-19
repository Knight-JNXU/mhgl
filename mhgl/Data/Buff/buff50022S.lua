
--֩�뾫
function buff50022Active(buff, Char, Other, Type)  

end

function buff50022Add(buff, Char) 
end

function buff50022Attri(Char, buff, Attri)
     Attri:SetDef(Attri:GetDef()-(Attri:GetDef() * 0.1)) 
end


function buff50022Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
