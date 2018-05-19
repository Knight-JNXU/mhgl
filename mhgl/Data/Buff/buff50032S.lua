
--黑山老妖
function buff50032Active(buff, Char, Other, Type)  

end

function buff50032Add(buff, Char) 
end

function buff50032Attri(Char, buff, Attri)

       Attri:SetSpd(Attri:GetSpd()-(Attri:GetSpd() * 0.1)) 
end


function buff50032Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
