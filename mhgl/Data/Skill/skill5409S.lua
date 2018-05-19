----攻击加成20LV

function skill5409Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 20 * Char:GetLevel());
end
