
--土攻+BuffValue1

function buff0366Add(buff, Char) 

	Char:ModifyElementAttr(1, buff:GetBuffValue1())
	
end

function buff0366Remove(buff, Char) 
	
	Char:ModifyElementAttr(1, -buff:GetBuffValue1())

end