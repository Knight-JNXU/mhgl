----攻击加成15LV

function skill5404Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 15 * Char:GetLevel());
end
