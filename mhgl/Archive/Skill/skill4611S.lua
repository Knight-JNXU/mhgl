--太乙：气游天地式
function skill4611Attri(Char, skillLv, Attri) 
	
	    if skillLv == 1 then
		    Attri:SetPow(Attri:GetPow() * 1.06)
			Attri:SetMaxHp(Attri:GetMaxHp() * 1.005); --HP上限提高0.5%
	    elseif skillLv == 2 then
		    Attri:SetPow(Attri:GetPow() * 1.065)
			Attri:SetMaxHp(Attri:GetMaxHp() * 1.008);
	    elseif skillLv == 3 then
		    Attri:SetPow(Attri:GetPow() * 1.07)
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.012);
		elseif skillLv == 4 then
		    Attri:SetPow(Attri:GetPow() * 1.075)
			Attri:SetMaxHp(Attri:GetMaxHp() * 1.016);
		elseif skillLv == 5 then
		    Attri:SetPow(Attri:GetPow() * 1.08)
            Attri:SetMaxHp(Attri:GetMaxHp() * 1.020);			
        end
	
end
