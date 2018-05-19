function buff0263Attri(Char, buff, Attri) 
	Char:SetAntiHackEnable(false)
	Char:SetInitAutoCount(30000)	
end

function buff0263Remove(buff, Char)  
	Char:SetAntiHackEnable(true)
	Char:SetInitAutoCount(25)	
end 