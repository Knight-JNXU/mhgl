
--修正攻性20


function buff0354Add(buff, Char) 
	
	Char:ModifyElementAttr(0, 20)
	Char:ModifyElementAttr(1, 20)
	Char:ModifyElementAttr(2, 20)
	Char:ModifyElementAttr(3, 20)
	
end

function buff0354Remove(buff, Char) 
	
	Char:ModifyElementAttr(0, -20)
	Char:ModifyElementAttr(1, -20)
	Char:ModifyElementAttr(2, -20)
	Char:ModifyElementAttr(3, -20)
	
end