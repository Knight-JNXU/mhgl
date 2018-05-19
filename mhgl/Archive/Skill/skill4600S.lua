--正一：赤云封日式
function skill4600Attri(Char, skillLv, Attri) 
	
	    if skillLv == 1 then
		    Attri:SetAtk(Attri:GetAtk() * 1.07);--攻击提高7%
	    elseif skillLv == 2 then
		    Attri:SetAtk(Attri:GetAtk() * 1.08);
	    elseif skillLv == 3 then
		   Attri:SetAtk(Attri:GetAtk() * 1.09);
		elseif skillLv == 4 then
		    Attri:SetAtk(Attri:GetAtk() * 1.10);
		elseif skillLv == 5 then
		    Attri:SetAtk(Attri:GetAtk() * 1.12);	
        end
	
end
