
--增加火攻 200

function buff0351Add(buff, Char) 

	Char:ModifyElementAttr(3, 200)
	
end

function buff0351Remove(buff, Char) 
	
	Char:ModifyElementAttr(3, -200)
	
end