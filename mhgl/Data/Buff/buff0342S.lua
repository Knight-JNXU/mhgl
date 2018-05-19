

function buff0342Add(buff, Char) 
	local lv = Char:GetLevel()
	Char:ModifyElementAttr(2, lv*lv*0.03)
	
end

function buff0342Remove(buff, Char) 
	local lv = Char:GetLevel()
	Char:ModifyElementAttr(2, -lv*lv*0.03)
	
end