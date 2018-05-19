
--基础攻性+lv*lv*0.03

function buff0362Add(buff, Char) 
	local lv = Char:GetLevel()
	Char:ModifyElementAttr(0, lv*lv*0.03)
	Char:ModifyElementAttr(1, lv*lv*0.03)
	Char:ModifyElementAttr(2, lv*lv*0.03)
	Char:ModifyElementAttr(3, lv*lv*0.03)
end

function buff0362Remove(buff, Char) 
	local lv = Char:GetLevel()
	Char:ModifyElementAttr(0, -lv*lv*0.03)
	Char:ModifyElementAttr(1, -lv*lv*0.03)
	Char:ModifyElementAttr(2, -lv*lv*0.03)
	Char:ModifyElementAttr(3, -lv*lv*0.03)
end