--天罡真气

function skill0001Attri(Char, skillLv, Attri) 
	--local increaseValue = skillLv * 4.2;
	local increaseValue = 32 + skillLv * 3.2 + 0.0156 * skillLv^2;
	Attri:SetAtk(Attri:GetAtk() + increaseValue);
end
