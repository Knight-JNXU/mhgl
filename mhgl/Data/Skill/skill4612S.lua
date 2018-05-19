--太乙：一念圆融式
function skill4612Attri(Char, skillLv, Attri) 
	
	    if skillLv == 1 then
		    Attri:SetPow(Attri:GetPow() * 1.06)
			Attri:SetAtk(Attri:GetAtk() * 1.01); --攻击提高1%
	    elseif skillLv == 2 then
		    Attri:SetPow(Attri:GetPow() * 1.065)
			Attri:SetAtk(Attri:GetAtk() * 1.015);
	    elseif skillLv == 3 then
		    Attri:SetPow(Attri:GetPow() * 1.07)
		    Attri:SetAtk(Attri:GetAtk() * 1.02);
		elseif skillLv == 4 then
		    Attri:SetPow(Attri:GetPow() * 1.08)
			Attri:SetAtk(Attri:GetAtk() * 1.025);
		elseif skillLv == 5 then
		    Attri:SetPow(Attri:GetPow() * 1.09)
            Attri:SetAtk(Attri:GetAtk() * 1.03);			
        end
	
end
