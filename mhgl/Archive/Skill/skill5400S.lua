----攻击加成11LV

function skill5400Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 11 * Char:GetLevel());
end
