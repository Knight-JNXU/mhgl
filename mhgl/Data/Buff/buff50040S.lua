
--芙蓉仙子     
function buff50040Active(buff, Char, Other, Type)  

end

function buff50040Add(buff, Char) 
end

function buff50040Attri(Char, buff, Attri)
      Attri:SetDef(Attri:GetDef()- 30 ) 


end


function buff50040Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
