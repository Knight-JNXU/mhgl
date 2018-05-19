

function buff4703Add(buff, Char) 
	local lv = Char:GetLevel()
	Char:ModifyElementAttr(5, lv)
	
end

function buff4703Remove(buff, Char) 
	local lv = Char:GetLevel()
	Char:ModifyElementAttr(5, -lv)
end