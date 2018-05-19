--ÕýÒ»£º¾ÅÑô¾ÛÒ»Ê½
function skill4605Attri(Char, skillLv, Attri) 
	
	    if skillLv == 1 then
		    Attri:SetAtk(Attri:GetAtk() * 1.09)
			Attri:SetDef(Attri:GetDef() * 0.975) --·ÀÓù½µµÍ2.5%
	    elseif skillLv == 2 then
		    Attri:SetAtk(Attri:GetAtk() * 1.10)
			Attri:SetDef(Attri:GetDef() * 0.97)
	    elseif skillLv == 3 then
		    Attri:SetAtk(Attri:GetAtk() * 1.11)
		    Attri:SetDef(Attri:GetDef() * 0.965)
		elseif skillLv == 4 then
		    Attri:SetAtk(Attri:GetAtk() * 1.12)
			Attri:SetDef(Attri:GetDef() * 0.96)
		elseif skillLv == 5 then
		    Attri:SetAtk(Attri:GetAtk() * 1.14)
            Attri:SetDef(Attri:GetDef() * 0.95)			
        end
	
end
