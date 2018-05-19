

function buff4707Add(buff, Char) 
	local lv = Char:GetLevel()
	Char:ModifyElementAttr(5, lv*2)
	
end

function buff4707Remove(buff, Char) 
	local lv = Char:GetLevel()
	Char:ModifyElementAttr(5, -lv*2)
end