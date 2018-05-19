
--鬼将     
function buff50042Active(buff, Char, Other, Type)  

end

function buff50042Add(buff, Char) 
end

function buff50042Attri(Char, buff, Attri)
     Attri:SetAtk(Attri:GetAtk()-(Attri:GetAtk() * 0.1)) 

end


function buff50042Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
