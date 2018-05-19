
--ºüÀê¾«
function buff50013Active(buff, Char, Other, Type)  

end

function buff50013Add(buff, Char) 
end

function buff50013Attri(Char, buff, Attri)
   Attri:SetMaxHp(Attri:GetMaxHp()-(Attri:GetMaxHp() * 0.05)) 
end


function buff50013Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
