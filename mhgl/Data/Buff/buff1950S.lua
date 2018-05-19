--风抗增益(流风余韵)

function buff1950Add(buff, Char) 
	
	Char:ModifyElementAttr(4, 10 * buff:GetBuffValue1() + 20);
	
end

function buff1950Remove(buff, Char) 
	
	Char:ModifyElementAttr(4, - (10 * buff:GetBuffValue1() + 20));
	
end
