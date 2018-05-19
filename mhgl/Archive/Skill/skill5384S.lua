----攻击加成2.5LV

function skill5384Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 2.5 * Char:GetLevel());
end
