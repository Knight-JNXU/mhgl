--灭青BOSS生命3

function skill8104Attri(Char, skillLv, Attri) 
	local modifyHP = Char:GetLevel() / 4;
	Attri:SetMaxHp(modifyHP * Attri:GetMaxHp());
end
