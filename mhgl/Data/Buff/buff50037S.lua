
--雨师 
function buff50037Active(buff, Char, Other, Type)  

end

function buff50037Add(buff, Char) 
end

function buff50037Attri(Char, buff, Attri)
     Attri:SetPow(Attri:GetPow() + 20 ) 
end


function buff50037Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
