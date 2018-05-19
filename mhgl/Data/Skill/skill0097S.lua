--淬毒秘术

function skill0097Attri(Char, skillLv, Attri) 
	--local increaseValue = skillLv * 4.5 + 50;
	local increaseValue = 25 + skillLv * 3.2 + 0.007 * skillLv^2;
	Attri:SetAtk(Attri:GetAtk() + increaseValue);
end
