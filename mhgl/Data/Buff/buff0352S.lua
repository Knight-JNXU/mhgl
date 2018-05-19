
--修正攻性10


function buff0352Add(buff, Char) 
	
	Char:ModifyElementAttr(0, 10)
	Char:ModifyElementAttr(1, 10)
	Char:ModifyElementAttr(2, 10)
	Char:ModifyElementAttr(3, 10)
	
end

function buff0352Remove(buff, Char) 
	
	Char:ModifyElementAttr(0, -10)
	Char:ModifyElementAttr(1, -10)
	Char:ModifyElementAttr(2, -10)
	Char:ModifyElementAttr(3, -10)
	
end