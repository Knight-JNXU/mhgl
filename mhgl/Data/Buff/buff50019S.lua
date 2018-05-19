
--ÀÇ
function buff50019Active(buff, Char, Other, Type)  

end

function buff50019Add(buff, Char) 
end

function buff50019Attri(Char, buff, Attri)
   Attri:SetMaxHp(Attri:GetMaxHp()-(Attri:GetMaxHp() * 0.1)) 
end


function buff50019Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
