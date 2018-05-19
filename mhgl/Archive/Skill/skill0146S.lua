--夺命三煞

function skill0146Attri(Char, skillLv, Attri) 
	local increaseValue = skillLv * 3.2;
	Attri:SetHit(Attri:GetHit() + increaseValue);
end
