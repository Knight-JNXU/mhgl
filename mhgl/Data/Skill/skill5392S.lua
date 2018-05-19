----攻击加成6.5LV

function skill5392Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 6.5 * Char:GetLevel());
end
