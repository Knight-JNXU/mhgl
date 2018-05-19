--真·七虹御气

function skill4543Attri(Char, skillLv, Attri) 
	if Char:HasSkill(4542) then
		Attri:SetMaxHp(Attri:GetMaxHp() * 1.15 / 1.1);
	else
		Attri:SetMaxHp(Attri:GetMaxHp() * 1.15);
	end
end
