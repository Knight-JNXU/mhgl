
--马面
function buff50027Active(buff, Char, Other, Type)  

end

function buff50027Add(buff, Char) 
end

function buff50027Attri(Char, buff, Attri)
     Attri:SetAtk(Attri:GetAtk()-(Attri:GetAtk() * 0.08)) 
end


function buff50027Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
