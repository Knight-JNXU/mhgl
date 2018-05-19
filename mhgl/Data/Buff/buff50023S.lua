
--½©Ê¬
function buff50023Active(buff, Char, Other, Type)  

end

function buff50023Add(buff, Char) 
end

function buff50023Attri(Char, buff, Attri)

  Attri:SetMaxHp(Attri:GetMaxHp()+(Attri:GetMaxHp() * 0.1)) 
end


function buff50023Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
