-- 神行天下

function skill0006Attri(Char, skillLv, Attri) 
	local increaseValue = skillLv * 2;
	Attri:SetEva(Attri:GetEva() + increaseValue);
end
