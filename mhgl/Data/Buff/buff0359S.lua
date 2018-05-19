
--修正攻性-40

function buff0359Add(buff, Char) 
	
	Char:ModifyElementAttr(0, -40)
	Char:ModifyElementAttr(1, -40)
	Char:ModifyElementAttr(2, -40)
	Char:ModifyElementAttr(3, -40)
	
end

function buff0359Remove(buff, Char) 
	
	Char:ModifyElementAttr(0, 40)
	Char:ModifyElementAttr(1, 40)
	Char:ModifyElementAttr(2, 40)
	Char:ModifyElementAttr(3, 40)
	
end