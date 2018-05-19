--真·般若心法

function skill0346Attri(Char, skillLv, Attri) 
	if Char:HasSkill(338) then
		Attri:SetAtk(Attri:GetAtk() + 15);
	else
		Attri:SetAtk(Attri:GetAtk() + 45);
	end
end
