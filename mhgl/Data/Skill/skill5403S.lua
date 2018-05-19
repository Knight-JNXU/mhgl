----攻击加成14LV

function skill5403Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 14 * Char:GetLevel());
end
