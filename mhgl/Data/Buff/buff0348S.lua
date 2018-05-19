
--增加风攻 200

function buff0348Add(buff, Char) 
	
	Char:ModifyElementAttr(0, 200)

end

function buff0348Remove(buff, Char) 
	
	Char:ModifyElementAttr(0, -200)

end