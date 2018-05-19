--真·纤月心法

function skill0345Attri(Char, skillLv, Attri) 
	if Char:HasSkill(337) then
		Attri:SetMaxSp(Attri:GetMaxSp() + 25);
	else
		Attri:SetMaxSp(Attri:GetMaxSp() + 75);
	end
end

