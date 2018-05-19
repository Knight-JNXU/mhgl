--内功防御修正(真十三太保横练)

function skill0303Attri(Char, skillLv, Attri) 
	if Char:HasSkill(265) then
		Attri:SetDef(Attri:GetDef() - Char:GetLevel() * 0.6 + Char:GetLevel() * 0.8);	
	else
		Attri:SetDef(Attri:GetDef() + Char:GetLevel() * 0.8);
	end		
end
