
--水攻+BuffValue1

function buff0367Add(buff, Char) 

	Char:ModifyElementAttr(2, buff:GetBuffValue1())
	
end

function buff0367Remove(buff, Char) 
	
	Char:ModifyElementAttr(2, -buff:GetBuffValue1())

end