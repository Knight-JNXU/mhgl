--正一：残阳晚照式
function skill4603Attri(Char, skillLv, Attri) 
	
	    if skillLv == 1 then
		    Attri:SetAtk(Attri:GetAtk() * 1.06)
			Attri:SetDef(Attri:GetDef() * 1.015) --防御提高1.5%
	    elseif skillLv == 2 then
		    Attri:SetAtk(Attri:GetAtk() * 1.065)
			Attri:SetDef(Attri:GetDef() * 1.02)
	    elseif skillLv == 3 then
		    Attri:SetAtk(Attri:GetAtk() * 1.07)
		    Attri:SetDef(Attri:GetDef() * 1.025)
		elseif skillLv == 4 then
		    Attri:SetAtk(Attri:GetAtk() * 1.08)
			Attri:SetDef(Attri:GetDef() * 1.03)
		elseif skillLv == 5 then
		    Attri:SetAtk(Attri:GetAtk() * 1.09)
            Attri:SetDef(Attri:GetDef() * 1.04)			
        end
	
end
