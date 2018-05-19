

function buff4702Add(buff, Char) 
	local lv = Char:GetLevel()
	Char:ModifyElementAttr(4, lv)
	
end

function buff4702Remove(buff, Char) 
	local lv = Char:GetLevel()
	Char:ModifyElementAttr(4, -lv)
end