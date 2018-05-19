
--雷鸟人
function buff50029Active(buff, Char, Other, Type)  

end

function buff50029Add(buff, Char) 
end

function buff50029Attri(Char, buff, Attri)
  Attri:SetMaxHp(Attri:GetMaxHp()-(Attri:GetMaxHp() * 0.1)) 

end


function buff50029Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
