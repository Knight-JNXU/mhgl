----攻击加成8LV

function skill5395Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 8 * Char:GetLevel());
end
