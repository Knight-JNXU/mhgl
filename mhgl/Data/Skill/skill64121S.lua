--攻击修正(真漫天血雨)

function skill64121Attri(Char, skillLv, Attri) 
	if Char:HasSkill(302) then
		Attri:SetAtk(Attri:GetAtk() - Char:GetLevel() * 0.52 + Char:GetLevel() * 0.95);
	else
		Attri:SetAtk(Attri:GetAtk() + Char:GetLevel() * 4.00);
	end	
end
