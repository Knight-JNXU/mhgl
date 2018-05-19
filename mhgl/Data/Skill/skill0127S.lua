--妙手回春

function skill0127Attri(Char, skillLv, Attri) 
	local increaseValue = skillLv * 2 + skillLv ^ 2 / 100;
	Attri:SetMaxSp(Attri:GetMaxSp() + increaseValue);
end
