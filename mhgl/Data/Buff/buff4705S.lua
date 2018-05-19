

function buff4705Add(buff, Char) 
	local lv = Char:GetLevel()
	Char:ModifyElementAttr(6, lv*2)
	
end

function buff4705Remove(buff, Char) 
	local lv = Char:GetLevel()
	Char:ModifyElementAttr(6, -lv*2)
end