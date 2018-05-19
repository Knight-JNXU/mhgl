
--修正攻性100


function buff0363Add(buff, Char) 
	
	Char:ModifyElementAttr(0, 100)
	Char:ModifyElementAttr(1, 100)
	Char:ModifyElementAttr(2, 100)
	Char:ModifyElementAttr(3, 100)
	
end

function buff0363Remove(buff, Char) 
	
	Char:ModifyElementAttr(0, -100)
	Char:ModifyElementAttr(1, -100)
	Char:ModifyElementAttr(2, -100)
	Char:ModifyElementAttr(3, -100)
	
end