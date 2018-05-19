--黄帝内经

function skill0128Attri(Char, skillLv, Attri) 
	--local increaseValue = skillLv * 4.2;
	local increaseValue = 5 + skillLv * 2.4 + 0.01 * skillLv^2;
	Attri:SetAtk(Attri:GetAtk() + increaseValue);
end
