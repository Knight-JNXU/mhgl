--攻击修正(真漫天血雨)

function skill0302Attri(Char, skillLv, Attri) 
	if Char:HasSkill(264) then
		Attri:SetAtk(Attri:GetAtk() - Char:GetLevel() * 0.52 + Char:GetLevel() * 0.75);
	else
		Attri:SetAtk(Attri:GetAtk() + Char:GetLevel() * 0.75);
	end	
end
