--宁神静气

function skill0045Attri(Char, skillLv, Attri) 
	--local increaseValue = skillLv * 1.92;
	local increaseValue = skillLv * 0.8 + 0.007 * skillLv^2;
	Attri:SetPow(Attri:GetPow() + increaseValue);
end
