--虎鹤双形

function skill0056Attri(Char, skillLv, Attri) 
	local increaseValue = skillLv * 3.2;
	Attri:SetHit(Attri:GetHit() + increaseValue);
end
