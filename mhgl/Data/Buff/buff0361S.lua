
--修正攻性-50

function buff0359Add(buff, Char) 
	
	Char:ModifyElementAttr(0, -50)
	Char:ModifyElementAttr(1, -50)
	Char:ModifyElementAttr(2, -50)
	Char:ModifyElementAttr(3, -50)
	
end

function buff0359Remove(buff, Char) 
	
	Char:ModifyElementAttr(0, 50)
	Char:ModifyElementAttr(1, 50)
	Char:ModifyElementAttr(2, 50)
	Char:ModifyElementAttr(3, 50)
	
end