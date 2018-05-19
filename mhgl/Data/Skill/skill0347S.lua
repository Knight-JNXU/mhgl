--真·铁布心法

function skill0347Attri(Char, skillLv, Attri) 
	if Char:HasSkill(339) then
		Attri:SetDef(Attri:GetDef() + 15);
	else
		Attri:SetDef(Attri:GetDef() + 45);
	end
end

