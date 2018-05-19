

function buff4706Add(buff, Char) 
	local lv = Char:GetLevel()
	Char:ModifyElementAttr(4, lv*2)
	
end

function buff4706Remove(buff, Char) 
	local lv = Char:GetLevel()
	Char:ModifyElementAttr(4, -lv*2)
end