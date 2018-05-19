

function buff0340Add(buff, Char) 
	local lv = Char:GetLevel()
	Char:ModifyElementAttr(0, lv*lv*0.03)
	
end

function buff0340Remove(buff, Char) 
	local lv = Char:GetLevel()
	Char:ModifyElementAttr(0, -lv*lv*0.03)
end