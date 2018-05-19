
--风波 
function buff50035Active(buff, Char, Other, Type)  

end

function buff50035Add(buff, Char) 
end

function buff50035Attri(Char, buff, Attri)
     Attri:SetDef(Attri:GetDef()-(Attri:GetDef() * 0.05)) 

end


function buff50035Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
