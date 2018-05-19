----攻击加成18LV

function skill5407Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 18 * Char:GetLevel());
end
