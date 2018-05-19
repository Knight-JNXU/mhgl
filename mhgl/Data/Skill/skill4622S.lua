--聚元：妙法有源式
function skill4622Attri(Char, skillLv, Attri) 
	
	    if skillLv == 1 then
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.03)
			Attri:SetAtk(Attri:GetAtk() * 1.01); --攻击提高1%
	    elseif skillLv == 2 then
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.035)
			Attri:SetAtk(Attri:GetAtk() * 1.015);
	    elseif skillLv == 3 then
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.04)
		    Attri:SetAtk(Attri:GetAtk() * 1.02);
		elseif skillLv == 4 then
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.05)
			Attri:SetAtk(Attri:GetAtk() * 1.025);
		elseif skillLv == 5 then
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.06)
            Attri:SetAtk(Attri:GetAtk() * 1.03);			
        end
	
end
