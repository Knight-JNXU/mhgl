--聚元：神行守正式
function skill4621Attri(Char, skillLv, Attri) 
	
	    if skillLv == 1 then
		    Attri:SetPow(Attri:GetPow() * 1.01)
			Attri:SetMaxHp(Attri:GetMaxHp() * 1.03); --HP上限提高
	    elseif skillLv == 2 then
		    Attri:SetPow(Attri:GetPow() * 1.015)
			Attri:SetMaxHp(Attri:GetMaxHp() * 1.035);
	    elseif skillLv == 3 then
		    Attri:SetPow(Attri:GetPow() * 1.02)
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.04);
		elseif skillLv == 4 then
		    Attri:SetPow(Attri:GetPow() * 1.025)
			Attri:SetMaxHp(Attri:GetMaxHp() * 1.05);
		elseif skillLv == 5 then
		    Attri:SetPow(Attri:GetPow() * 1.03)
            Attri:SetMaxHp(Attri:GetMaxHp() * 1.06);			
        end
	
end
