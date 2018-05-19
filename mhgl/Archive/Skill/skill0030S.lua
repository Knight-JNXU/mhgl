--乾坤五行

function skill0030Attri(Char, skillLv, Attri) 
	--local increaseValue = skillLv * 4.2 + 25;
	local increaseValue = 20 + skillLv * 2.4 + 0.01 * skillLv^2;
	Attri:SetAtk(Attri:GetAtk() + increaseValue);
end
