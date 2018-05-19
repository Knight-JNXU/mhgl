--神行身法

function skill64100Attri(Char, skillLv, Attri) 
	local increaseValue2 = skillLv * 1 + 1 * skillLv ^ 2 + 199;
	Attri:SetAtk(Attri:GetAtk() + increaseValue2);
end
