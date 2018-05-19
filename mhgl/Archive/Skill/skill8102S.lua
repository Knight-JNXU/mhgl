--灭青BOSS生命1

function skill8102Attri(Char, skillLv, Attri) 
	local modifyHP = Char:GetLevel() / 15 + 3;
	--if modifyHP < 5 then
		--modifyHP = 5;
	--end
	Attri:SetMaxHp(modifyHP * Attri:GetMaxHp());
end
