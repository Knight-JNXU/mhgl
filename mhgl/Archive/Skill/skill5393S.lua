----攻击加成7LV

function skill5393Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 7 * Char:GetLevel());
end
