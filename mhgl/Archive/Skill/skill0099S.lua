--罗侯神针

function skill0099Attri(Char, skillLv, Attri) 
	local increaseValue = skillLv * 3.2;
	Attri:SetHit(Attri:GetHit() + increaseValue);
end
