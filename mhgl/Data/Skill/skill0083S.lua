--点血截脉

function skill0083Attri(Char, skillLv, Attri) 
	local increaseValue = skillLv * 4 + skillLv ^ 2 / 64 ;
	Attri:SetMaxHp(Attri:GetMaxHp() + increaseValue);
end
