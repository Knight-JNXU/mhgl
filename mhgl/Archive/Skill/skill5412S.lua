---攻击加成30LV
 
function skill5412Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 30 * Char:GetLevel());
	
end
