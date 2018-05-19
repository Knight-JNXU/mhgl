----攻击加成40LV

function skill5410Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 40 * Char:GetLevel());
end
