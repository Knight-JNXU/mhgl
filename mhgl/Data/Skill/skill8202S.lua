--封测活动BOSS HP*8

function skill8202Attri(Char, skillLv, Attri) 
	local modifyHP = 8;
	Attri:SetMaxHp(modifyHP * Attri:GetMaxHp());
end
