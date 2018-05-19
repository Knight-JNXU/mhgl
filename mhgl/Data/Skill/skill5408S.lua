----攻击加成19LV

function skill5408Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 19 * Char:GetLevel());
end
