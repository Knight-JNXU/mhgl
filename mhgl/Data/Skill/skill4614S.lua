--̫�ң���������ʽ
function skill4614Attri(Char, skillLv, Attri) 
	
	    if skillLv == 1 then
		    Attri:SetPow(Attri:GetPow() * 1.09)
			Attri:SetMaxHp(Attri:GetMaxHp() * 0.99); --HP ���޽���1%
	    elseif skillLv == 2 then
		    Attri:SetPow(Attri:GetPow() * 1.10)
			Attri:SetMaxHp(Attri:GetMaxHp() * 0.985);
	    elseif skillLv == 3 then
		    Attri:SetPow(Attri:GetPow() * 1.11)
		    Attri:SetMaxHp(Attri:GetMaxHp() * 0.98);
		elseif skillLv == 4 then
		    Attri:SetPow(Attri:GetPow() * 1.12)
			Attri:SetMaxHp(Attri:GetMaxHp() * 0.975);
		elseif skillLv == 5 then
		    Attri:SetPow(Attri:GetPow() * 1.14)
            Attri:SetMaxHp(Attri:GetMaxHp() * 0.97);			
        end
	
end
