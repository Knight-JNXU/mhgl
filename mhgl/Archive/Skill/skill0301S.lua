--速度修正(真泛渡银河)

function skill0301Attri(Char, skillLv, Attri) 
	if Char:HasSkill(263) then
		Attri:SetSpd(Attri:GetSpd() / 1.1 * 1.2);	
	else
		Attri:SetSpd(Attri:GetSpd() * 1.2);	
	end
end
