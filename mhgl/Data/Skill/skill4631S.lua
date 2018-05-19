--ÐþÊ¯¹¦£ºÂÞººÐ¶¾¢Ê½
function skill4631Attri(Char, skillLv, Attri) 
	
	    if skillLv == 1 then
		    Attri:SetPow(Attri:GetPow() * 1.01)
			Attri:SetDef(Attri:GetDef() * 1.06) --·ÀÓù
			Attri:SetHit(Attri:GetHit() * 1.12)
	    elseif skillLv == 2 then
		    Attri:SetPow(Attri:GetPow() * 1.015)
			Attri:SetDef(Attri:GetDef() * 1.07)
			Attri:SetHit(Attri:GetHit() * 1.15)
	    elseif skillLv == 3 then
		    Attri:SetPow(Attri:GetPow() * 1.02)
		    Attri:SetDef(Attri:GetDef() * 1.08)
			Attri:SetHit(Attri:GetHit() * 1.18)
		elseif skillLv == 4 then
		    Attri:SetPow(Attri:GetPow() * 1.025)
			Attri:SetDef(Attri:GetDef() * 1.10)
			Attri:SetHit(Attri:GetHit() * 1.22)
		elseif skillLv == 5 then
		    Attri:SetPow(Attri:GetPow() * 1.03)
            Attri:SetDef(Attri:GetDef() * 1.12)
            Attri:SetHit(Attri:GetHit() * 1.27)				
        end
	
end
