--天绝地灭

function skill0043Attri(Char, skillLv, Attri) 
	--local increaseValue = skillLv * 5.76;
	local increaseValue = 20 + skillLv * 4.0 + 0.0156 * skillLv^2;
	Attri:SetAtk(Attri:GetAtk() + increaseValue);
end
