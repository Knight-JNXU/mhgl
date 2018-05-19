----攻击加成10LV

function skill5399Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 10 * Char:GetLevel());
end
