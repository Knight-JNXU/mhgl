--火抗增益(火云万里)

function buff1953Add(buff, Char) 
	
	Char:ModifyElementAttr(7, 10 * buff:GetBuffValue1() + 20);
	
end

function buff1953Remove(buff, Char) 
	
	Char:ModifyElementAttr(7, - (10 * buff:GetBuffValue1() + 20));
	
end

