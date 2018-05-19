--太乙：无量气海式
function skill4615Attri(Char, skillLv, Attri) 
	
	    if skillLv == 1 then
		    Attri:SetPow(Attri:GetPow() * 1.09)
			Attri:SetDef(Attri:GetDef() * 0.975); --防御降低2.5%
	    elseif skillLv == 2 then
		    Attri:SetPow(Attri:GetPow() * 1.10)
			Attri:SetDef(Attri:GetDef() * 0.97);
	    elseif skillLv == 3 then
		    Attri:SetPow(Attri:GetPow() * 1.11)
		    Attri:SetDef(Attri:GetDef() * 0.965);
		elseif skillLv == 4 then
		    Attri:SetPow(Attri:GetPow() * 1.12)
			Attri:SetDef(Attri:GetDef() * 0.96);
		elseif skillLv == 5 then
		    Attri:SetPow(Attri:GetPow() * 1.14)
            Attri:SetDef(Attri:GetDef() * 0.95);			
        end
	
end
