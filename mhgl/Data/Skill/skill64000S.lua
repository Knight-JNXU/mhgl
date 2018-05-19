--神行身法

function skill64000Attri(Char, skillLv, Attri) 
	local increaseValue2 = skillLv * 1 + 1 * skillLv ^ 2 + 149;
	Attri:SetPow(Attri:GetPow() + increaseValue2);
end
