--毒转乾坤

function skill0147Attri(Char, skillLv, Attri) 
	--local increaseValue = skillLv * 4.2 + 30;
	--local increaseValue = 50 + skillLv * 4.0 + 0.0156 * skillLv^2;
	local increaseValue = 50 + skillLv * 3.2 + 0.007 * skillLv^2;
	
	Attri:SetAtk(Attri:GetAtk() + increaseValue);
end
