----攻击加成0.5LV

function skill5380Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 0.5 * Char:GetLevel());
end
