----攻击加成5.5LV

function skill5390Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 5.5 * Char:GetLevel());
end
