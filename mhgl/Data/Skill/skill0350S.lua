--真·菩提心法

function skill0350Attri(Char, skillLv, Attri) 
	if Char:HasSkill(342) then
		Attri:SetPow(Attri:GetPow() + 10);
	else
		Attri:SetPow(Attri:GetPow() + 30);
	end
end

