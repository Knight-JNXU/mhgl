--降命中(土MOB技能)

function buff1404Attri(Char, buff, Attri) 
	
	Attri:SetHit(Attri:GetHit() * 0.95);
	Attri:SetEva(Attri:GetEva() * 0.95);
	
end
