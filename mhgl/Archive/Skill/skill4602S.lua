--��һ���������ʽ
function skill4602Attri(Char, skillLv, Attri) 
	
	    if skillLv == 1 then
		    Attri:SetAtk(Attri:GetAtk() * 1.06)
			Attri:SetPow(Attri:GetPow() * 1.01);  --�ڹ����1%
	    elseif skillLv == 2 then
		    Attri:SetAtk(Attri:GetAtk() * 1.065)
			Attri:SetPow(Attri:GetPow() * 1.015);
	    elseif skillLv == 3 then
		    Attri:SetAtk(Attri:GetAtk() * 1.07)
		    Attri:SetPow(Attri:GetPow() * 1.02);
		elseif skillLv == 4 then
		    Attri:SetAtk(Attri:GetAtk() * 1.08)
			Attri:SetPow(Attri:GetPow() * 1.025);
		elseif skillLv == 5 then
		    Attri:SetAtk(Attri:GetAtk() * 1.09)
            Attri:SetPow(Attri:GetPow() * 1.03)	;		
        end
	
end
