--ÉñÂö¾÷£º·ÉÁ«Ì¤ÀËÊ½
function skill4642Attri(Char, skillLv, Attri) 
	
	    if skillLv == 1 then
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.005)
			Attri:SetMaxSp(Attri:GetMaxSp() * 1.08)
			Attri:SetEva(Attri:GetEva() * 1.09)
	    elseif skillLv == 2 then
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.008)
			Attri:SetMaxSp(Attri:GetMaxSp() * 1.09)
			Attri:SetEva(Attri:GetEva() * 1.11)
	    elseif skillLv == 3 then
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.012)
		    Attri:SetMaxSp(Attri:GetMaxSp() * 1.11)
			Attri:SetEva(Attri:GetEva() * 1.14)
		elseif skillLv == 4 then
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.016)
			Attri:SetMaxSp(Attri:GetMaxSp() * 1.14)
			Attri:SetEva(Attri:GetEva() * 1.17)
		elseif skillLv == 5 then
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.020)
            Attri:SetMaxSp(Attri:GetMaxSp() * 1.17)
			Attri:SetEva(Attri:GetEva() * 1.21)			
        end
	
end
