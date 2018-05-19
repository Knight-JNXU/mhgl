--水抗增益(细雨如愁)

function buff1952Add(buff, Char) 
	
	Char:ModifyElementAttr(6, 10 * buff:GetBuffValue1() + 20);
	
end

function buff1952Remove(buff, Char) 
	
	Char:ModifyElementAttr(6, - (10 * buff:GetBuffValue1() + 20));
	
end

