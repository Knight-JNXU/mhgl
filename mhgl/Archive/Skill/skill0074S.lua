--鬼魅身法

function skill0074Attri(Char, skillLv, Attri) 
	local increaseValue = skillLv * 2;
	Attri:SetEva(Attri:GetEva() + increaseValue);
end
