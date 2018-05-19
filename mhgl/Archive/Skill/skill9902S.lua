--神行身法

function skill9902Attri(Char, skillLv, Attri) 
	local increaseValue1 = skillLv * 1.6 + 0.006 * skillLv ^ 2;
	local increaseValue2 = skillLv * 2.4 + 0.008 * skillLv ^ 2 + 20;
	local increaseValue3 = skillLv * 2.2 + 0.008 * skillLv ^ 2;
	local increaseValue4 = skillLv * 2.6 + 0.009 * skillLv ^ 2;
	Attri:SetEva(Attri:GetEva() + increaseValue1 / 5);
	Attri:SetAtk(Attri:GetAtk() + increaseValue2 / 5);
	Attri:SetPow(Attri:GetPow() + increaseValue3 / 5);
	Attri:SetDef(Attri:GetDef() + increaseValue4 / 5);
end
