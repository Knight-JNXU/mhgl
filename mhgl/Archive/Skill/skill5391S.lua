----攻击加成6LV

function skill5391Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 6 * Char:GetLevel());
end
