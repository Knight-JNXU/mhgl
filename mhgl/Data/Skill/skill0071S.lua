--亡魂绝命

function skill0071Attri(Char, skillLv, Attri) 
	--local increaseValue = skillLv * 5.76;
	local increaseValue = 38 + skillLv * 3.2 + 0.01 * skillLv^2;
	Attri:SetAtk(Attri:GetAtk() + increaseValue);
end
