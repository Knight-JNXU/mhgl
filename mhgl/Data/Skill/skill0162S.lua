--华陀神术

function skill0162Attri(Char, skillLv, Attri) 
	--local increaseValue = skillLv * 5;
	local increaseValue = 30 + skillLv * 2.4 + 0.0156 * skillLv^2;
	Attri:SetAtk(Attri:GetAtk() + increaseValue);
end
