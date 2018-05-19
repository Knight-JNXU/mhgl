----攻击加成3LV

function skill5385Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 3 * Char:GetLevel());
end
