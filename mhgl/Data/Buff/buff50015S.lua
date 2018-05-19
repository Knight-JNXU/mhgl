
--¿œª¢
function buff50015Active(buff, Char, Other, Type)  

end

function buff50015Add(buff, Char) 
end

function buff50015Attri(Char, buff, Attri) 
       Attri:SetSpd(Attri:GetSpd()-(Attri:GetSpd() * 0.1)) 

end


function buff50015Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
