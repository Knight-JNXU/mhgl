----攻击加成16LV

function skill5405Attri(Char, skillLv, Attri) 	
	Attri:SetAtk(Attri:GetAtk() + 16 * Char:GetLevel());
end
