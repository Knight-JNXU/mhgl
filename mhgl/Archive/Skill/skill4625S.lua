--聚元：泽地归元式
function skill4625Attri(Char, skillLv, Attri) 
	
	    if skillLv == 1 then
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.05)
			Attri:SetDef(Attri:GetDef() * 0.975); --防御降低2.5%
	    elseif skillLv == 2 then
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.06)
			Attri:SetDef(Attri:GetDef() * 0.97);
	    elseif skillLv == 3 then
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.07)
		    Attri:SetDef(Attri:GetDef() * 0.965);
		elseif skillLv == 4 then
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.08)
			Attri:SetDef(Attri:GetDef() * 0.96);
		elseif skillLv == 5 then
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.10)
            Attri:SetDef(Attri:GetDef() * 0.95);			
        end
	
end
