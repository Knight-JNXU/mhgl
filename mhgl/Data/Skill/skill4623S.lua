--聚元：天韵灵心式
function skill4623Attri(Char, skillLv, Attri) 
	
	    if skillLv == 1 then
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.03)
			Attri:SetDef(Attri:GetDef() * 1.015); --防御 提高1.5%
	    elseif skillLv == 2 then
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.035)
			Attri:SetDef(Attri:GetDef() * 1.02);
	    elseif skillLv == 3 then
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.04)
		    Attri:SetDef(Attri:GetDef() * 1.025);
		elseif skillLv == 4 then
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.05)
			Attri:SetDef(Attri:GetDef() * 1.03);
		elseif skillLv == 5 then
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.06)
            Attri:SetDef(Attri:GetDef() * 1.04);			
        end
	
end
