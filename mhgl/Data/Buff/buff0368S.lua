
--火攻+BuffValue1

function buff0368Add(buff, Char) 

	Char:ModifyElementAttr(3, buff:GetBuffValue1())
	
end

function buff0368Remove(buff, Char) 
	
	Char:ModifyElementAttr(3, -buff:GetBuffValue1())

end