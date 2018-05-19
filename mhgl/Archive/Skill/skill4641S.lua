--神脉诀：鱼影游踪式
function skill4641Attri(Char, skillLv, Attri) 
	
	    if skillLv == 1 then
		    Attri:SetMaxSp(Attri:GetMaxSp() * 1.08)
			Attri:SetEva(Attri:GetEva() * 1.09)
			Attri:SetPow(Attri:GetPow() * 1.01)
			
	    elseif skillLv == 2 then
		    Attri:SetMaxSp(Attri:GetMaxSp() * 1.09)
			Attri:SetEva(Attri:GetEva() * 1.11)
		    Attri:SetPow(Attri:GetPow() * 1.015)
			
	    elseif skillLv == 3 then
		    Attri:SetMaxSp(Attri:GetMaxSp() * 1.11)
			Attri:SetEva(Attri:GetEva() * 1.14)
		    Attri:SetPow(Attri:GetPow() * 1.02)
		    
		elseif skillLv == 4 then
		    Attri:SetMaxSp(Attri:GetMaxSp() * 1.14)
			Attri:SetEva(Attri:GetEva() * 1.17)
		    Attri:SetPow(Attri:GetPow() * 1.025)
			
		elseif skillLv == 5 then
		    Attri:SetMaxSp(Attri:GetMaxSp() * 1.17)
			Attri:SetEva(Attri:GetEva() * 1.21)
		    Attri:SetPow(Attri:GetPow() * 1.03)
            			
        end
	
end
