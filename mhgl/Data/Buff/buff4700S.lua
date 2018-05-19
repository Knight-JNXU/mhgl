

function buff4700Add(buff, Char) 
	local lv = Char:GetLevel()
	Char:ModifyElementAttr(7, lv)
	
end

function buff4700Remove(buff, Char) 
	local lv = Char:GetLevel()
	Char:ModifyElementAttr(7, -lv)
end