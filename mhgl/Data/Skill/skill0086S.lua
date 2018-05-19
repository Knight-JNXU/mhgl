--微风凌波

function skill0086Attri(Char, skillLv, Attri) 
	local increaseValue = skillLv * 2;
	Attri:SetEva(Attri:GetEva() + increaseValue);
end
