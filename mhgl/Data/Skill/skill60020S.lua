--神行身法

function skill60020Attri(Char, skillLv, Attri) 
	local increaseValue2 = skillLv * 1 + 1 * skillLv ^ 2 + 59;
	Attri:SetSpd(Attri:GetSpd() + increaseValue2);
end
