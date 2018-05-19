----攻击加成2LV

function skill5383Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 2 * Char:GetLevel());
end
