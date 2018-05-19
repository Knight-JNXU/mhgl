--聚元：正观同尘式
function skill4620Attri(Char, skillLv, Attri) 
	
	    if skillLv == 1 then
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.035);
	    elseif skillLv == 2 then
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.045);
	    elseif skillLv == 3 then
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.055);
		elseif skillLv == 4 then
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.065);
		elseif skillLv == 5 then
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.08);	
        end
	
end
