
--Ð·½«
function buff50021Active(buff, Char, Other, Type)  

end

function buff50021Add(buff, Char) 
end

function buff50021Attri(Char, buff, Attri)
       Attri:SetSpd(Attri:GetSpd()-(Attri:GetSpd() * 0.12)) 
end


function buff50021Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
