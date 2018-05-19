
--修正攻性30

function buff0356Add(buff, Char) 
	
	Char:ModifyElementAttr(0, 30)
	Char:ModifyElementAttr(1, 30)
	Char:ModifyElementAttr(2, 30)
	Char:ModifyElementAttr(3, 30)
	
end

function buff0356Remove(buff, Char) 
	
	Char:ModifyElementAttr(0, -30)
	Char:ModifyElementAttr(1, -30)
	Char:ModifyElementAttr(2, -30)
	Char:ModifyElementAttr(3, -30)
	
end