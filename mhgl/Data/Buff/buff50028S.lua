
--古代瑞兽
function buff50028Active(buff, Char, Other, Type)  

end

function buff50028Add(buff, Char) 
end

function buff50028Attri(Char, buff, Attri)
  Attri:SetMaxHp(Attri:GetMaxHp()-(Attri:GetMaxHp() * 0.1)) 

end


function buff50028Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
