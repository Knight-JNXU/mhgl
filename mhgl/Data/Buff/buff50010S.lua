
--ÑòÍ·¹Ö
function buff50010Active(buff, Char, Other, Type)  

end

function buff50010Add(buff, Char) 
end

function buff50010Attri(Char, buff, Attri)
   Attri:SetMaxHp(Attri:GetMaxHp()-(Attri:GetMaxHp() * 0.1)) 

end


function buff50010Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
