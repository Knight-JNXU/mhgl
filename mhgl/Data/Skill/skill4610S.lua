--太乙：云絮绵绵式
function skill4610Attri(Char, skillLv, Attri) 
	
	    if skillLv == 1 then
		    Attri:SetPow(Attri:GetPow() * 1.07);--内功提高7%
	    elseif skillLv == 2 then
		    Attri:SetPow(Attri:GetPow() * 1.08);
	    elseif skillLv == 3 then
		    Attri:SetPow(Attri:GetPow() * 1.09);
		elseif skillLv == 4 then
		    Attri:SetPow(Attri:GetPow() * 1.10);
		elseif skillLv == 5 then
		    Attri:SetPow(Attri:GetPow() * 1.12);	
        end
	
end
