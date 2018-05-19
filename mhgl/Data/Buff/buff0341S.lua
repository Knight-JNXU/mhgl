

function buff0341Add(buff, Char) 
	local lv = Char:GetLevel()
	Char:ModifyElementAttr(1, lv*lv*0.03)
	
end

function buff0341Remove(buff, Char) 
	local lv = Char:GetLevel()
	Char:ModifyElementAttr(1, -lv*lv*0.03)
	
end