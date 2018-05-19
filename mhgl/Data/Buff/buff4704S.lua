

function buff4704Add(buff, Char) 
	local lv = Char:GetLevel()
	Char:ModifyElementAttr(7, lv*2)
	
end

function buff4704Remove(buff, Char) 
	local lv = Char:GetLevel()
	Char:ModifyElementAttr(7, -lv*2)
end