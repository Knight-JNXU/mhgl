----攻击加成12LV

function skill5401Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 12 * Char:GetLevel());
end
