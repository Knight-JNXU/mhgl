
--巡游天神     
function buff50041Active(buff, Char, Other, Type)  

end

function buff50041Add(buff, Char) 
end

function buff50041Attri(Char, buff, Attri)
     Attri:SetSpd(Attri:GetSpd()-(Attri:GetSpd() * 0.2)) 

end


function buff50041Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
