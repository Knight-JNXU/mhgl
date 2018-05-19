
--增加土攻 200

function buff0349Add(buff, Char) 

	Char:ModifyElementAttr(1, 200)
	
end

function buff0349Remove(buff, Char) 
	
	Char:ModifyElementAttr(1, -200)
	
end