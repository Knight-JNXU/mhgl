--无我心法：无我无天功
function skill4644Attri(Char, skillLv, Attri) 
	
	    if skillLv == 1 then
		    Attri:SetMaxHp(Attri:GetMaxHp() * 1.20)
			Attri:SetMaxSp(Attri:GetMaxSp() * 1.20)
			Attri:SetEva(Attri:GetEva() * 1.20)
			Attri:SetPow(Attri:GetPow() * 1.20)
			Attri:SetDef(Attri:GetDef() * 1.20) 
			Attri:SetHit(Attri:GetHit() * 1.20)			
			Attri:SetAtk(Attri:GetAtk() * 1.20); --提高20%			
        end
end
