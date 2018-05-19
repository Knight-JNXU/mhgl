----攻击加成4LV

function skill5387Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 4 * Char:GetLevel());
end
