
--律法女娲     
function buff50043Active(buff, Char, Other, Type)  

end

function buff50043Add(buff, Char) 
end

function buff50043Attri(Char, buff, Attri)
     Attri:SetSpd(Attri:GetSpd()-(Attri:GetSpd() * 0.1)) 


end


function buff50043Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
