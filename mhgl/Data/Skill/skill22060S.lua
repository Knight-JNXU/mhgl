--·çÔÆ¾÷

function skill22060Attri(Char, skillLv, Attri) 
	local increaseValue1 = skillLv * 1.5 + 0.005 * skillLv ^ 2.5 + 10;
	local increaseValue2 = skillLv * 2.4 + 0.008 * skillLv ^ 2.5 + 10;
	local increaseValue3 = skillLv * 2.1 + 0.007 * skillLv ^ 2.5 + 10;
	local increaseValue4 = skillLv * 2.4 + 0.008 * skillLv ^ 2.5 + 10;
	Attri:SetEva(Attri:GetEva() + increaseValue1 / 4);
	Attri:SetAtk(Attri:GetAtk() + increaseValue2 / 4);
	Attri:SetPow(Attri:GetPow() + increaseValue3 / 4);
	Attri:SetDef(Attri:GetDef() + increaseValue4 / 4);
end
