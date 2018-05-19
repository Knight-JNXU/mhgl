--正一：三阳启泰式
function skill4601Attri(Char, skillLv, Attri) 
	
	    if skillLv == 1 then
		    Attri:SetAtk(Attri:GetAtk() * 1.06)
			Attri:SetMaxHp(Attri:GetMaxHp() * 1.005); --HP 上限提高0.5%
	    elseif skillLv == 2 then
		    Attri:SetAtk(Attri:GetAtk() * 1.065)
			Attri:SetMaxHp(Attri:GetMaxHp() * 1.008);
	    elseif skillLv == 3 then
		    Attri:SetAtk(Attri:GetAtk() * 1.07)
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.012);
		elseif skillLv == 4 then
		    Attri:SetAtk(Attri:GetAtk() * 1.075)
			Attri:SetMaxHp(Attri:GetMaxHp() * 1.016);
		elseif skillLv == 5 then
		    Attri:SetAtk(Attri:GetAtk() * 1.08)
            Attri:SetMaxHp(Attri:GetMaxHp() * 1.020);			
        end
	
end
