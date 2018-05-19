--封测活动BOSS HP*15

function skill8205Attri(Char, skillLv, Attri) 
	local modifyHP = 15;
	Attri:SetMaxHp(modifyHP * Attri:GetMaxHp());
end
