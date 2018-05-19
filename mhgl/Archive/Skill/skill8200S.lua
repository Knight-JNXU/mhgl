--封测活动BOSS HP*0.5

function skill8200Attri(Char, skillLv, Attri) 
	local modifyHP = 0.5;
	Attri:SetMaxHp(modifyHP * Attri:GetMaxHp());
end
