--Õæ¡¤×ß»ğÈëÄ§

function skill0335Attri(Char, skillLv, Attri) 
	if Char:HasSkill(332) then
		Attri:SetSpd(Attri:GetSpd() / 0.9 * 0.8);
	else 
		Attri:SetSpd(Attri:GetSpd() * 0.8);
	end
end
