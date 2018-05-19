----攻击加成17LV

function skill5406Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 17 * Char:GetLevel());
end
