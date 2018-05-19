----攻击加成25LV

function skill5411Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 25 * Char:GetLevel());
end
