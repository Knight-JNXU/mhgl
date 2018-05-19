
--¸òó¡¾«
function buff50012Active(buff, Char, Other, Type)  

end

function buff50012Add(buff, Char) 
end

function buff50012Attri(Char, buff, Attri)
     Attri:SetDef(Attri:GetDef()-(Attri:GetDef() * 0.15)) 

end


function buff50012Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
