--封测活动BOSS HP*18

function skill8206Attri(Char, skillLv, Attri) 
	local modifyHP = 18;
	Attri:SetMaxHp(modifyHP * Attri:GetMaxHp());
end
