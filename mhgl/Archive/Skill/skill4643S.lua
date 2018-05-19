--无我心法：无我无天功
function skill4643Attri(Char, skillLv, Attri) 
	
	    if skillLv == 1 then
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.10)
			Attri:SetMaxSp(Attri:GetMaxSp() * 1.10)
			Attri:SetEva(Attri:GetEva() * 1.10)
			Attri:SetPow(Attri:GetPow() * 1.10)
			Attri:SetDef(Attri:GetDef() * 1.10) 
			Attri:SetHit(Attri:GetHit() * 1.10)			
			Attri:SetAtk(Attri:GetAtk() * 1.10); --提高10%			
        end
end
