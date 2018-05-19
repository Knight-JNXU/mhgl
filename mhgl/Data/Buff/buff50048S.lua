
--地狱战神     
function buff50048Active(buff, Char, Other, Type)  

end

function buff50048Add(buff, Char) 
end

function buff50048Attri(Char, buff, Attri)
  Attri:SetMaxHp(Attri:GetMaxHp()-(Attri:GetMaxHp() * 0.05)) 

end


function buff50048Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
