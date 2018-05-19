
--修正攻性 2*lv


function buff0370Add(buff, Char) 
	local lv = Char:GetLevel()
	Char:ModifyElementAttr(0, 2*lv)
	Char:ModifyElementAttr(1, 2*lv)
	Char:ModifyElementAttr(2, 2*lv)
	Char:ModifyElementAttr(3, 2*lv)
	
	
	
end

function buff0370Remove(buff, Char) 
	local lv = Char:GetLevel()
	Char:ModifyElementAttr(0, -2*lv)
	Char:ModifyElementAttr(1, -2*lv)
	Char:ModifyElementAttr(2, -2*lv)
	Char:ModifyElementAttr(3, -2*lv)
end