
--吸血鬼     
function buff50046Active(buff, Char, Other, Type)  

end

function buff50046Add(buff, Char) 
end

function buff50046Attri(Char, buff, Attri)
     Attri:SetSpd(Attri:GetSpd()-(Attri:GetSpd() * 0.05)) 

end


function buff50046Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
