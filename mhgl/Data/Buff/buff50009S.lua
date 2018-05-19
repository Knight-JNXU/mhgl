
--÷¼÷Ã¹Ö
function buff50009Active(buff, Char, Other, Type)  

end

function buff50009Add(buff, Char) 
end

function buff50009Attri(Char, buff, Attri)
   Attri:SetMaxHp(Attri:GetMaxHp()-(Attri:GetMaxHp() * 0.2)) 
end


function buff50009Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
 