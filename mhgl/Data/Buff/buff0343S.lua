
--Ôö¼Ó»ð¹¥ 0.03*lv^2

function buff0343Add(buff, Char) 
	local lv = Char:GetLevel()
	Char:ModifyElementAttr(3, lv*lv*0.03)
	
end

function buff0343Remove(buff, Char) 
	local lv = Char:GetLevel()
	Char:ModifyElementAttr(3, -lv*lv*0.03)
	
end