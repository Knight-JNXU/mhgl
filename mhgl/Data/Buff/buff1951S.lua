--土抗增益(地蕴灵璧)

function buff1951Add(buff, Char) 
	
	Char:ModifyElementAttr(5, 10 * buff:GetBuffValue1() + 20);
	
end

function buff1951Remove(buff, Char) 
	
	Char:ModifyElementAttr(5, - (10 * buff:GetBuffValue1() + 20));
	
end
