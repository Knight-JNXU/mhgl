
--修正攻性-30

function buff0357Add(buff, Char) 
	
	Char:ModifyElementAttr(0, -30)
	Char:ModifyElementAttr(1, -30)
	Char:ModifyElementAttr(2, -30)
	Char:ModifyElementAttr(3, -30)
	
end

function buff0357Remove(buff, Char) 
	
	Char:ModifyElementAttr(0, 30)
	Char:ModifyElementAttr(1, 30)
	Char:ModifyElementAttr(2, 30)
	Char:ModifyElementAttr(3, 30)
	
end