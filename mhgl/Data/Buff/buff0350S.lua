
--增加水攻 200

function buff0350Add(buff, Char) 

	Char:ModifyElementAttr(2, 200)
	
end

function buff0350Remove(buff, Char) 
	
	Char:ModifyElementAttr(2, -200)
	
end