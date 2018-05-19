----攻击加成1LV

function skill5381Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 1 * Char:GetLevel());
end
