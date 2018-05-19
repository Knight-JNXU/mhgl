----攻击加成1.5LV

function skill5382Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 1.5 * Char:GetLevel());
end
