--封测活动BOSS HP*5

function skill8201Attri(Char, skillLv, Attri) 
	local modifyHP = 5;
	Attri:SetMaxHp(modifyHP * Attri:GetMaxHp());
end
