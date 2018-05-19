--修正攻性50

function buff0358Add(buff, Char) 
	
	Char:ModifyElementAttr(0, 50)
	Char:ModifyElementAttr(1, 50)
	Char:ModifyElementAttr(2, 50)
	Char:ModifyElementAttr(3, 50)
	
end

function buff0358Remove(buff, Char) 
	
	Char:ModifyElementAttr(0, -50)
	Char:ModifyElementAttr(1, -50)
	Char:ModifyElementAttr(2, -50)
	Char:ModifyElementAttr(3, -50)
	
end