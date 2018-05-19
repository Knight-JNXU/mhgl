--降功加闪(真童子功)

function skill0309Attri(Char, skillLv, Attri) 
	if Char:IsBuffExist(2023) then
		Attri:SetEva(Attri:GetEva() * 1.1);		
	else
		Attri:SetEva(Attri:GetEva() * 1.1);	
	end	
end
