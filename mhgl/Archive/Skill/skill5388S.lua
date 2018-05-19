----攻击加成4.5LV

function skill5388Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 4.5 * Char:GetLevel());
end
