----攻击加成3.5LV

function skill5386Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 3.5 * Char:GetLevel());
end
