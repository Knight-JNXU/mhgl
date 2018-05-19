--麒麟发怒1效果

function buff1527Attri(Char, buff, Attri)
	if Char:IsMob() then
		Attri:SetAtk(Attri:GetAtk() * 1.3)
		Attri:SetDef(Attri:GetDef() * 1.3)
		Attri:SetPow(Attri:GetPow() * 1.3)
	end
end 