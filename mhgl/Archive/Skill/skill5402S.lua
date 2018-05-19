----攻击加成13LV

function skill5402Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 13 * Char:GetLevel());
end
