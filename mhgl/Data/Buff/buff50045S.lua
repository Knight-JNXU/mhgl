
--净瓶女娲     
function buff50045Active(buff, Char, Other, Type)  

end

function buff50045Add(buff, Char) 
end

function buff50045Attri(Char, buff, Attri)
     Attri:SetDef(Attri:GetDef()-(Attri:GetDef() * 0.05)) 

end


function buff50045Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
