----攻击加成9LV

function skill5397Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 9 * Char:GetLevel());
end
