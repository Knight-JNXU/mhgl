--聚元：长生未散式
function skill4624Attri(Char, skillLv, Attri) 
	
	    if skillLv == 1 then
		    Attri:SetPow(Attri:GetPow() * 0.98)
			Attri:SetMaxHp(Attri:GetMaxHp() * 1.05); 
	    elseif skillLv == 2 then
		    Attri:SetPow(Attri:GetPow() * 0.975)
			Attri:SetMaxHp(Attri:GetMaxHp() * 1.06);
	    elseif skillLv == 3 then
		    Attri:SetPow(Attri:GetPow() * 0.97)
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.07);
		elseif skillLv == 4 then
		    Attri:SetPow(Attri:GetPow() * 0.965)
			Attri:SetMaxHp(Attri:GetMaxHp() * 1.08);
		elseif skillLv == 5 then
		    Attri:SetPow(Attri:GetPow() * 0.96)
            Attri:SetMaxHp(Attri:GetMaxHp() * 1.10);			
        end
	
end
