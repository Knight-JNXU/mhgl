--虚灵功

function skill0116Attri(Char, skillLv, Attri) 
	--local increaseValue = skillLv * 3.36 + 30;
	local increaseValue = 30 + skillLv * 1.6 + 0.01 * skillLv^2;
	Attri:SetAtk(Attri:GetAtk() + increaseValue);
end
