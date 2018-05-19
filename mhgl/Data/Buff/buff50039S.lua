
--星灵仙子   
function buff50039Active(buff, Char, Other, Type)  

end

function buff50039Add(buff, Char) 
end

function buff50039Attri(Char, buff, Attri)
      Attri:SetPow(Attri:GetPow()+ 10 ) 

end


function buff50039Remove(buff, Char)
	Char:ChangeToMob(0,1)
end
