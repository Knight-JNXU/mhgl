
--风攻+BuffValue1

function buff0365Add(buff, Char) 

	Char:ModifyElementAttr(0, buff:GetBuffValue1())
	
end

function buff0365Remove(buff, Char) 
	
	Char:ModifyElementAttr(0, -buff:GetBuffValue1())

end