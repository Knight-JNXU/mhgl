--圣灵心法

function skill0114Attri(Char, skillLv, Attri) 
	--local increaseValue = skillLv * 1.92;
	local increaseValue = skillLv * 0.8 + 0.007 * skillLv^2;
	Attri:SetPow(Attri:GetPow() + increaseValue);
end
