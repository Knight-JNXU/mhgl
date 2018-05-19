--流云身法

function skill2400Attri(Char, skillLv, Attri) 
	local increaseValue7 = skillLv * 0.438 + 0.6 * skillLv ^ 0.5;
	local increaseValue2 = skillLv * 2.4 + 0.008 * skillLv ^ 2 + 20;
	local increaseValue3 = skillLv * 2.1 + 0.007 * skillLv ^ 2;
	local increaseValue4 = skillLv * 2.4 + 0.008 * skillLv ^ 2;
	Attri:SetSpd(Attri:GetSpd() + increaseValue7 / 5);
	Attri:SetAtk(Attri:GetAtk() + increaseValue2 / 5);
	Attri:SetPow(Attri:GetPow() + increaseValue3 / 5);
	Attri:SetDef(Attri:GetDef() + increaseValue4 / 5);
end
