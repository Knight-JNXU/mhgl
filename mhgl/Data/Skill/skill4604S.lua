--正一：烨阳不息式
function skill4604Attri(Char, skillLv, Attri) 
	
	    if skillLv == 1 then
		    Attri:SetAtk(Attri:GetAtk() * 1.09)
			Attri:SetPow(Attri:GetPow() * 0.98) --内功降低2%
	    elseif skillLv == 2 then
		    Attri:SetAtk(Attri:GetAtk() * 1.10)
			Attri:SetPow(Attri:GetPow() * 0.975)
	    elseif skillLv == 3 then
		    Attri:SetAtk(Attri:GetAtk() * 1.11)
		    Attri:SetPow(Attri:GetPow() * 0.97)
		elseif skillLv == 4 then
		    Attri:SetAtk(Attri:GetAtk() * 1.12)
			Attri:SetPow(Attri:GetPow() * 0.965)
		elseif skillLv == 5 then
		    Attri:SetAtk(Attri:GetAtk() * 1.14)
            Attri:SetPow(Attri:GetPow() * 0.96)			
        end
	
end
