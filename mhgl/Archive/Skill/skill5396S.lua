----攻击加成8.5LV

function skill5396Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 8.5 * Char:GetLevel());
end
