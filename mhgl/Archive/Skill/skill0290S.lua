--高级命中闪避修正(真八步赶蝉)

function skill0290Attri(Char, skillLv, Attri) 
	if Char:HasSkill(252) then
		Attri:SetHit(Attri:GetHit() / 1.2 * 1.2);
		Attri:SetEva(Attri:GetEva() / 1.2 * 1.3);	
	else
		Attri:SetHit(Attri:GetHit() * 1.2);
		Attri:SetEva(Attri:GetEva() * 1.3);	
	end	
end
