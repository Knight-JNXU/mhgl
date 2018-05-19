--迷踪七变

function skill0085Attri(Char, skillLv, Attri) 
	--local increaseValue = skillLv * 6.4;
	local increaseValue = 24 + skillLv * 4.0 + 0.0156 * skillLv^2;
	Attri:SetAtk(Attri:GetAtk() + increaseValue);
end
