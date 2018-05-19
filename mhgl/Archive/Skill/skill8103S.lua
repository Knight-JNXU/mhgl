--灭青BOSS生命2

function skill8103Attri(Char, skillLv, Attri) 
	local modifyHP = 0.5 + Char:GetLevel() / 40;
	if modifyHP < 1 then
		modifyHP = 1;
	end
	Attri:SetMaxHp(modifyHP * Attri:GetMaxHp());
end
