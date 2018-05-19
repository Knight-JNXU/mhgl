--太乙：意守乾坤式
function skill4613Attri(Char, skillLv, Attri) 
	
	    if skillLv == 1 then
		    Attri:SetPow(Attri:GetPow() * 1.06)
			Attri:SetDef(Attri:GetDef() * 1.015); --防御 提高1.5%
	    elseif skillLv == 2 then
		    Attri:SetPow(Attri:GetPow() * 1.065)
			Attri:SetDef(Attri:GetDef() * 1.02);
	    elseif skillLv == 3 then
		    Attri:SetPow(Attri:GetPow() * 1.07)
		    Attri:SetDef(Attri:GetDef() * 1.025);
		elseif skillLv == 4 then
		    Attri:SetPow(Attri:GetPow() * 1.08)
			Attri:SetDef(Attri:GetDef() * 1.03);
		elseif skillLv == 5 then
		    Attri:SetPow(Attri:GetPow() * 1.09)
            Attri:SetDef(Attri:GetDef() * 1.04);			
        end
	
end
