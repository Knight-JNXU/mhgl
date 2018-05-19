
--修正攻性 lv 


function buff0370Add(buff, Char) 
	local lv = Char:GetLevel()
	Char:ModifyElementAttr(0, lv)
	Char:ModifyElementAttr(1, lv)
	Char:ModifyElementAttr(2, lv)
	Char:ModifyElementAttr(3, lv)
end

function buff0370Remove(buff, Char) 
	local lv = Char:GetLevel()
	Char:ModifyElementAttr(0, -lv)
	Char:ModifyElementAttr(1, -lv)
	Char:ModifyElementAttr(2, -lv)
	Char:ModifyElementAttr(3, -lv)
end