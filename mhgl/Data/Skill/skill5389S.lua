----攻击加成5LV

function skill5389Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 5 * Char:GetLevel());
end
