
--修正攻性200


function buff0364Add(buff, Char) 
	
	Char:ModifyElementAttr(0, 200)
	Char:ModifyElementAttr(1, 200)
	Char:ModifyElementAttr(2, 200)
	Char:ModifyElementAttr(3, 200)
	
end

function buff0364Remove(buff, Char) 
	
	Char:ModifyElementAttr(0, -200)
	Char:ModifyElementAttr(1, -200)
	Char:ModifyElementAttr(2, -200)
	Char:ModifyElementAttr(3, -200)
	
end