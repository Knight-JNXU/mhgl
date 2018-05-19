--真·蔷薇心法

function skill0344Attri(Char, skillLv, Attri) 
	if Char:HasSkill(336) then
		Attri:SetMaxHp(Attri:GetMaxHp() + 50);
	else
		Attri:SetMaxHp(Attri:GetMaxHp() + 150);
	end
end
