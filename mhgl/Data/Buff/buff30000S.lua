function buff30000Attri(Char, buff, Attri) 
	Char:SetAntiHackEnable2(false)
	Char:SetInitAutoCount(25)	
end

function buff30000Remove(buff, Char)  
	Char:SetAntiHackEnable2(true)
	Char:SetInitAutoCount(25)	
end 