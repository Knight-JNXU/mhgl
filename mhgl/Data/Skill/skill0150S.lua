--毒经

function skill0150Attri(Char, skillLv, Attri) 
	--local increaseValue = skillLv * 3.36;
	local increaseValue = skillLv * 1.6 + 0.01 * skillLv^2;
	Attri:SetDef(Attri:GetDef() + increaseValue);
end
