

function buff4701Add(buff, Char) 
	local lv = Char:GetLevel()
	Char:ModifyElementAttr(6, lv)
	
end

function buff4701Remove(buff, Char) 
	local lv = Char:GetLevel()
	Char:ModifyElementAttr(6, -lv)
end