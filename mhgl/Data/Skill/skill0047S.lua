--流星追月

function skill0047Attri(Char, skillLv, Attri) 
	local increaseValue = skillLv * 2;
	Attri:SetEva(Attri:GetEva() + increaseValue);
end
