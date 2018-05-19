
--修正攻性40

function buff0358Add(buff, Char) 
	
	Char:ModifyElementAttr(0, 40)
	Char:ModifyElementAttr(1, 40)
	Char:ModifyElementAttr(2, 40)
	Char:ModifyElementAttr(3, 40)
	
end

function buff0358Remove(buff, Char) 
	
	Char:ModifyElementAttr(0, -40)
	Char:ModifyElementAttr(1, -40)
	Char:ModifyElementAttr(2, -40)
	Char:ModifyElementAttr(3, -40)
	
end