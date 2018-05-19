--五行掌法

function skill0028Attri(Char, skillLv, Attri) 
	local increaseValue = skillLv * 3.2;
	Attri:SetHit(Attri:GetHit() + increaseValue);
end
