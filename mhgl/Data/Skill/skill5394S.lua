----攻击加成7.5LV

function skill5394Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 7.5 * Char:GetLevel());
end
