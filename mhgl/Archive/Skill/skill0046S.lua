--醉斩天魔

function skill0046Attri(Char, skillLv, Attri) 
	local increaseValue = skillLv * 3.2;
	Attri:SetHit(Attri:GetHit() + increaseValue);
end
