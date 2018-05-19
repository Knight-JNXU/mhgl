--五虎断魂

function skill0016Attri(Char, skillLv, Attri) 
	--local increaseValue = skillLv * 4.5;
	local increaseValue = 20 + skillLv * 3.2 + 0.0156 * skillLv^2;
	Attri:SetAtk(Attri:GetAtk() + increaseValue);
end
